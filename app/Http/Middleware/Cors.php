<?php

namespace App\Http\Middleware;

use Closure;

class Cors
{
    public function handle($request, Closure $next)
    {

//        $headers = [
//            'Access-Control-Allow-Origin' => "*",
//            'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE, OPTIONS',
//            'Access-Control-Allow-Headers' => implode(', ', [
//                'X-Requested-With',
//                'Content-Type',
//                'X-CSRF-Token',
//                'X-Token-Auth',
//                'Authorization',
//            ]),
//            'Access-Control-Max-Age' => 2592000,
//            'Access-Control-Allow-Credentials' => 'true',
//        ];

        $response = $next($request);

        $response->headers->set('Access-Control-Allow-Origin' , '*');
        $response->headers->set('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE');
        $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, Accept, Authorization, X-Requested-With, Application');

        return $response;


//        return $next($request)->withHeaders($headers);
//        return $next($request)->withHeaders($headers);
    }
}
