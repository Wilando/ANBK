<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class PermissionController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:superadmin'])->only(['store', 'update', 'destroy', 'bulkDelete', 'bulkUpdate']);
        $this->roles_check = ['superadmin'];
    }

    public function index(Request $request)
    {
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'name';
        $permission = \Spatie\Permission\Models\Permission::query();
        if ($search != null) {
            $permission = $permission->where($columnSearch, 'like', '%'.$search.'%');
        }

        $permission = $permission->orderBy($sort, $order)->paginate($per_page);
        $permission->onEachSide(0)->links();
        $permission = $permission->through(function ($item) {
            $item->list_roles = $item->getRoleNames() ? implode(',', $item->getRoleNames()->toArray()) : '';

            return $item;
        });
        //        $permission = $permission->map(function ($item) {
        //            $item->list_roles = $item->getRoleNames() ? implode(',', $item->getRoleNames()->toArray()) : '';
        //            return $item;
        //        });
        $res['message'] = 'permission berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $permission;

        return response()->json($res, Response::HTTP_OK);
    }

    public function datatable(Request $request)
    {
        $data = \Spatie\Permission\Models\Permission::select('*');

        $role_id = $request->get('role_id');
        if ($role_id != '') {
            $data->role($role_id);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('roles', function ($row) {
                $res = '';
                $getRoles = $row->getRoleNames();
                if ($getRoles) {
                    foreach ($getRoles as $x) {
                        $res .= $x.',';
                    }
                }

                return rtrim($res, ',');
            })
            ->escapeColumns([])
            ->toJson();
    }

    public function store(Request $request)
    {
        $rule = [
            'name' => 'required|unique:permissions,name',
        ];

        $attributeRule = [
            'name' => 'permission',
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
            if ($request->corePermission == true) {
                $core = [
                    'read',
                    'create',
                    'update',
                    'delete',
                    'validation',
                    'privilege',
                ];
                foreach ($core as $c) {
                    $requestData['name'] = $request->name.' '.$c;
                    $checkExist = Permission::where('name', $request->name.' '.$c)->count();
                    if ($checkExist > 0) {
                        $res['message'] = $request->name.' '.$c.' already exist';
                        $res['success'] = false;

                        return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
                    }
                    $requestData['guard_name'] = 'web';
                    $permission = Permission::create($requestData);
                    $newAttributes = $permission->getAttributes();
                    $properties = [
                        'new' => $newAttributes,
                    ];
                    activity()
                        ->useLog('permission')
                        ->causedBy(auth()->user())
                        ->performedOn($permission)
                        ->withProperties($properties)
                        ->event('created')
                        ->log('menambahkan permission '.$permission->name);
                }
            } else {
                $requestDatax['name'] = $request->name;
                $requestDatax['guard_name'] = 'web';
                $permission = Permission::create($requestDatax);
                $newAttributes = $permission->getAttributes();
                $properties = [
                    'new' => $newAttributes,
                ];
                activity()
                    ->useLog('permission')
                    ->causedBy(auth()->user())
                    ->performedOn($permission)
                    ->withProperties($properties)
                    ->event('created')
                    ->log('menambahkan permission '.$permission->name);
            }

            DB::commit();
            $res['message'] = 'permission berhasil ditambahkan';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $permission;

                return response()->json($res, Response::HTTP_CREATED);
            } else {
                return redirect('app/permission')->with($res);
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
            $res['message'] = $e;
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
        $permission = Permission::findOrfail($id);
        $res['message'] = 'permission berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $permission;

        return response()->json($res, Response::HTTP_OK);
    }

    public function update(Request $request, $id)
    {
        $permission = Permission::findOrfail($id);
        $oldAttributes = $permission->getOriginal();
        $rule = [
            'name' => 'required|unique:permissions,name,'.$permission->id,
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
            $update = $permission->update([
                'name' => $request->name,
            ]);
            $changes = $permission->getChanges();
            if (!empty($changes)) {
                $newAttributes = $permission->getAttributes();
                $properties = [
                    'old' => $oldAttributes,
                    'new' => $newAttributes,
                ];
                activity()
                    ->useLog('permission')
                    ->causedBy(auth()->user())
                    ->performedOn($permission)
                    ->withProperties($properties)
                    ->event('updated')
                    ->log('memperbarui  permission '.$permission->name);
            }
            DB::commit();
            $res['message'] = 'permission berhasil diperbarui';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $permission;

                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect('app/permission')->with($res);
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
            $res['message'] = 'permission gagal diperbarui';
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function destroy(Request $request, $id)
    {
        $permission = Permission::findOrfail($id);
        $oldAttributes = $permission->getOriginal();
        DB::beginTransaction();
        try {
            $deleted = $permission->delete();
            if ($deleted) {
                $changes = $permission->getChanges();
                $properties['old'] = $oldAttributes;
                if (!empty($changes)) {
                    $newAttributes = $permission->getAttributes();
                    $properties['new'] = $newAttributes;
                }
                activity()
                    ->useLog('permission')
                    ->causedBy(auth()->user())
                    ->performedOn($permission)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('hapus permission '.$permission->name);
            }
            DB::commit();
            $res['message'] = 'permission berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
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
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function bulkDelete(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:permissions,id',
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
                $dataKomponen = Permission::findOrfail($id);

                if ($dataKomponen) {
                    $properties['old'] = $dataKomponen->getOriginal();
                    activity()
                        ->useLog('permission')
                        ->causedBy(auth()->user())
                        ->performedOn($dataKomponen)
                        ->withProperties($properties)
                        ->event('deleted')
                        ->log('hapus permission '.$dataKomponen->name);
                }
            }

            $deletedRows = Permission::whereIn('id', $ids)->delete();

            DB::commit();
            $res['message'] = $deletedRows.' permission berhasil dihapus';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
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
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function bulkUpdate(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:permissions,id',
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
                $dataKomponen = Permission::findOrfail($id);
                $dataKomponen->update($column_update);

                $changes = $dataKomponen->getChanges();
                if (!empty($changes)) {
                    $properties = [
                        'old' => $dataKomponen->getOriginal(),
                        'new' => $dataKomponen->getAttributes(),
//                        json_decode($changes)
                    ];
                    activity()
                        ->useLog('permission')
                        ->causedBy(auth()->user())
                        ->performedOn($dataKomponen)
                        ->withProperties($properties)
                        ->event('updated')
                        ->log('memperbarui  permission '.$dataKomponen->name);
                }
            }
            DB::commit();
            $res['message'] = 'permission berhasil diperbarui';
            $res['success'] = true;

            return response()->json($res, Response::HTTP_OK);
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
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }

    public function checkPermission($permissionName)
    {
        return xhasPermission($permissionName);
    }

    public function anyPermission($permissionArray)
    {
        return xhasPermissionAny($permissionArray);
    }

    public function remote(Request $request)
    {
        $dataPermission = Permission::query();
        $search = $request->search;
        if ($search) {
            $dataPermission = $dataPermission->where('name', 'like', '%'.$search.'%');
        }
        $dataPermission = $dataPermission->select('id', 'name as text')->orderBy('name')->limit(100)->get();

        return response()->json($dataPermission);
    }
}
