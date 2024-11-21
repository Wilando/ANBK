<?php

namespace App\Http\Controllers\backend;


use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Spatie\Activitylog\Models\Activity;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class ActivityController extends Controller
{

    function __construct()
    {
        $this->middleware(['role:superadmin'])->only(['destroy', 'bulkDelete']);
        $this->middleware(['role:superadmin|admin'])->only(['paginate', 'show']);
        $this->roles_check = ['superadmin'];
    }

    public function index(Request $request)
    {

        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'description';

        $activity = Activity::leftJoin('users', 'users.id', '=', 'activity_log.causer_id')->select('activity_log.id as id', 'activity_log.created_at as created_at', 'description', 'users.name as name');
        if (!Auth::user()->hasAnyRole($this->roles_check)) {
            $eloUserNotSuper = User::distinct()->whereHas("roles", function ($q) {
                $q->whereNotIn("name", ["superadmin"]);
            })->get(['id'])->pluck('id')->toArray();
            $activity = $activity->whereIn('causer_id', $eloUserNotSuper);
        }


        if ($search != null) {
            $activity = $activity->where($columnSearch, 'like', "%" . $search . "%");

        }
        $activity = $activity->orderBy($sort, $order)->paginate($per_page);
        $activity->onEachSide(0)->links();
        $res['message'] = 'log aktivitasberhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $activity;
        return response()->json($res, Response::HTTP_OK);
    }

    public function datatable(Request $request)
    {
        $data = Activity::leftJoin('users', 'users.id', '=', 'activity_log.causer_id')->select('activity_log.id as id', 'activity_log.created_at as created_at', 'description', 'users.name as name');

        if (!Auth::user()->hasAnyRole($this->roles_check)) {
            $eloUserNotSuper = User::distinct()->whereHas("roles", function ($q) {
                $q->whereNotIn("name", ["superadmin"]);
            })->get(['id'])->pluck('id')->toArray();
            $data = $data->whereIn('causer_id', $eloUserNotSuper);
        }

        $causer_id = $request->get('causer_id');
        if ($causer_id != '') {
            $data->whereIn('causer_id', $causer_id);
        }

        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        if ($mulai && $selesai) {
            $data->whereBetween('activity_log.created_at', [$mulai, $selesai]);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->escapeColumns([])
            ->toJson();
    }


    public function show($id)
    {
        $activity = Activity::where('id', $id)->leftJoin('users', 'users.id', '=', 'activity_log.causer_id')->select('activity_log.id as id', 'activity_log.created_at as created_at', 'description', 'users.name as name')->first();
        $res['message'] = 'log aktivitasberhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $activity;
        return response()->json($res, Response::HTTP_OK);


    }


    public function destroy($ids)
    {

        DB::beginTransaction();
        try {
            Activity::destroy($ids);
            DB::commit();
            $res['message'] = 'log aktivitasberhasil dihapus';
            $res['success'] = true;
            return response()->json($res, Response::HTTP_OK);
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);

        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    public function bulkDelete(Request $request)
    {
        $rule = [
            'ids' => 'required|array',
            'ids.*' => 'exists:activity_log,id',
        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            $errorString = implode(",", $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;
            $res['errors'] = $validator->errors()->toArray();
            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
//            return response()->json($validator->errors(), 422);
        }
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $deletedRows = Activity::whereIn('id', $ids)->delete();
            DB::commit();
            $res['message'] = $deletedRows . ' activity berhasil dihapus';
            $res['success'] = true;
            return response()->json($res, Response::HTTP_OK);

        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);

        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }


}
