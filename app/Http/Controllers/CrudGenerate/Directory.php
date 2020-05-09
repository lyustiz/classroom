<?php

namespace App\Http\Controllers\CrudGenerate;

class Directory
{
    //global
    static public function createDirectory($path)
    {
        if (! is_dir($directory = $path)) {
           
           try {
               mkdir($directory, 0755, true);
           } catch (\Throwable $th) {
               dd($path, $th);
           }
            
        }
    }
}