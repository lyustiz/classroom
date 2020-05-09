<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Illuminate\Foundation\Console\ModelMakeCommand as DefaultModelMakeCommand;

class ModelMakeCommand extends DefaultModelMakeCommand
{

    protected $name = 'make:model';


    protected function getStub()
    {
        
        
        if ($this->option("pivot")) 
        {
            return resource_path("templates/pivot.model.template");
        }        
        
        return resource_path("templates/model/model.template");
    }

    
}
