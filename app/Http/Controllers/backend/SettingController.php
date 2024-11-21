<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;

class SettingController extends Controller
{
    /**
     * index
     *
     * @return myResource
     */


    public function index(Request $request)
    {
        $start = $request->get('start') ?? 0;
        $length = $request->get('length') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'ASC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'title';
        $settings = Setting::query();
        $totaldata = $settings->count();
        $totalrecordfilter = $totaldata;
        if ($search != null) {
            $settings = $settings->where($columnSearch, 'like', "%" . $search . "%");
            $totalrecordfilter = $settings->count();
        }

        $settings = $settings->orderBy($sort, $order)->skip($start)->take($length)->get();

        $data = [
            'totaldata' => $totaldata,
            'totalrecordfilter' => $totalrecordfilter,
            'list' => $settings,
        ];

        return new myResource(true, 'List Data Settings', $data);
    }

    public function public_setting()
    {
        $settings = Setting::where('setting_public', 1)->select('setting_name', 'setting_var', 'setting_val', 'setting_type')->get();
        $res['message'] = 'Berhasil Mendapatkan Public Setting!';
        $res['success'] = true;
        $settings = $settings->map(function ($row) {
            if ($row->setting_type == "file") {
                $row->setting_val = $row->setting_val ? url('berkas/settings/' . $row->setting_val) : null;
            }
            return $row;
        });
        $res['data'] = $settings;
        return response()->json($res, Response::HTTP_OK);
    }

    public function all_setting()
    {
        $settings = Setting::select('setting_name', 'setting_var', 'setting_val', 'setting_type', 'setting_description')->get();
        $res['message'] = 'Berhasil Mendapatkan All Setting!';
        $res['success'] = true;
        $settings = $settings->map(function ($row) {
            if ($row->setting_type == "file") {
                $row->setting_val = $row->setting_val ? url('berkas/settings/' . $row->setting_val) : null;
            }
            return $row;
        });
        $res['data'] = $settings;
        return response()->json($res, Response::HTTP_OK);
    }

    public function update_settings(Request $request)
    {
        $settings = Setting::all();

        DB::beginTransaction();
        try {

            foreach ($settings as $st) {
                $data = $request->all();
                if (isset($data[$st->setting_var])) {
                    if ($st->setting_type == 'file') {
                        $validator = Validator::make($data, [
                            $st->setting_var => 'sometimes|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
                        ]);


                    } else {
                        $validator = Validator::make($data, [
                            $st->setting_var => 'required',
                        ], [], [$st->setting_var => $st->setting_name]);
                    }

                    if ($validator->fails()) {
                        $errorString = implode(",", $validator->messages()->all());
                        $res['message'] = $errorString;
                        $res['success'] = false;
                        if ($request->wantsJson()) {
                            $res['errors'] = $validator->errors()->toArray();
                            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
                        } else {
                            return redirect()->back()->withInput()->withErrors($validator)->with($res);
                        }
                    }

                    if ($st->setting_type == 'file') {
                        if (isset($data[$st->setting_var])) {
                            $hashImage = $data[$st->setting_var]->hashName();
                            $data[$st->setting_var]->storeAs('public/settings', $hashImage);
                            $data[$st->setting_var] = 'settings/' . $hashImage;
                        }
                    }


                    $setting = Setting::where('setting_var', $st->setting_var)->first();
                    $setting->setting_val = $data[$st->setting_var];
                    $setting->save();
                }
            }
            activity()
                ->useLog('settings')
                ->causedBy(auth()->user())
                ->performedOn(Setting::first())
                ->event('updated')
                ->log('memperbarui  data konfigurasi aplikasi');
            DB::commit();
            $res['message'] = 'konfigurasi aplikasi berhasil diperbarui';
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
            $res['message'] = 'konfigurasi aplikasi gagal diperbarui ' . $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }


    }

}
