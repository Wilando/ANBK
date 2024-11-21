<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use Illuminate\Validation\ValidationException;
use Laravel\Sanctum\PersonalAccessToken;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $rule = [
            'username' => 'required',
            'password' => 'required',
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

        $loginField = filter_var(
            $request->username, FILTER_VALIDATE_EMAIL)
            ? 'email'
            : 'username';

        if (Auth::attempt($request->only($loginField, 'password'))) {
            $user = Auth::user();
            if ($request->wantsJson()) {
                $token = $user->createToken('authToken')->plainTextToken;
                $accessToken = PersonalAccessToken::findToken($token);
                $accessToken->expires_at = now()->addMinutes(config('sanctum.expiration'));
                $accessToken->save();
            }

            activity()
                ->useLog('login')
                ->causedBy($user)
                // ->performedOn($user)
                ->event('logged')
                ->log('login');

            $res['message'] = 'Login berhasil!';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['access_token'] = $token;
                $res['token_type'] = 'Bearer';

                return response()->json($res, Response::HTTP_OK);
            } else {
                if (Auth::user()->hasRole('user')) {
                    return redirect('')->with($res);
                }
                return redirect(RouteServiceProvider::HOME)->with($res);
            }
        }
        $res['message'] = 'salah username / katasandi';
        $res['success'] = false;
        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } else {
            return redirect()->back()->withInput()->with($res);
        }
    }

    public function forgot(Request $request)
    {
        $rule = [
            'email' => 'required|email',
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

        $status = Password::sendResetLink($request->only('email'));

        if ($status == Password::RESET_LINK_SENT) {
            $res['message'] = 'Reset password link sent, check your email';
            $res['success'] = true;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect()->back()->with($res);
            }
        } else {
            $res['message'] = 'Failed to send reset password link';
            $res['success'] = false;

            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_BAD_REQUEST);
            } else {
                return redirect()->back()->with($res);
            }
        }
    }

    public function reset(Request $request)
    {
        $rule = [
            'token' => ['required'],
            'email' => ['required', 'email'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
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

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user) use ($request) {
                $user->forceFill([
                    'password' => Hash::make($request->password),
                    'remember_token' => Str::random(60),
                ])->save();

                event(new PasswordReset($user));
            }
        );

        if ($status != Password::PASSWORD_RESET) {
            //            throw ValidationException::withMessages([
            //                'email' => [__($status)],
            //            ]);
            $res['message'] = __($status);
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->withErrors([
                    'email' => [__($status)],
                ])->with($res);
            }
        }

        $res['message'] = __($status);
        $res['success'] = true;
        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect()->back()->with($res);
        }
    }

    public function resetform(Request $request)
    {
        return redirect(env('FRONTEND_URL').'reset-form?token='.$request->get('token').'&email='.$request->get('token'));
    }
}
