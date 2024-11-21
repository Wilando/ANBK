<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class EnsureEmailIsVerifiedCustom
{
    public function handle($request, Closure $next)
    {
        if (!Auth::user()->hasVerifiedEmail()) {
            $res['message'] = 'Email address is not verified.';
            $res['success'] = false;
            return response()->json($res, Response::HTTP_FORBIDDEN);
        }

        return $next($request);
    }
}
