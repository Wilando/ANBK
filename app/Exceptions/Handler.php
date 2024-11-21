<?php

namespace App\Exceptions;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Exceptions\HttpResponseException;
use Spatie\Permission\Exceptions\UnauthorizedException;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    public function render($request, Throwable $e)
    {
        if ($request->expectsJson()) {
            // Exception handling for API mode
//            return response()->json(['error' => 'Something went wrong.'], 500);

            if ($e instanceof ModelNotFoundException) {
                $res['message'] = 'data gagal didapatkan, tidak ditemukan';
                $res['success'] = false;
                return response()->json($res, Response::HTTP_NOT_FOUND);
            }

            if ($e instanceof UnauthorizedException) {
                $res['message'] = 'user tidak memiliki role yang dibutuhkan';
                $res['success'] = false;
                return response()->json($res, Response::HTTP_FORBIDDEN);
            }

            if ($e instanceof NotFoundHttpException) {
                $res['message'] = 'endpoint tidak ditemukan';
                $res['success'] = false;
                return response()->json($res, Response::HTTP_NOT_FOUND);
            }

            if ($e instanceof MethodNotAllowedHttpException) {
                $res['message'] = 'Method not allowed';
                $res['success'] = false;
                return response()->json($res, Response::HTTP_METHOD_NOT_ALLOWED);
            }

            if ($e instanceof HttpResponseException) {
                //            $res['message'] = $e->getResponse();
                //            $res['success'] = false;
                //            return response()->json($res, Response::HTTP_METHOD_NOT_ALLOWED);
                return $e->getResponse();
            }
        }

        // Exception handling for web mode
        return parent::render($request, $e);
    }
}
