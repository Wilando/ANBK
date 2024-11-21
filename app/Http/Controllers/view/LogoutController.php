<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class LogoutController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function getuser(Request $request)
    {
        $client = new Client(); //GuzzleHttp\Client
        $url = env('API_URL') . "/user";
        $params = [];
        $bearerToken = $request->session()->get('bearerToken');
        $headers = [
            'Authorization' => $bearerToken
        ];
        $response = $client->request('GET', $url, [
            'json' => $params,
            'headers' => $headers,
            'verify' => true,
        ]);
        return $response->getBody();
    }

    public function BAKdestroy(Request $request)
    {

        //        Session::flush();
        //        Session::forget('key_name');
        $request->session()->forget('bearerToken');
        $request->session()->forget('userData');
        $request->session()->forget('allSetting');

        return redirect('login');

    }

    public function destroy(Request $request)
    {
        $client = new Client(); //GuzzleHttp\Client
        $url = env('API_URL') . "/logout";
        $params = [
        ];
        $bearerToken = $request->session()->get('bearerToken');
        $headers = [
            'Authorization' => $bearerToken
        ];
        $response = $client->request('GET', $url, [
//            'json' => $params,
            'headers' => $headers,
//            'verify' => true,
        ]);
//        Session::flush();
//        Session::forget('key_name');
        $request->session()->forget('bearerToken');
        $request->session()->forget('userData');
        $request->session()->forget('allSetting');
        Session::flush();
        $res = $response->getBody();

        $data = json_decode($res, true); // Parse the response body as an associative array

        // Access the desired array key
        $success = $data['success'];

//        if($success==true)
//        {
        return redirect('login');
//        }
    }


}
