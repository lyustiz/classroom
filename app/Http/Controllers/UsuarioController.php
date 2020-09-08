<?php 

namespace App\Http\Controllers;

use App\Models\Usuario;
use App\Models\TipoUsuario;
use App\Models\UsuarioPerfil;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class UsuarioController extends Controller
{
    use UsuarioTrait;
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuarios = Usuario::with([
                                        'perfil',
                                        'foto:id,tx_src,id_tipo_foto,id_origen',
                                        'foto.tipoFoto:id,tx_base_path'
                                    ])
                           ->get();
        
        return $usuarios;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = request()->validate([

            'nb_nombres'        => 'required',
            'nb_usuario'        => 'required',
            'password'          => 'required',
            'tx_email'          => 'required',
            'tx_nuip'           => 'required',
            'tx_observaciones'  => 'required',
            'remember_token'    => 'required',
            'id_tipo_usuario'   => 'required',
            'id_status'         => 'required',
            'id_usuarioe'       => 'required',
            
        ]);

        $usuario = Usuario::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('usuario') ];
    }

    public function usuarioLoteTipo($idTipoUsuario)  //(Request $request)
    {
        if($idTipoUsuario == 1) 
        {
            throw ValidationException::withMessages(['createAdministrador' => "No es posible crear usuario Administrador"]);
        }
                
        $tipoUsuario  = TipoUsuario::find($idTipoUsuario);

        $tableName    = $tipoUsuario->tx_tabla;

        $idPerfil     = $tipoUsuario->id_perfil;

        $dataUsuarios = \DB::table($tableName)
                           ->whereNotIn('id', function($query) use( $idTipoUsuario){
                                $query->select('id_origen')
                                    ->from('usuario')
                                    ->where('id_tipo_usuario', $idTipoUsuario);
                            })->get()->toArray();

        $idColegio   = null;
        
        $usuarios    = [];
        
        foreach ($dataUsuarios as $key => $data) 
        {
            $idColegio   = ($idColegio == null) ?  Usuario::find($data->id_usuario)->id_colegio : $idColegio;
            
            $nbUsuario   = UsuarioTrait::makeNbUsuario($data);

            $dataUsuario = [
                'nb_usuario'      => $nbUsuario,
                'nb_nombres'      => strtolower($data->nb_nombre) . ' ' . strtolower($data->nb_apellido),
                'id_colegio'      => $idColegio,
                'tx_email'        => $data->tx_email,
                'id_tipo_usuario' => $idTipoUsuario,
                'id_origen'       => $data->id,
                'id_usuario'      => $data->id_usuario, //TODO
            ];

            $usuario = UsuarioTrait::store($dataUsuario);

            $perfil  = UsuarioPerfil::create([
                        'id_usuario'     => $usuario->id,
                        'id_perfil'      => $idPerfil,
                        'id_status'      => 1,
                        'id_usuario_ed'  => $data->id_usuario
                        ]);

            $usuarios[] = $usuario;
        }

        return [ 'msj' => "Usuarios Crados ($tableName)", 'creados' =>  count($usuarios)];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function show(Usuario $usuario)
    {
        return $usuario;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usuario $usuario)
    {
        $validate = request()->validate([

            'tx_email'        => 'required',
            'tx_password'     => 'required',
            'id_usuario'      => 'required',
        ]);

        if($usuario->id_tipo_usuario = 1)
        {
            throw ValidationException::withMessages(['adminNotEdit' => "No es posible editar al usuario Administrador"]);
        }

        $usuario  = $usuario->update([
            'tx_email'      => $request->tx_email,
            'tx_password'   => Hash::make($request->tx_password),
            'id_usuario'    => $request->id_usuario,
        ]);
        

        return [ 'msj' => 'Usuario Actualizado' , compact('usuario')];
    }


    public function updateEmail(Request $request, Usuario $usuario)
    {
        $validate = request()->validate([
            'tx_email'      => 'required',
            'tx_new_email'  => 'required',
            'id_usuario'    => 'required',
        ]);

        $usuario  = $usuario->update([
            'tx_email'      => $request->input('tx_new_email'),
            'id_usuario'    => $request->input('id_usuario'),
        ]);

        return [ 'msj' => 'Correo Actualizado' , compact('usuario')];
    }

    public function updatePassword(Request $request, Usuario $usuario)
    {
        $validate = request()->validate([
            
            'tx_password'   => 'required',
            'tx_new_pass'   => 'required',
            'id_usuario'    => 'required',
        ],
        [
            'tx_password.required' => 'el password es obligatorio'
        ]);

        if (\Hash::check($request->input('tx_password'), $usuario->password)) {
            
            $usuario  = $usuario->update([
                'tx_password'   => Hash::make($request->tx_new_pass),
                'id_usuario'    => $request->input('id_usuario'),
            ]);

            return [ 'msj' => 'Password Actualizado' , compact('usuario')];

        }else {

            throw ValidationException::withMessages(['passwordNotMatch' => "Password Actual no coincide con nuestros registros"]);
        }
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuario $usuario)
    {
        $usuario = $usuario->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('usuario')];
    }

    protected function decryptHash( $hash )
    {
        $hash = explode( '|' , $hash );
        
        try {
            
            $data =   [ 
                'usuario'      => Crypt::decryptString($hash[0]), 
                'verification' => $hash[1]
               ];

        } catch (DecryptException $e) {
            
            $data =   [ 
                'usuario'      => 'badUser', 
                'verification' => 'badHash'
               ];
        }
        
        return $data;
    }

    public function verify(Request $request)
    {
        $validate = request()->validate([
            'hash'      => 'required',
        ]);

        $hash         = $this->decryptHash($request->input('hash'));

        $nb_usuario   = $hash['usuario'];

        $verification = $hash['verification'];
                
        $usuario = Usuario::where('verification', $verification)
                          ->where('nb_usuario'  , $nb_usuario)
                          ->first();

        $mensaje = null;
        $tipo    = null;

        if ($usuario)
        {
            $usuario->id_status     = 1;
            $usuario->verification  = null;
            $usuario->save();

            $msj     = 'Cuenta del usuario confirmada ';
            $tipo    = 'success';
            $resend  = false;
        }
        else
        {
            $msj     = 'Enlace de confirmacion inválido';
            $tipo    = 'error';
            $resend  = true;
        }

        return compact('msj', 'tipo', 'resend');
    }

    public function resend(Request $request)
    {      
        $validate = request()->validate([
            'hash'      => 'required',
        ]);
        
        $hash   = $this->decryptHash($request->input('hash'));

        $nb_usuario   = $hash['usuario'];

        $usuario = Usuario::where('nb_usuario'  , $nb_usuario)
                           ->where('id_status'  , 2)
                           ->first();

        $msj     = 'Enlace de confirmacion inválido';
        $tipo    = 'error';
                        
        if($usuario)
        {
            $verification = Str::random(64);

            $usuario->verification  = $verification;
            $usuario->save();
            
            $data = $usuario->toArray();

            $data['verification'] = Crypt::encryptString($nb_usuario) . '|' . $verification;

            // Enviar codigo de confirmacion
            \Mail::send('auth.mail.mail_confirm', $data, function($message) use ($data) {
                $message->to($data['tx_email'], $data['nb_usuario'])->subject('"DesdeCasaWeb.com", Por favor confirma tu correo');
            });

            $msj     = 'Enviado correctamente favor verifique su Correo';
            
            $tipo    = 'success';

        }
        
        return compact('msj', 'tipo');
    }


    public function recoverPassword(Request $request)
    {
        
        $validate = request()->validate([
            'tx_email'   => 'required|email',
        ]);
        
        $usuario = Usuario::where('tx_email', $request->tx_email)
                          ->first();
         
        $msj     = 'El Correo no existe en nustros registros';
        $tipo    = 'error';
        $resend  = true;

        if ($usuario)
        {
            $verification = Str::random(64);

            $usuario->remember_token = $verification;
            $usuario->save();

            $msj     = 'recuperacion de Contraseña Enviada favor verifique su Correo';
            $tipo    = 'success';
            $resend  = false;

            $data = $usuario->toArray();

            $data['verification'] = Crypt::encryptString($usuario->nb_usuario) . '|' . $verification;

            // Enviar codigo de confirmacion
            \Mail::send('auth.mail.mail_recover', $data, function($message) use ($data) {
                $message->to($data['tx_email'], $data['nb_usuario'])->subject('"DesdeCasaWeb.com", Recuperacion de Contraseña');
            });
        }

        return compact('msj', 'tipo', 'resend');
    }

    public function resetPassword(Request $request)
    {
        
        $validate = request()->validate([
            
            'password'      => 'required',
            'passwordRew'   => 'required',
            'hash'          => 'required',
        ],
        [
            'password.required' => 'el password es requerido'
        ]
        );

        $hash         = $this->decryptHash($request->input('hash'));

        $nb_usuario   = $hash['usuario'];

        $verification = $hash['verification'];
                
        $usuario = Usuario::where('remember_token', $verification)
                          ->where('nb_usuario'  , $nb_usuario)
                          ->first();

        $msj     = 'Codigo de recuperacion inválido';
        $tipo    = 'error';

        if ($usuario)
        {
            $update  = $usuario->update([
                'tx_password'     => $request->input('password'),
                'remember_token'  => null,
            ]);
            
            $msj     = 'Password Actualizado ';
            $tipo    = 'success';
        }

        return compact('msj', 'tipo');

    }

}
