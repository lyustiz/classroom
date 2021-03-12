<?php

namespace App\Http\Controllers\Traits;

use App\Models\Notificacion;
use App\Models\TipoNotificacion;
use App\Models\TipoDestinatario;
use Illuminate\Support\Facades\Mail;

use App\Models\Alumno;
use App\Models\Evaluacion;
use App\Models\TipoEvaluacion;
use App\Models\TipoAsignacion;
use App\Models\Docente;
use App\Models\Materia;

use Illuminate\Database\Eloquent\Builder;

class NotificacionTrait
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    static public function notificar(Array $data, $sendMail = false)
    {
        return Notificacion::create([
            'id_tipo_destinatario' => $data['id_tipo_destinatario'],
			'id_destinatario'      => $data['id_destinatario'],
			'tx_mensaje'           => $data['tx_mensaje'],
            'id_tipo_notificacion' => $data['id_tipo_notificacion'],
            'id_usuario'           => $data['id_usuario'],
            'fe_notificacion'      => date('Y-m-d'), 
            'id_status'            => 1 
        ]);
    }

    static public function sancion($data)
    {
        $alumno       = Alumno::find($data['id_alumno']);
        $acudientes   = $alumno->pariente;
        $mensaje      = str_replace( '{{alumno}}', $alumno->nb_corto, TipoNotificacion::find(4)->tx_observaciones);
        $notificacion = [];
        
        foreach ($acudientes as $acudiente) 
        {
            $notificacion[] = self::notificar([
                'id_tipo_destinatario' => 4,
                'id_destinatario'      => $acudiente->id,
                'tx_mensaje'           => $mensaje,
                'id_tipo_notificacion' => 4,
                'id_usuario'           => $data['id_usuario'],
            ]);
        }
        return $notificacion;
    }

    static public function evaluacion($data)
    {
        $tipoEvaluacion = TipoEvaluacion::find($data['id_tipo_evaluacion']);
        $materia        = Materia::find($data['id_materia']);
        $tipo           = ($tipoEvaluacion->id == 1) ? 7 : 8;

        $mensaje        = str_replace( '{{materia}}', $materia->nb_materia, TipoNotificacion::find($tipo)->tx_observaciones);
        $notificacion   = [];
        
        foreach ($data['alumnos'] as $IdAlumnoid) 
        {
            $notificacion[] = self::notificar([
                'id_tipo_destinatario' => 3,
                'id_destinatario'      => $IdAlumnoid,
                'tx_mensaje'           => $mensaje,
                'id_tipo_notificacion' => $tipo,
                'id_usuario'           => $data['id_usuario'],
            ]);
        }
        return $notificacion;
    }

    static public function asignacion($data)
    {
        $notificacion   = [];
        $tipoAsignacion = TipoAsignacion::find($data['id_tipo_asignacion']);
        $materia        = Materia::find($data['id_materia']);
        $tipo           = 6;
        $mensaje        = str_replace(  [ '{{tipo}}', '{{materia}}' ], 
                                        [$tipoAsignacion->nb_tipo_asignacion,  $materia->nb_materia], 
                                        TipoNotificacion::find($tipo)->tx_observaciones
                                    );
        
        foreach ($data['alumnos'] as $alumno) 
        {
            $notificacion[] = self::notificar([
                'id_tipo_destinatario' => 3,
                'id_destinatario'      => $alumno->id,
                'tx_mensaje'           => $mensaje,
                'id_tipo_notificacion' => $tipo,
                'id_usuario'           => $data['id_usuario'],
            ]);
        }
        return $notificacion;
    }

    static public function clase($data)
    {
        $notificacion = [];
        $materia      = Materia::find($data['id_materia']);
        $tipo         = 5;
        $mensaje      = str_replace('{{materia}}', $materia->nb_materia , TipoNotificacion::find($tipo)->tx_observaciones);
        
        foreach ($data['alumnos'] as $alumno) 
        {
            $notificacion[] = self::notificar([
                'id_tipo_destinatario' => 3,
                'id_destinatario'      => $alumno->id,
                'tx_mensaje'           => $mensaje,
                'id_tipo_notificacion' => $tipo,
                'id_usuario'           => $data['id_usuario'],
            ]);
        }
        return $notificacion;
    }

    static public function reportar($data)
    {
        $evaluacion  =  Evaluacion::with([
                            'materia:id,nb_materia',
                            'grupo:id,nb_grupo,id_grado',
                            'grupo.grado:id,nb_grado',
                            'planEvaluacion:id,id_docente',
                            'planEvaluacion.docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2'
                        ])->find($data['id_evaluacion']);

        $grado      = $evaluacion->grupo->grado;

        $materia    = $evaluacion->materia;

        $docente    = $evaluacion->planEvaluacion->docente;
    
        $mensaje    =  'Se reportó el(la) ' 
                     . $data['nb_tipo'] . ' ' 
                     . $data['nb_asignacion'] . ' ('
                     . $grado->nb_grado . ' - ' 
                     . $materia->nb_materia
                     . ') motivo: ' 
                     . $data['nb_tipo_reporte'] . ' - obs: '
                     . $data['tx_observaciones'];

        return self::notificar([
                    'id_tipo_destinatario' => 2,
                    'id_destinatario'      => $docente->id,
                    'tx_mensaje'           => $mensaje,
                    'id_tipo_notificacion' => 10,
                    'id_usuario'           => $data['id_usuario'],
                ]);

    }

    static public function sendMail()
    {
            // Enviar codigo de confirmacion
        \Mail::send('auth.mail.mail_confirm', $data, function($message) use ($data) {
            $message
            ->locale('es')
            ->to($data['email'], $data['nb_usuario'])
            ->subject('"DesdeCasaWeb.com", Por favor confirma tu correo')
            ->queue(new OrderShipped($order));
        });
    }

    

  
}