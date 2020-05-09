<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Illuminate\Routing\Console\ControllerMakeCommand as DefaultControllerMakeCommand;

class ControllerMakeCommand extends DefaultControllerMakeCommand
{

     /**
     * Get the stub file for the generator.
     *
     * @return string
     */
    protected function getStub()
    {
        if ($this->option('parent')) 
        {
            return resource_path("templates/controller/controller.nested.template");

        } elseif ($this->option('model')) 
        {
            return resource_path("templates/controller/controller.model.template");

        } elseif ($this->option('resource'))
        {
            return resource_path("templates/controllercontroller.template");
        }

        return resource_path("templates/controller/controller.plain.template");
    }


    
}
