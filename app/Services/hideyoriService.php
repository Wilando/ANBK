<?php

namespace App\Services;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;

class hideyoriService
{
    function read($model, $reqData): \Illuminate\Foundation\Application|\Illuminate\Http\JsonResponse|\Illuminate\Routing\Redirector|\Illuminate\Http\RedirectResponse|\Illuminate\Contracts\Foundation\Application
    {
        $request = Request::instance();
        $listData = $model;
//        $listData = $model::query();
        if (isset($reqData) && is_array($reqData)) {

            if (isset($reqData['whereIn']) && is_array($reqData['whereIn'])) {
                foreach ($reqData['whereIn'] as $column => $value) {
                    $listData->whereIn($column, $value);
                }
            }

            if (isset($reqData['whereNotin']) && is_array($reqData['whereNotin'])) {
                foreach ($reqData['whereNotin'] as $column => $value) {
                    $listData->whereNotin($column, $value);
                }
            }

            if (isset($reqData['whereColumns']) && is_array($reqData['whereColumns'])) {

                foreach ($reqData['whereColumns'] as $column => $value) {
                    $listData->where($column, $value);
                }
            }

            if (isset($reqData['whereOPColumns']) && is_array($reqData['whereOPColumns'])) {

                foreach ($reqData['whereOPColumns'] as $column => $value) {

                    foreach ($value as $operator => $value2) {
                        $listData->where($column, $operator, $value2);
                    }
                }
            }

            if (isset($reqData['whereBetween']) && is_array($reqData['whereBetween'])) {
                foreach ($reqData['whereBetween'] as $column => $value) {
                    $listData->whereBetween($column, $value);
                }
            }

            if (isset($reqData['sortBy']) && is_array($reqData['sortBy'])) {
                foreach ($reqData['sortBy'] as $column => $value) {
                    $listData = $listData->orderBy($column, $value);
                }
            }

            $listData = $listData->paginate($reqData['per_page'] ?? 15);

            $listData->onEachSide(0)->links();
            if (isset($reqData['primaryKey'])) {
                $listData = $listData->through(function ($item) use ($reqData) {
                    $item->idHash = encodeId($item->{$reqData['primaryKey']});
//                    $item->idHash = encodeId($item[$reqData['primaryKey']]);
                    return $item;
                });
//                $listData->makeHidden([$reqData['primaryKey']]);
            }


            $res['message'] = $reqData['titleData'] ?? 'data' . ' retrieved successfully';
            $res['success'] = true;
            $res['data'] = $listData;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect($reqData['defaultRedirect'])->with($res);
            }
        } else {
            $res['message'] = 'request doesnt exist or is not an array';
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_BAD_REQUEST);
            } else {
                return redirect($reqData['defaultRedirect'])->with($res);
            }
        }

    }

    function insert($model, $reqData, $setConfig, $returnBool = true)
    {
        $titleData = $setConfig['titleData'] ?? 'data';
        $logName = $setConfig['logName'] ?? 'default';
        $redirect = $setConfig['redirect'] ?? 'app';
        $request = Request::instance();
        DB::beginTransaction();
        try {
            $processData = $model::create($reqData);
            $newAttributes = $processData->getAttributes();
            $properties = [
                'new' => $newAttributes,
            ];
            activity()
                ->useLog($logName)
                ->causedBy(auth()->user())
                ->performedOn($processData)
                ->withProperties($properties)
                ->event('created')
                ->log('add ' . $titleData);

        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
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

        DB::commit();


        $res['message'] = $titleData . ' added successfully';
        $res['success'] = true;
        if (!$returnBool) {
            $res['data'] = $processData;
            return $res;
        }
        if ($request->wantsJson()) {
            $res['data'] = $processData;
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($redirect)->with($res);
        }


    }

    function trx_db($functionName)
    {

        DB::beginTransaction();
        try {
            $res = $functionName;
        } catch (QueryException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            $request = Request::instance();
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            $request = Request::instance();
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }

        DB::commit();
        return $res;
    }

    function insert_no_trx($model, $reqData, $setConfig)
    {
        $titleData = $setConfig['titleData'] ?? 'data';
        $logName = $setConfig['logName'] ?? 'default';

        $processData = $model::create($reqData);
        $newAttributes = $processData->getAttributes();
        $properties = [
            'new' => $newAttributes,
        ];
        activity()
            ->useLog($logName)
            ->causedBy(auth()->user())
            ->performedOn($processData)
            ->withProperties($properties)
            ->event('created')
            ->log('add ' . $titleData);

        $res['message'] = $titleData . ' added successfully';
        $res['success'] = true;
        $res['data'] = $processData;
        return $res;


    }

    function update($master, $reqData, $setConfig, $returnBool = true)
    {
        $titleData = $setConfig['titleData'] ?? 'data';
        $logName = $setConfig['logName'] ?? 'default';
        $redirect = $setConfig['redirect'] ?? 'app';
        $request = Request::instance();
        $oldAttributes = $master->getOriginal();
        DB::beginTransaction();
        try {
            $processData = $master->update($reqData);
            $changes = $master->getChanges();
            if (!empty($changes)) {
                $newAttributes = $master->getAttributes();
                $properties = [
                    'old' => $oldAttributes,
                    'new' => $newAttributes,
                ];
                activity()
                    ->useLog($logName)
                    ->causedBy(auth()->user())
                    ->performedOn($master)
                    ->withProperties($properties)
                    ->event('updated')
                    ->log('change ' . $titleData);
            }


        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
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

        DB::commit();

        $res['message'] = $titleData . ' updated successfully';
        $res['success'] = true;
        if (!$returnBool) {
            $res['data'] = $processData;
            return $res;
        }
        if ($request->wantsJson()) {
            $res['data'] = $processData;
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($redirect)->with($res);
        }


    }

    public function find($model, $id, $trashed = false)
    {
        $request = Request::instance();
        try {
            if ($trashed == true) {
                $item = $model::withTrashed()->find($id);
            } else {
                $item = $model::find($id);
            }

            return $item;
        } catch (ModelNotFoundException $e) {
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_NOT_FOUND);
            } else {
                return redirect()->back()->with($res);
            }

        }
    }

    function delete($master, $setConfig, $returnBool = true)
    {
        $titleData = $setConfig['titleData'] ?? 'data';
        $logName = $setConfig['logName'] ?? 'default';
        $redirect = $setConfig['redirect'] ?? 'app';
        $request = Request::instance();
        if (isset($setConfig['columnValidation']) && isset($setConfig['valueValidation'])) {
            if ($master[$setConfig['columnValidation']] == $setConfig['valueValidation']) {
                $errorString = 'sorry, data must be not active if you want to delete';
                $res['message'] = $errorString;
                $res['success'] = false;
                return validationResponse($res);
            }
        }

        $oldAttributes = $master->getOriginal();
        DB::beginTransaction();
        try {
            $deleted = $master->delete();
            if ($deleted) {
                $properties['old'] = $oldAttributes;
                if (!empty($changes)) {
                    $newAttributes = $master->getAttributes();
                    $properties['new'] = $newAttributes;
                }
                activity()
                    ->useLog($logName)
                    ->causedBy(auth()->user())
                    ->performedOn($master)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('delete ' . $titleData);
            }


        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
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

        DB::commit();

        $res['message'] = $titleData . ' deleted successfully';
        $res['success'] = true;

        if (!$returnBool) {
            return $res;
        }
        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($redirect)->with($res);
        }


    }

    function bulkUpdate($model, $setConfig, $returnBool = true)
    {

        $titleData = $setConfig['titleData'] ?? 'data';
        $columnRef = $setConfig['columnRef'] ?? 'id';
        $logName = $setConfig['logName'] ?? 'default';
        $redirect = $setConfig['redirect'] ?? 'app';

        $request = Request::instance();
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $column_update = $request->input('column_update');
            $jumlah = 0;
            $titleDataColumn = $titleData;
            foreach ($ids as $id) {
                $master = $model::findOrfail(decodeId($id));
                if ($master) {
                    $oldAttribute = $master->getOriginal();
                    $master->update($column_update);
                    $titleDataColumn = $titleData . ' ' . $master[$columnRef];
                    $changes = $master->getChanges();
                    if (!empty($changes)) {
                        $properties = [
                            'old' => $oldAttribute,
                            'new' => $master->getAttributes(),
                        ];
                        activity()
                            ->useLog($logName)
                            ->causedBy(auth()->user())
                            ->performedOn($master)
                            ->withProperties($properties)
                            ->event('updated')
                            ->log('change ' . $titleDataColumn);
                    }
                    $jumlah++;
                }

            }


        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
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
        DB::commit();

        if ($jumlah == 1) {
            $titleData = $titleDataColumn;
        }
        $res['message'] = $titleData . ' updated successfully';
        $res['success'] = true;

        if (!$returnBool) {
            return $res;
        }

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($redirect)->with($res);
        }


    }

    function bulkDelete($model, $setConfig, $returnBool = true)
    {
        $primaryKey = $setConfig['primaryKey'] ?? 'id';
        $titleData = $setConfig['titleData'] ?? 'data';
        $columnRef = $setConfig['columnRef'] ?? 'id';
        $columnValidation = $setConfig['columnValidation'];
        $valueValidation = $setConfig['valueValidation'];
        $logName = $setConfig['logName'] ?? 'default';
        $redirect = $setConfig['redirect'] ?? 'app';
        $request = Request::instance();
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $idsDecode = [];
            $jumlah = 0;
            $titleDataColumn = $titleData;
            foreach ($ids as $id) {

                $master = $model::findOrfail(decodeId($id));
                if ($master) {

                    $oldAttribute = $master->getOriginal();
                    $properties['old'] = $oldAttribute;
                    $titleDataColumn = $titleData . ' ' . $master[$columnRef];
                    if ($master[$columnValidation]) {
                        if ($master[$columnValidation] != $valueValidation) {
                            $idsDecode[] = decodeId($id);
                            activity()
                                ->useLog($logName)
                                ->causedBy(auth()->user())
                                ->performedOn($master)
                                ->withProperties($properties)
                                ->event('deleted')
                                ->log('delete ' . $titleDataColumn);
                        }
                    } else {
                        $idsDecode[] = decodeId($id);
                        activity()
                            ->useLog($logName)
                            ->causedBy(auth()->user())
                            ->performedOn($master)
                            ->withProperties($properties)
                            ->event('deleted')
                            ->log('delete ' . $titleDataColumn);
                    }


                }
                $jumlah++;
            }

            $deletedRows = $model::whereIn($primaryKey, $idsDecode)->delete();
            $desc = $deletedRows . ' ' . $titleData;
            if ($jumlah == 1) {
                $desc = $titleDataColumn;
            }


        } catch
        (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
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

        DB::commit();

        $res['message'] = $desc . ' deleted successfully';
        $res['success'] = true;
        if ($deletedRows == 0) {
            $res['message'] = 'no data ' . $desc . ' is deleted, make sure the data is non active';
            $res['success'] = false;
        }

        if (!$returnBool) {
            return $res;
        }

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($redirect)->with($res);
        }


    }

    public function restore($item)
    {
        DB::beginTransaction();
        try {
            $update = $item->restore();
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            throw new \ErrorException($e->getMessage());
        }
        DB::commit();
        return $update;

    }


}
