<?php

namespace App\Http\Controllers\CrudGenerate;

use Illuminate\Support\Str;

use App\Http\Controllers\CrudGenerate\view\ViewFormGenerator;
use App\Http\Controllers\CrudGenerate\view\ViewListGenerator;

class ViewGenerator
{
    public $tables;

    //CONFIG

    public function __construct($tables)
    {
        $this->tables  = $tables;
    }

    public function generate()
    {
        foreach ($this->tables as  $table) 
        {
            $tableName = $table->name;
            
            $listGenerator =  new ViewListGenerator($table);

            $tableList[$tableName] = $listGenerator->generate();

            $formGenerator =  new ViewFormGenerator($table);

            $tableForm[$tableName] = $formGenerator->generate();

           
        }

        return [ 'list' => $tableList, 'form' => $tableForm ];
    }

}