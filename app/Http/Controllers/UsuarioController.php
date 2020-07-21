<?php 

namespace App\Http\Controllers;

use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Support\Str;


class UsuarioController extends Controller
{
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

            'nb_nombres'        => 'required',
            'fe_nacimiento'     => 'required',
            'tx_foto'           => 'required',
            'tx_sexo'           => 'required',
            'tx_src'            => 'nullable',
            'id_usuario'        => 'required',
            
        ],
        [
            'tx_foto.required'   => 'La foto es requerida',
        ]);
        
        $filename = $this->getFilename($request->input('tx_foto'), $usuario->id);
        
        if($request->filled('tx_src'))
        {
            $photo    = $this->storePhoto($request->input('tx_src'), $filename);
        }

        $request->merge(['tx_foto' => $filename]);
  
        $usuario  = $usuario->update($request->except('tx_src'));

        return [ 'msj' => 'Usuario Actualizado' , compact('usuario')];
    }


    private function storePhoto($fileSrc, $filename)
	{
        $srcFoto  = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $fileSrc));

        $stored = Storage::disk('account')->put($filename, $srcFoto);

        return $stored;
    }
    
    
    private function getFilename($file, $id_usuario)
    {
        $extension = explode(".", $file)[1];

        $filetypes = ['jpg', 'png', 'bmp'];

        $extension = in_array($extension, $filetypes) ?  $extension : 'jpg'; 

        return "$id_usuario.$extension"; 
    }

    public function updateEmail(Request $request, Usuario $usuario)
    {
        $validate = request()->validate([
            
            'tx_email'      => 'required',
            'tx_new_email'  => 'required',
            'tx_ret_email'  => 'required',
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
            'tx_ret_pass'   => 'required',
            'id_usuario'    => 'required',
        ],
        [
            'tx_password.required' => 'el password es obligatorio'
        ]);

        if (\Hash::check($request->input('tx_new_pass'), $usuario->password)) {
            
            $usuario  = $usuario->update([
                'tx_password'   => $request->input('tx_password'),
                'id_usuario'    => $request->input('id_usuario'),
            ]);

            return [ 'msj' => 'Password Actualizado' , compact('usuario')];

        }else {

            return  response()->json(['errors' => ['password' => 'El Password Actual no coincide']], 422);
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
