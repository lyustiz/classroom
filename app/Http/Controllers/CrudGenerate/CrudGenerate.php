<?php

namespace App\Http\Controllers\CrudGenerate;

use App\Http\Controllers\CrudGenerate\Connection;
use App\Http\Controllers\CrudGenerate\Meta;
use App\Http\Controllers\CrudGenerate\ModelGenerator;
use App\Http\Controllers\CrudGenerate\ControllerGenerator;
use App\Http\Controllers\CrudGenerate\ViewGenerator;
use App\Http\Controllers\CrudGenerate\RouteGenerator;

class CrudGenerate
{
    private $connector;
    
    public $connection;

    public $meta;

    public $tables;
    
    public function __construct(Connection $conection)
    {
        $this->connector  = $conection;
        
        $this->connection = $this->connector->connect();

        $this->meta       = new Meta($this->connection);
    }

    public function generate()
    {
        $this->tables = json_decode(json_encode($this->tables), FALSE);

        $models      = $this->modelGenerate();

        $controllers = $this->controllerGenerate();

        $views       = $this->viewGenerate();

        $routes       = $this->routeGenerate();
        

        return compact('models', 'controllers', 'views', 'routes');
    }

    public function modelGenerate()
    {
        $modelGenerator = new ModelGenerator($this->tables);

        return $modelGenerator->generate();
    }

    public function controllerGenerate()
    {
        $controllerGenerator = new ControllerGenerator($this->tables);

        return $controllerGenerator->generate();
    }

    public function viewGenerate()
    {
        $viewGenerator = new ViewGenerator($this->tables);

        return $viewGenerator->generate(); 
    }

    public function routeGenerate()
    {
        $routeGenerator = new RouteGenerator($this->tables);

        return $routeGenerator->generate(); 
    }

    public function setConnection($ConnectionName)
    {
        $this->connection = $this->connector->connect($ConnectionName);

        $this->meta       = new Meta($this->connection);

        return $this;
    }

    public function getDatabases()
    {
        return $this->meta->getDatabases();
    }

    public function getSchemas()
    {
        $schemas = [];

        return $this->meta->getSchemas();
    }

    public function setSchema($schema)
    {
        $this->meta->setSchema($schema);

        return $this;
    }

    public function getTableMetadata(array $tables = [])
    {
        return $this->tables = $this->meta->getTableMetadata($tables);
    }
   
}