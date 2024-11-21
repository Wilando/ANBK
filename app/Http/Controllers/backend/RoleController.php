<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
// use App\Models\Role;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Models\Role;
use Symfony\Component\HttpFoundation\Response;
use Vinkla\Hashids\Facades\Hashids;
use Yajra\DataTables\Facades\DataTables;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:superadmin'])->only(['store', 'update', 'destroy', 'bulkDelete', 'bulkUpdate']);
        $this->roles_check = ['superadmin'];
    }

    public function selectData(Request $request)
    {
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'name';
        $role = \Spatie\Permission\Models\Role::query();

        if ($search != null) {
            $role = $role->where($columnSearch, 'like', '%'.$search.'%');
        }

        $role = $role->orderBy($sort, $order)->paginate($per_page);
        $role->onEachSide(0)->links();
        $res['message'] = 'role berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $role;

        return response()->json($res, Response::HTTP_OK);
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'name';
        $role = \Spatie\Permission\Models\Role::query();
        if ($search != null) {
            $role = $role->where($columnSearch, 'like', '%'.$search.'%');
        }

        $role = $role->orderBy($sort, $order)->paginate($per_page);
        $role->onEachSide(0)->links();
        $role = $role->through(function ($item) {
            //            $item->list_permissions = $item->permissions;
            $item->list_permissions = DB::table('role_has_permissions')
                ->leftJoin('permissions', 'role_has_permissions.permission_id', '=', 'permissions.id')
                ->where('role_has_permissions.role_id', $item->id)
                ->pluck('role_has_permissions.permission_id', 'permissions.name')
                ->all();

            return $item;
        });
        $res['message'] = 'role berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $role;

        return response()->json($res, Response::HTTP_OK);
    }

    public function datatable(Request $request)
    {
        $data = Role::withCount('users')->withCount('permissions');

        $permission_id = $request->get('permission_id');
        if ($permission_id != '') {
            $data->whereHas('permissions', function ($query) use ($permission_id) {
                $query->whereIn('id', $permission_id);
            });
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('hashId', function ($row) {
                return encodeId($row->id);
            })
            ->escapeColumns([])
            ->toJson();
    }

    public function store(Request $request)
    {
        $rule = [
            'name' => 'required|unique:roles,name',
        ];

        $attributeRule = [
            'name' => 'role',
        ];

        $validator = Validator::make($request->all(), $rule, [], $attributeRule);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;

            if ($request->wantsJson()) {
                $res['errors'] = $validator->errors()->toArray();

                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->withErrors($validator)->with($res);
            }
        }

        DB::beginTransaction();
        try {
            $requestData['name'] = $request->name;
            $requestData['guard_name'] = 'web';
            $requestData['created_at'] = now();
            $requestData['updated_at'] = now();
            $role = Role::create($requestData);
            $role->syncPermissions($request->permission);
            $newAttributes = $role->getAttributes();
            $properties = [
                'new' => $newAttributes,
            ];
            activity()
                ->useLog('role')
                ->causedBy(auth()->user())
                ->performedOn($role)
                ->withProperties($properties)
                ->event('created')
                ->log('menambahkan data role '.$role->name);

            DB::commit();
            $res['message'] = 'data role berhasil ditambahkan';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $role;

                return response()->json($res, Response::HTTP_CREATED);
            } else {
                return redirect('app/role')->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();

            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data role gagal ditambahkan '.$e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function show($id)
    {
        $role = Role::findOrfail($id);
        $res['message'] = 'data role berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $role;

        return response()->json($res, Response::HTTP_OK);
    }

    public function update(Request $request, $id)
    {
        $decodeId = Hashids::decode($id)[0];
        $role = Role::findOrfail($decodeId);
        $oldAttributes = $role->getOriginal();
        $rule = [
            'name' => 'required|unique:roles,name,'.$role->id,
        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;

            if ($request->wantsJson()) {
                $res['errors'] = $validator->errors()->toArray();

                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->withErrors($validator)->with($res);
            }
        }
        DB::beginTransaction();
        try {
            $role->update([
                'name' => $request->name,
            ]);
            $role->syncPermissions($request->permission);
            $changes = $role->getChanges();
            if (!empty($changes)) {
                $newAttributes = $role->getAttributes();
                $properties = [
                    'old' => $oldAttributes,
                    'new' => $newAttributes,
                ];
                activity()
                    ->useLog('role')
                    ->causedBy(auth()->user())
                    ->performedOn($role)
                    ->withProperties($properties)
                    ->event('updated')
                    ->log('memperbarui  data role '.$role->name);
            }
            DB::commit();
            $res['message'] = 'data role berhasil diperbarui';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $role;

                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect('app/role')->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data role gagal diperbarui';
            $res['success'] = false;

            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function destroy($id)
    {
        $role = Role::findOrfail($id);
        $oldAttributes = $role->getOriginal();
        DB::beginTransaction();
        try {
            $deleted = $role->delete();
            if ($deleted) {
                $changes = $role->getChanges();
                $properties['old'] = $oldAttributes;
                if (!empty($changes)) {
                    $newAttributes = $role->getAttributes();
                    $properties['new'] = $newAttributes;
                }
                activity()
                    ->useLog('role')
                    ->causedBy(auth()->user())
                    ->performedOn($role)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('hapus data role '.$role->name);
            }
            DB::commit();
            $res['message'] = 'data role berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data role gagal dihapus';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function bulkDelete(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:roles,id',
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

            foreach ($ids as $id) {
                $dataKomponen = Role::findOrfail($id);

                if ($dataKomponen) {
                    $properties['old'] = $dataKomponen->getOriginal();
                    activity()
                        ->useLog('role')
                        ->causedBy(auth()->user())
                        ->performedOn($dataKomponen)
                        ->withProperties($properties)
                        ->event('deleted')
                        ->log('hapus data role '.$dataKomponen->name);
                }
            }

            $deletedRows = Role::whereIn('id', $ids)->delete();

            DB::commit();
            $res['message'] = $deletedRows.' data role berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data role gagal dihapus';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function bulkUpdate(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:roles,id',
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
            $column_update = $request->input('column_update');
            foreach ($ids as $id) {
                $dataKomponen = Role::findOrfail($id);
                $dataKomponen->update($column_update);

                $changes = $dataKomponen->getChanges();
                if (!empty($changes)) {
                    $properties = [
                        'old' => $dataKomponen->getOriginal(),
                        'new' => $dataKomponen->getAttributes(),
//                        json_decode($changes)
                    ];
                    activity()
                        ->useLog('role')
                        ->causedBy(auth()->user())
                        ->performedOn($dataKomponen)
                        ->withProperties($properties)
                        ->event('updated')
                        ->log('memperbarui  data role '.$dataKomponen->name);
                }
            }
            DB::commit();
            $res['message'] = 'data role berhasil diperbarui';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'data role gagal diperbarui';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function remote(Request $request)
    {
        $dataRole = Role::query();


        $arraynotInrole = ['peternak'];


        if (!Auth::user()->hasAnyRole(['superadmin'])) {
            $arraynotInrole = ['superadmin','peternak'];

        }
        $dataRole = $dataRole->distinct()->whereNotIn('name', $arraynotInrole);
        $search = $request->search;
        if ($search) {
            $dataRole = $dataRole->where('name', 'like', '%'.$search.'%');
        }
        $dataRole = $dataRole->select('id', 'name as text')->orderBy('name')->limit(100)->get();

        return response()->json($dataRole);
    }
}
