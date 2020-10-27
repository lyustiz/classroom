<?php

namespace App\Http\Controllers\Traits;
use App\Models\Archivo;
use App\Models\TipoArchivo;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

trait ArchivoTrait
{
    static public function store(Request $request)
    {
        $validate = self::validateData($request);

        $request->merge(['tx_path' => replaceSpecialChars($request->tx_path) ]);

        $archivo = Archivo::create($request->all());

        $tipoArchivo = TipoArchivo::where('id', $request->id_tipo_archivo)->first();

        $fileSource = $request->tx_file_source;
        $storage    = $tipoArchivo->tx_storage;
        $fileName   = $request->tx_path;
        $folder     = $request->tx_origen_id;

        $file = self::writeFile($fileSource, $storage, $fileName, $folder);

        return [ 'msj' => 'Archivo Agregado Correctamente', ['archivo' => $archivo, 'file' =>  $file ] ];
    }

    static public function validateData($request)
    {
        $validate = request()->validate([
            'nb_archivo'        => 	'required|string|max:30',
			'id_tipo_archivo'   => 	'required|integer|max:999999999',
			'tx_origen_id'      => 	'required|integer|max:999999999',
            'tx_path'           => 	'required|string|max:255',
            'tx_mimetype'       => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
            'id_usuario'        => 	'required|integer|max:999999999',
            'tx_file_source'    => 	'required|string',
        ]);

        return $validate;
    }
    
    static public function writeFile($fileSource, $storage, $fileName, $folder)
	{
        $fileSource = substr($fileSource, strpos($fileSource, 'base64,') + 7);
             
        $fileSource = base64_decode($fileSource);
                                                    
        return Storage::disk($storage)->put($folder.DIRECTORY_SEPARATOR.$fileName, $fileSource);
    }

    static public function deleteFile( $storage, $path )
    {
       return Storage::disk($storage)->delete($path);
    }

    static function replaceSpecialChars($string) 
    {
        $string = str_replace(' ', '-', $string); 
     
        return preg_replace('/[^A-Za-z0-9\-]/', '-', $string);
    }

    /*  function replaceSpecialChars($string) 
    {
        $especial = [" ","á","é","í","ó","ú","Á","É","Í","Ó","Ú","ñ","Ñ","À","Ã","Ì","Ò","Ù","Ã™","Ã ","Ã¨","Ã¬","Ã²","Ã¹","ç","Ç","Ã¢","ê","Ã®","Ã´","Ã»","Ã‚","ÃŠ","ÃŽ","Ã”","Ã›","ü","Ã¶","Ã–","Ã¯","Ã¤","«","Ò","Ã","Ã„","Ã‹"];
        
        $replace  = ["","a","e","i","o","u","A","E","I","O","U","n","N","N","A","E","I","O","U","a","e","i","o","u","c","C","a","e","i","o","u","A","E","I","O","U","u","o","O","i","a","e","U","I","A","E"];
        
        return str_replace($especial, $replace , $cadena);
    } */



}
