<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use BotMan\BotMan\BotMan;
use BotMan\BotMan\Messages\Incoming\Answer;

class BotmanController extends Controller
{

    public function talk()
    {

        $botman = app('botman');
  
        $botman->hears('{message}', function($botman, $message) {
  
            switch ($message) {
                case 'hola':
                    $this->askName($botman);
                    break;
                
                case 'opciones':
                    $this->opciones($botman);
                break;
                
                default:
                    $botman->reply('No entiendo la pregunta escribe "opciones" sin comillas');
                    break;
            }
            
        });

        $botman->listen();
    }

    public function askName($botman)
    {
        $botman->ask('Hola Cual es tu Nombre:', function(Answer $answer) {
  
            $name = $answer->getText();
  
            $this->say('Un placer '.$name);
        });
    }

    public function opciones($botman)
    {
        $options = ['clase', 'examen', 'tarea'];
        
        $botman->ask('Opciones clase, examen, tarea', function(Answer $answer) use ($options) {
  
            $opcion = $answer->getText();

            if( in_array($opcion, $options) )
            {
                $this->say('Seleccionaste ' . $opcion);
            } else {
                $this->say("opcion invlida");
            }
        });
    }


}
