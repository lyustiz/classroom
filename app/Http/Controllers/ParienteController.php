<?php

namespace App\Http\Controllers;

use App\Models\Pariente;
use App\Models\AlumnoPariente;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ParienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pariente = Pariente::with([
                                    'alumno:alumno.id,nb_nombre,nb_apellido', 
                                    'parentesco:parentesco.id,nb_parentesco',
                                    'foto:id,tx_src,id_tipo_foto,id_origen',
                                    'foto.tipoFoto:id,tx_base_path',
                            ])
                            ->get();
        
        return $pariente;
    }

    public function parienteAlumno($idAlumno)
    {
        return  Pariente::with(['parentesco:id,nb_parentesco'])
                        ->whereHas('alumno', function ($query)  use ($idAlumno){
                            $query->where('alumno.id', $idAlumno);
                        })
                        ->get();
    }

    public function parienteSearch(Request $request)
    {
        return  Pariente::comboData()
                        ->whereDoesntHave('alumno', function ($query)  use ($request){
                            $query->where('alumno.id', $request->id_alumno);
                        })
                        ->activo()
                        ->search($request->tx_search)
                        ->get();
    }

    public function storeValidate(Request $request)
    {
        return  request()->validate([
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'id_parentesco'     => 	'required|integer',
			'tx_empresa'        => 	'required|string|max:30',
			'tx_cargo'          => 	'required|string|max:30',
			'tx_ocupacion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = $this->storeValidate($request);
       
        $pariente = pariente::create($request->all());

        $usuario = UsuarioTrait::usuarioOrigenTipo($pariente, 4) ;

        return [ 'msj' => 'Pariente Agregado Correctamente', compact('pariente', 'usuario') ];
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeByAlumno(Request $request, $idAlumno)
    {
        $validate = $this->storeValidate($request);

        $pariente = pariente::create($request->all());

        $alumnoPariente = AlumnoPariente::create([
                                'id_alumno'         => $idAlumno,
                                'id_pariente'       => $pariente->id,
                                'bo_acudiente'      => 1,
                                'id_status'         => 1,
                                'id_usuario'        => $pariente->id_usuario
                            ]);

        return [ 'msj' => 'Pariente Agregado Correctamente', compact('pariente', 'alumnoPariente') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function show(Pariente $pariente)
    {
        return $pariente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pariente $pariente)
    {
        $validate = request()->validate([
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'id_parentesco'     => 	'required|integer',
			'tx_empresa'        => 	'required|string|max:30',
			'tx_cargo'          => 	'required|string|max:30',
			'tx_ocupacion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pariente = $pariente->update($request->all());

        return [ 'msj' => 'Pariente Editado' , compact('pariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pariente $pariente)
    {
        $pariente = $pariente->delete();
 
        return [ 'msj' => 'Pariente Eliminado' , compact('pariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function destroyByAlumno($idPariente, $idAlumno)
    {
        $pariente = AlumnoPariente::where('id_alumno', $idAlumno)
                    ->where('id_pariente', $idPariente)
                    ->delete();
        
        return [ 'msj' => 'Pariente Desvinculado' , compact('pariente')]; 
    }
}
