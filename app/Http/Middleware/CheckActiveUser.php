<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class CheckActiveUser
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            if (Auth::user()->is_active == 0) :
//                Auth::guard('web')->logout();
//                $request->session()->invalidate();
//                $request->session()->regenerateToken();
                $msgerror = 'account non active to access ' . $request->fullUrl();
                if ($request->expectsJson()) {
                    return response()->json(['error' => $msgerror]);
                }
                return Redirect::to('app/account-nonactive')->withErrors(['error' => $msgerror]);
            else:
                return $next($request);
            endif;
        }

    }
}
