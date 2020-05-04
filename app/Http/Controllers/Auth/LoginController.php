<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Symfony\Component\HttpFoundation\Request;
use \Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTFactory;
use Illuminate\Support\Facades\Crypt;

use JWTAuth;
use Cookie;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;


    public function username()
    {
        return 'nb_usuario';
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');
        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 400);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }
        return response()->json(compact('token'));
    }

    public function login(Request $request)
    {
        $credentials = [
            'nb_usuario' => $request->input('nb_usuario'),
            'password'   => $request->input('password')
        ];

        if(filter_var($request->input('nb_usuario'), FILTER_VALIDATE_EMAIL))
        {
            $credentials = [
                'tx_email'   => $request->input('nb_usuario'),
                'password'   => $request->input('password')
            ];
        } 

        if (Auth::attempt($credentials)) 
        {
            
            $user    = Auth::user();

            if($user->id_status == 1)
            {
                $payload = JWTFactory::sub($user->id_usuario)->make();
                
                $token   = JWTAuth::encode($payload);
                
                $m       = Cookie::queue('AUTH-TOKEN', $token->get(), 15);

                return [ 
                    'auth' => $token->get(),
                    'user' => $user,
                    'expires_in' => JWTFactory::getTTL() * 60
                ]; 
            }
            
            $hash = Crypt::encryptString($user->nb_usuario) . '|' . $user->verification;
            
            return response(['verification' => $hash], 403);
        }
        else
        {
            return response('Usuario o Contraseña Invalida', 403) ;
        }

    }

    public function logout(Request $request)
    {
        auth()->logout();

        //JWTAuth::parseToken()->refresh();
        
        return response('Cerrrando Sesion', 200) ;
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

}
