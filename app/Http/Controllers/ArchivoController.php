<?php

namespace App\Http\Controllers;

use App\Models\Archivo;
use App\Models\TipoArchivo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ArchivoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $archivo = Archivo::with([])
                    ->get();
        
        return $archivo;
    }


    public function archivoTipoOrigen( $idTipoArchivo, $origenId )
    {
        $archivo = Archivo::with(['tipoArchivo:id,nb_tipo_archivo,tx_origen,tx_base_path'])
                          ->where('id_tipo_archivo', $idTipoArchivo)
                          ->where('tx_origen_id', $origenId)
                          ->get();
        
        return $archivo;
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

        $request->merge(['tx_path' => date('U').'_'.$request->tx_path]);

        $archivo = archivo::create($request->all());

        $tipoArchivo = TipoArchivo::where('id', $request->id_tipo_archivo)->first();

        $fileSource = $request->tx_file_source;
        $storage    = $tipoArchivo->tx_storage;
        $fileName   = $request->tx_path;
        $folder     = $request->tx_origen_id;

        $stored = $this->storeArchivo($fileSource, $storage, $fileName, $folder);

        return [ 'msj' => 'Archivo Agregado Correctamente', compact('archivo', 'stored') ];
    }


    public function storeArchivo($fileSource, $storage, $fileName, $folder)
	{
        $fileSource = substr($fileSource, strpos($fileSource, 'base64,') + 7);
             
        $fileSource  = base64_decode($fileSource);
                                                    
        $stored = Storage::disk($storage)->put($folder.DIRECTORY_SEPARATOR.$fileName, $fileSource);

        return $stored;
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function show(Archivo $archivo)
    {
        return $archivo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Archivo $archivo)
    {
        $validate = request()->validate([
            'nb_archivo'        => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
            'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $archivo = $archivo->update($request->only(['nb_archivo', 'tx_observaciones', 'id_usuario' ]));

        return [ 'msj' => 'Archivo Actualizado' , compact('archivo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Archivo $archivo)
    {
        
        $tipoArchivo = TipoArchivo::where('id', $archivo->id_tipo_archivo)->first();

        $storage    = $tipoArchivo->tx_storage;
        $path       = $archivo->tx_origen_id.DIRECTORY_SEPARATOR.$archivo->tx_path;

        if($this->deleteFile( $storage, $path ))
        {
            $archivo = $archivo->delete();
            return [ 'msj' => 'Archivo Eliminado' , compact('archivo')];

        }else
        {
            return response('Error al Eliminar el Archivo', 403) ;
        }

    }

    public function deleteFile( $storage, $path )
    {
       return Storage::disk($storage)->delete($path);
    }
}
