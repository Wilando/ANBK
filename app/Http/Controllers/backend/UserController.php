<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Intervention\Image\Facades\Image;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:superadmin|admin'])->only(['index', 'store', 'update', 'destroy', 'bulkDelete', 'bulkUpdate']);
        $this->roles_check = ['superadmin|admin'];
    }

    public function datatable(Request $request)
    {
        // $data = User::query();

        $arraynotInrole = ['peternak'];
        if (!xhasRole('superadmin')) {
            $arraynotInrole = ['superadmin','peternak'];
        }

        $eloUserNotSuper = User::whereHas('roles', function ($q) use ($arraynotInrole) {
            $q->whereNotIn('name', $arraynotInrole);
        });
        $data = $eloUserNotSuper;

        $role_id = $request->get('role_id');
        if ($role_id != '') {
            $data->role($role_id);
        }

        $created_by = $request->get('created_by');
        if ($created_by != '') {
            $data->where('created_by', $created_by);
        }

        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        if ($mulai && $selesai) {
            $data->whereBetween('created_at', [$mulai, $selesai]);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })->addColumn('list_roles', function ($item) {
                return $item->getRoleNames() ? implode(',', $item->getRoleNames()->toArray()) : '';
            })
            ->escapeColumns([])
            ->toJson();
    }

    public function index(Request $request)
    {
        $instansi_id = env("INSTANSI_ID", '');
        $instansi_name = env("INSTANSI_NAME", '');
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'name';
        $role = $request->get('role') ?? null;
        $user = User::query();
        if ($instansi_id != '') {
            $user->where('instansi_id', $instansi_id);
        }

        if ($instansi_name != '') {
            $user->where('instansi_name', $instansi_name);
        }
        if (!xhasRole('superadmin')) {
            $eloUserNotSuper = User::whereHas('roles', function ($q) {
                $q->whereNotIn('name', ['superadmin']);
            });
            $user = $eloUserNotSuper;
        }
        if ($role) {
            $user->role($role);
        }
        if ($search != null) {
            $user = $user->where($columnSearch, 'like', '%' . $search . '%');
        }
        $user = $user->orderBy($sort, $order)->paginate($per_page);
        $user->onEachSide(0)->links();
        $user = $user->through(function ($item) {
            $item->list_roles = $item->getRoleNames() ? implode(',', $item->getRoleNames()->toArray()) : '';

            return $item;
        });
        $res['message'] = 'user berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $user;

        return response()->json($res, Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $rule = [
            'name' => 'required',
            'username' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8',
            'roles' => 'required',
        ];
        if ($request->hasFile('avatar')) {
            $rule['avatar'] = 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048';
        }
        $validator = Validator::make($request->all(), $rule);

        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            //            return response()->json($validator->errors(), 422);
        }
        DB::beginTransaction();
        $instansi_id = env("INSTANSI_ID", '');
        $instansi_name = env("INSTANSI_NAME", '');
        try {
            $dataUser = [
                'name' => $request->name,
                'email' => $request->email,
                'is_active' => $request->is_active,
                'username' => $request->username,
                'password' => Hash::make($request->password),
                'instansi_id' => $instansi_id,
                'instansi_name' => $instansi_name,
            ];

            $hashImage = null;
            $thumbFile = null;
            if ($request->hasFile('avatar')) {
                $image = $request->file('avatar');
                $hashImage = $image->hashName();
                $thumbFile = 'thumb_' . $hashImage;

                $dataUser['avatar'] = 'users/' . $hashImage;
                $dataUser['avatar_thumb'] = 'users/' . $thumbFile;
            }

            $user = User::create($dataUser);

            $user->assignRole($request->input('roles'));

            if ($request->hasFile('avatar')) {
                if ($user) {
                    $fileimage = $request->file('avatar');
                    $fileimage->storeAs('public/users', $hashImage);
                    $filethumbnail = Image::make($fileimage)
                        ->fit(200, 200)
                        ->encode('jpg', 80);
                    $thumbnailPath = 'users/' . $thumbFile;
                    Storage::disk('public')->put($thumbnailPath, $filethumbnail);
                }
            }

            $newAttributes = $user->getAttributes();

            $exceptproLog = ['password', 'remember_token', 'email_verified_at'];

            foreach ($exceptproLog as $attribute) {
                unset($newAttributes[$attribute]);
            }

            $properties = [
                'new' => $newAttributes,
            ];

            activity()
                ->useLog('user')
                ->causedBy(auth()->user())
                ->performedOn($user)
                ->withProperties($properties)
                ->event('created')
                ->log('menambahkan data pengguna ' . $user->name);

            DB::commit();

            $res['message'] = 'data pengguna berhasil ditambahkan';
            $res['success'] = true;
            $res['data'] = $user;

            return response()->json($res, Response::HTTP_CREATED);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();

            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal ditambahkan ' . $e;
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function show(User $user)
    {
        if (!Auth::user()->hasAnyRole($this->roles_check)) {
            $user = $user->where('is_active', 1)->first();
        }
        $res['message'] = 'data pengguna berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $user;

        return response()->json($res, Response::HTTP_OK);
    }

    public function update(Request $request, $id)
    {
        $user = User::findorFail($id);
        $oldAttributes = $user->getOriginal();

        $rule = [
            'username' => 'required|string|unique:users,username,' . $user->id,
            'email' => 'required|email|unique:users,email,' . $user->id,
            'name' => 'required',
            'roles' => 'required',
            'password' => 'confirmed|nullable',
        ];
        if ($request->hasFile('avatar')) {
            $rule['avatar'] = 'image|mimes:jpeg,png,jpg,gif,svg|max:2048';
        }
        $validator = Validator::make($request->all(), $rule);

        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            //            return response()->json($validator->errors(), 422);
        }

        DB::beginTransaction();

        try {
            $hashImage = $user->image;
            $thumbFile = $user->thumbnail;
            $oldImage = $hashImage;
            $oldThumb = $thumbFile;
            $instansi_id = env("INSTANSI_ID", '');
            $instansi_name = env("INSTANSI_NAME", '');
            $dataUpdate = [
                'name' => $request->name,
                'is_active' => $request->is_active,
                'email' => $request->email,
                'username' => $request->username,
                'instansi_id' => $instansi_id,
                'instansi_name' => $instansi_name,
            ];

            if ($request->hasFile('avatar')) {
                $image = $request->file('avatar');
                $hashImage = $image->hashName();
                $thumbFile = 'thumb_' . $hashImage;
                $dataUpdate['avatar'] = 'users/' . $hashImage;
                $dataUpdate['avatar_thumb'] = 'users/' . $thumbFile;
            }

            if ($request->input('password')) {
                $dataUpdate['password'] = Hash::make($request->password);
            }

            $update = $user->update($dataUpdate);

            if ($request->hasFile('avatar')) {
                if ($update) {
                    $fileimage = $request->file('avatar');
                    $fileimage->storeAs('public/users', $hashImage);
                    $filethumbnail = Image::make($fileimage)
                        ->fit(200, 200)
                        ->encode('jpg', 80);
                    $thumbnailPath = 'users/' . $thumbFile;
                    Storage::disk('public')->put($thumbnailPath, $filethumbnail);

                    $fileimage = Storage::disk('public')->path('users/' . $oldImage);
                    if (file_exists($fileimage)) {
                        Storage::delete('public/users/' . $oldImage);
                    }

                    $filethumb = Storage::disk('public')->path('users/' . $oldThumb);
                    if (file_exists($filethumb)) {
                        Storage::delete('public/users/' . $oldThumb);
                    }
                }
            }

            $changes = $user->getChanges();
            if (!empty($changes)) {
                $newAttributes = $user->getAttributes();
                $exceptproLog = ['password', 'remember_token', 'email_verified_at'];

                foreach ($exceptproLog as $attribute) {
                    unset($oldAttributes[$attribute]);
                    unset($newAttributes[$attribute]);
                }
                $properties = [
                    'old' => $oldAttributes,
                    'new' => $newAttributes,
                ];

                activity()
                    ->useLog('user')
                    ->causedBy(auth()->user())
                    ->performedOn($user)
                    ->withProperties($properties)
                    ->event('updated')
                    ->log('memperbarui  data pengguna ' . $user->name);
            }

            DB::table('model_has_roles')->where('model_id', $user->id)->delete();
            $user->assignRole($request->input('roles'));
            DB::commit();
            $res['message'] = 'data pengguna berhasil diperbarui';
            $res['success'] = true;
            $res['data'] = $user;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal diperbarui';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function destroy($id)
    {
        $user = User::findorFail($id);
        $oldAttributes = $user->getOriginal();
        $oldImage = $user->image;
        $oldThumb = $user->thumbnail;

        DB::beginTransaction();
        try {
            $deleted = $user->delete();
            if ($deleted) {
                $fileimage = Storage::disk('public')->path('user/' . $oldImage);
                if (file_exists($fileimage)) {
                    Storage::delete('public/users/' . $oldImage);
                }

                $filethumb = Storage::disk('public')->path('user/' . $oldThumb);
                if (file_exists($filethumb)) {
                    Storage::delete('public/users/' . $oldThumb);
                }

                $changes = $user->getChanges();
                $properties['old'] = $oldAttributes;
                if (!empty($changes)) {
                    $newAttributes = $user->getAttributes();
                    $properties['new'] = $newAttributes;
                }

                activity()
                    ->useLog('user')
                    ->causedBy(auth()->user())
                    ->performedOn($user)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('hapus data pengguna ' . $user->name);
            }

            DB::commit();
            $res['message'] = 'data pengguna berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal dihapus';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function bulkDelete(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:users,id',
        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            //            return response()->json($validator->errors(), 422);
        }
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $arrayImage = [];
            foreach ($ids as $id) {
                $dataUser = User::findOrfail($id);
                $oldImage = $dataUser->image;
                $oldThumb = $dataUser->thumbnail;

                if ($dataUser) {
                    //                    $arrayImage['oldImage'][] = $oldImage;
                    //                    $arrayImage['oldThumb'][] = $oldThumb;
                    $arrayImage[] = $oldImage;
                    $arrayImage[] = $oldThumb;

                    $properties['old'] = $dataUser->getOriginal();
                    activity()
                        ->useLog('user')
                        ->causedBy(auth()->user())
                        ->performedOn($dataUser)
                        ->withProperties($properties)
                        ->event('deleted')
                        ->log('hapus data pengguna ' . $dataUser->name);
                }
            }

            $deletedRows = User::whereIn('id', $ids)->delete();

            DB::commit();
            foreach ($arrayImage as $row) {
                $fileimage = Storage::disk('public')->path('user/' . $row);
                if (file_exists($fileimage)) {
                    Storage::delete('public/users/' . $row);
                }
            }
            $res['message'] = $deletedRows . ' data pengguna berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal dihapus';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function bulkUpdate(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:users,id',
        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            //            return response()->json($validator->errors(), 422);
        }
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');

            $column_update = array_filter([
                'is_active' => $request->input('is_active'),
                'roles' => $request->input('roles'),
                'password' => $request->input('password'),
                'avatar' => $request->hasFile('avatar'),
            ], function ($var) {
                return $var !== null && $var !== false && $var !== '';
            });

            if ($column_update != []) {
                foreach ($ids as $id) {
                    $dataUser = User::findOrfail($id);

                    if ($request->hasFile('avatar')) {
                        $fileimage = $request->file('avatar');
                        $hashImage = $fileimage->hashName();
                        $thumbFile = 'thumb_' . $hashImage;
                        $column_update['avatar'] = 'users/' . $hashImage;
                        $column_update['avatar_thumb'] = 'users/' . $thumbFile;
                        $fileimage->storeAs('public/users', $hashImage);
                        $filethumbnail = Image::make($fileimage)
                            ->fit(200, 200)
                            ->encode('jpg', 80);
                        $thumbnailPath = 'users/' . $thumbFile;
                        Storage::disk('public')->put($thumbnailPath, $filethumbnail);
                    }

                    $dataUser->update($column_update);

                    $changes = $dataUser->getChanges();
                    if (!empty($changes)) {
                        $properties = [
                            'old' => $dataUser->getOriginal(),
                            'new' => $dataUser->getAttributes(),
                            //                        json_decode($changes)
                        ];
                        activity()
                            ->useLog('user')
                            ->causedBy(auth()->user())
                            ->performedOn($dataUser)
                            ->withProperties($properties)
                            ->event('updated')
                            ->log('memperbarui data pengguna ' . $dataUser->name);
                    }
                }
                DB::commit();
                $res['message'] = 'data pengguna berhasil diperbarui';
            } else {
                $res['message'] = 'data pengguna tidak ada yang diperbarui';
            }

            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal diperbarui';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function BackupbulkUpdate(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:users,id',
        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            //            return response()->json($validator->errors(), 422);
        }
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $column_update_before_filter = $request->column_update;
            $column_update = array_filter($column_update_before_filter);
            if ($column_update != []) {
                foreach ($ids as $id) {
                    $dataUser = User::findOrfail($id);

                    //                    if ($column_update['avatar']) {
                    //
                    //
                    //                        $fileimage = $request->file($column_update['avatar']);
                    //                        $hashImage = $fileimage->hashName();
                    //                        $thumbFile = 'thumb_' . $hashImage;
                    //                        $column_update['avatar'] = 'users/' . $hashImage;
                    //                        $column_update['avatar_thumb'] = 'users/' . $thumbFile;
                    //                        $fileimage->storeAs('public/users', $hashImage);
                    //                        $filethumbnail = Image::make($fileimage)
                    //                            ->fit(200, 200)
                    //                            ->encode('jpg', 80);
                    //                        $thumbnailPath = 'users/' . $thumbFile;
                    //                        Storage::disk('public')->put($thumbnailPath, $filethumbnail);
                    //                    }
                    $dataUser->update($column_update);

                    $changes = $dataUser->getChanges();
                    if (!empty($changes)) {
                        $properties = [
                            'old' => $dataUser->getOriginal(),
                            'new' => $dataUser->getAttributes(),
//                        json_decode($changes)
                        ];
                        activity()
                            ->useLog('user')
                            ->causedBy(auth()->user())
                            ->performedOn($dataUser)
                            ->withProperties($properties)
                            ->event('updated')
                            ->log('memperbarui data pengguna ' . $dataUser->name);
                    }
                }
                DB::commit();
                $res['message'] = 'data pengguna berhasil diperbarui';
            } else {
                $res['message'] = 'data pengguna tidak ada yang diperbarui';
            }
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data pengguna gagal diperbarui';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function remote(Request $request)
    {


        $dataUser = User::query();
        $arraynotInrole = ['peternak'];



        if (!Auth::user()->hasAnyRole(['superadmin'])) {
            $arraynotInrole = ['superadmin','peternak'];

        }

        $eloUserNotSuper = $dataUser->distinct()->whereHas('roles', function ($q) use ($arraynotInrole) {
            $q->whereNotIn('name', $arraynotInrole);
        })->get(['id'])->pluck('id')->toArray();
        $dataUser = $dataUser->whereIn('id', $eloUserNotSuper);
        $search = $request->search;
        if ($search) {
            $dataUser = $dataUser->where('name', 'like', '%' . $search . '%');
        }
        $dataUser = $dataUser->select('id', 'name as text')->orderBy('name')->limit(100)->get();

        return response()->json($dataUser);
    }

    public function remote_pic(Request $request)
    {
        $dataUser = User::query();

        $eloUserPIC = $dataUser->distinct()->whereHas('roles', function ($q) {
            $q->where('name', 'pic');
        })->get(['id'])->pluck('id')->toArray();
        $dataUser = $dataUser->whereIn('id', $eloUserPIC);

        $search = $request->search;
        if ($search) {
            $dataUser = $dataUser->where('name', 'like', '%' . $search . '%');
        }
        $dataUser = $dataUser->select('id', 'name as text')->orderBy('name')->limit(100)->get();

        return response()->json($dataUser);
    }
}
