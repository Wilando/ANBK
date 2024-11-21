<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Intervention\Image\Facades\Image;
use Spatie\Activitylog\Models\Activity;
use Symfony\Component\HttpFoundation\Response;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            $res['message'] = 'data user gagal didapatkan';
            $res['success'] = false;
            $res['data'] = [];

            return response()->json($res, Response::HTTP_NOT_FOUND);
        }
        $res['message'] = 'data user berhasil didapatkan';
        $res['success'] = true;
        $mergedData = $request->user();
        //        $relawan = Relawan::join_caleg()->where('iduser_fk', $request->user()->id)->first();
        //        if ($relawan) {
        //            $relawan->makeHidden(['iduser_fk', 'created_at', 'updated_at', 'deleted_at', 'created_by', 'updated_by', 'deleted_by']);
        //            $mergedData = array_merge($request->user()->toArray(), $relawan->toArray());
        //        }
        $res['data'] = $mergedData;
        //        $res['data'] = $request->user();
        $res['data']['list_roles'] = $request->user()->getRoleNames();
        $res['data']['list_permissions'] = $request->user()->getAllPermissions()->pluck('name')->toArray();

        return response()->json($res, Response::HTTP_OK);
    }

    public function logout(Request $request)
    {
        activity()
            ->useLog('logout')
            ->causedBy($request->user())
            ->performedOn($request->user())
            ->event('logout')
            ->log('logout aplikasi');

        if ($request->wantsJson()) {
            $currentAccessToken = $request->user()->currentAccessToken();
            if (!$currentAccessToken) {
                $res['message'] = 'tidak ditemukan token access, pastikan user telah login utk dapat logout aplikasi';
                $res['success'] = false;
                $res['data'] = [];

                return response()->json($res, Response::HTTP_NOT_FOUND);
            }

            $currentAccessToken->delete();
            $res['message'] = 'berhasil keluar dari aplikasi';
            $res['success'] = true;
            $res['data'] = [];

            return response()->json($res, Response::HTTP_OK);
        } else {
            Auth::guard('web')->logout();

            $request->session()->invalidate();

            $request->session()->regenerateToken();

            return redirect('/');
        }
    }

    public function updatePassword(Request $request)
    {
//        dd('wew');
        $rule = [
            'current_password' => 'required',
            'new_password' => 'required|min:8|confirmed',
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
        $user = $request->user();
        if (!Hash::check($request->input('current_password'), $user->password)) {
            //            throw ValidationException::withMessages([
            //                'current_password' => ['The current password is incorrect.'],
            //            ]);
            $res['message'] = 'password lama tidak sesuai';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        }
        DB::beginTransaction();
        try {
            $user->password = Hash::make($request->input('new_password'));
            $user->save();
            activity()
                ->useLog('user')
                ->causedBy(auth()->user())
                ->performedOn($user)
                ->event('updated')
                ->log('mengubah password akun');
            DB::commit();
            $res['message'] = 'berhasil ubah password';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = 'gagal ubah password';
            $res['success'] = false;

            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function updateAccount(Request $request)
    {
        $user = $request->user();
        $rule = [
            'username' => 'required|string|unique:users,username,'.$user->id,
            'email' => 'required|email|unique:users,email,'.$user->id,
            'name' => 'required',
        ];

        if ($request->hasFile('avatar')) {
            $rule['avatar'] = 'image|mimes:jpeg,png,jpg,gif,svg|max:2048';
        }

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
            $exceptproLog = ['password', 'remember_token'];

            $oldAttributes = $user->getOriginal();

            foreach ($exceptproLog as $attribute) {
                unset($oldAttributes[$attribute]);
            }

            $oldEmail = $user->email;
            $hashAvatar = $user->avatar;
            $thumbFile = $user->avatar_thumb;
            $oldAvatar = $hashAvatar;
            $oldThumb = $thumbFile;

            $profileUpdate = [
                'username' => $request->username,
                'email' => $request->email,
                'name' => $request->name,
            ];

            if ($request->hasFile('avatar')) {
                $avatar = $request->file('avatar');
                $hashAvatar = $avatar->hashName();
                $thumbFile = 'thumb_'.$hashAvatar;
                $profileUpdate['avatar'] = 'users/'.$hashAvatar;
                $profileUpdate['avatar_thumb'] = 'users/'.$thumbFile;
            }

            if ($request->has('email') && $request->email != $oldEmail) {
                $profileUpdate['email_verified_at'] = null;
                //                $user->sendEmailVerificationNotification();
            }
            $update = $user->update($profileUpdate);

            if ($request->hasFile('avatar')) {
                if ($update) {
                    $fileavatar = $request->file('avatar');
                    $fileavatar->storeAs('public/users', $hashAvatar);
                    $filethumbnail = Image::make($fileavatar)
                        ->fit(100, 100)
                        ->encode('jpg', 80);
                    $thumbnailPath = 'users/'.$thumbFile;
                    Storage::disk('public')->put($thumbnailPath, $filethumbnail);

                    $fileimage = Storage::disk('public')->path('users/'.$oldAvatar);
                    if (file_exists($fileimage)) {
                        Storage::delete('public/users/'.$oldAvatar);
                    }

                    $filethumb = Storage::disk('public')->path('users/'.$oldThumb);
                    if (file_exists($filethumb)) {
                        Storage::delete('public/users/'.$oldThumb);
                    }
                }
            }
            $changes = $user->getChanges();
            if (!empty($changes)) {
                $newAttributes = $user->getAttributes();

                foreach ($exceptproLog as $attribute) {
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
                    ->log('memperbarui  profil akun');
            }

            DB::commit();

            $res['message'] = 'berhasil ubah profil akun';
            $res['success'] = true;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect()->back()->with($res);
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
            $res['message'] = 'gagal ubah profil akun '.$e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function paginateMyactivity(Request $request)
    {
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'description';
        $activityLog = Activity::select('id', 'log_name', 'description', 'created_at', 'updated_at')->where('causer_id', $request->user()->id);

        if ($search != null) {
            $activityLog = $activityLog->where($columnSearch, 'like', '%'.$search.'%');
        }
        $activityLog = $activityLog->orderBy($sort, $order)->paginate($per_page);
        $res['message'] = 'log aktivitas saya berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $activityLog;

        return response()->json($res, Response::HTTP_OK);
    }

    public function listMyactivity(Request $request)
    {
        $start = $request->get('start') ?? 0;
        $length = $request->get('length') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'description';
        $activityLog = Activity::select('id', 'log_name', 'description', 'created_at', 'updated_at')->where('causer_id', $request->user()->id);
        $totaldata = $activityLog->count();
        $totalrecordfilter = $totaldata;
        if ($search != null) {
            $activityLog = $activityLog->where($columnSearch, 'like', '%'.$search.'%');
            $totalrecordfilter = $activityLog->count();
        }
        $activityLog = $activityLog->orderBy($sort, $order)->skip($start)->take($length)->get();

        $res['message'] = 'log aktivitas saya berhasil didapatkan';
        $res['success'] = true;
        $res['totaldata'] = $totaldata;
        $res['totalrecordfilter'] = $totalrecordfilter;
        $res['data'] = $activityLog;

        return response()->json($res, Response::HTTP_OK);
    }
}
