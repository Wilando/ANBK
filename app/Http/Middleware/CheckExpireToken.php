<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Carbon\Carbon;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckExpireToken
{
    /**
     * Handle an incoming request.
     *
     * @param \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response) $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        $token = \auth()->user()->currentAccessToken(); // Dapatkan token saat ini untuk pengguna yang terautentikasi
        if ($token && Carbon::parse($token->expires_at)->isPast()) {
//            return response()->json(['error' => 'token anda sudah expire, silahkan login kembali']);

            $res['message'] = 'token anda sudah expire, silahkan login kembali';
            $res['success'] = false;
            return response()->json($res, Response::HTTP_FORBIDDEN);
        } else {
            return $next($request);
        }

    }
}
