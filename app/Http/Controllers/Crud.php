<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\CrudGenerate\CrudGenerate;

class Crud extends Controller
{
    public $crud;

    public function __construct(CrudGenerate $crudGenerate)
    {
        $this->crud = $crudGenerate;
    }

    public function schemas()
    {
        $schemas = $this->crud->getSchemas();

        return  compact('schemas');

    }

    public function tables(Request $request)
    {
        $validate = request()->validate([
            'schema'          => 'required',
        ]);

       if( in_Array($request->schema, ['public', 'mysql']) ) 
       {
            return  $this->crud->getTableMetadata();
       }

       return $this->crud->setSchema($request->schema)->getTableMetadata();
    }
    
    public function generate(Request $request)
    {
      
        $validate = request()->validate([
            'tables'          => 'required',
            'schema'          => 'required',
        ]);
        

        if(in_Array($request->schema, ['public', 'mysql'])) 
        {
             $this->crud->getTableMetadata($request->tables);
        }
        else
        {
           $this->crud->setSchema($request->schema)->getTableMetadata($request->tables);
        }
        
       return   $this->crud->generate();

        //$object = json_decode(json_encode($array), FALSE);

    }
}
