<?php

namespace App\Http\Controllers\CrudGenerate;

use Illuminate\Support\Str;

class RouteGenerator
{
    public $tables;

    //CONFIG

    private $routePath;

    private $apiPath;

    private $templatePath;


    public function __construct($tables)
    {
        $this->tables = $tables;

        $this->config();
    }

    public function config()
    {
        $conf  = \Config::get('crudgenerate');

        $paths = $conf['paths'];

        $cols  = $conf['cols'];

        $this->routePath    = $paths['routes'];

        $this->apiPath      = $paths['apis'];

        $this->templatePath = $paths['templates'] . 'route/';
    }

    public function generate()
    {
        $routes = [];
        
        foreach ($this->tables as $tableName => $table) 
        {
            $definition = $this->definition($tableName, $table);
            
            $this->compile($table, $definition);
           
            $routes[$tableName] = [
                'route' => $this->routePath,
                'api'   => $this->apiPath
            ];
        }
        return $routes;
    }

    public function definition($tableName, $table)
    {
        return [
            'route' => $this->routeDefinition($tableName, $table),
            'api'   => $this->apiDefinition($tableName, $table)
        ];
    }

    public function routeDefinition($tableName, $table)
    {
        $routeImport =  str_replace(
            ['{{className}}', '{{instanceName}}'],
            [ $table->className, $table->instanceName ],
            file_get_contents(base_path($this->templatePath . 'routeImport.template'))
        );

        $route  =  str_replace(
            ['{{className}}', '{{instanceName}}'],
            [ $table->className, $table->instanceName ],
            file_get_contents(base_path($this->templatePath . 'route.template'))
        );

        return ['routeImport' => $routeImport, 'route' => $route ];
    }

    public function apiDefinition($tableName, $table)
    {
        return str_replace(
            ['{{className}}', '{{instanceName}}'],
            [ $table->className, $table->instanceName ],
            file_get_contents(base_path($this->templatePath . 'api.template'))
        );
    }
    
  

    public function compile($table, $definition)
    {
       
        $compiledRoute  = $this->compileRoute($table, $definition['route']);

        $compiledApi    = $this->compileApi($table, $definition['api']);

        return $compiledRoute && $compiledApi;

    }


    public function compileRoute($table, $definition)
    {
        $compiled =  str_replace(
            [ '//newRoutes' , '//newImport'],
            [ $definition['route'] . PHP_EOL . '//newRoutes' , $definition['routeImport'] . PHP_EOL . '//newImport' ],
            file_get_contents(base_path($this->routePath ))
        );

        return file_put_contents(
            base_path($this->routePath ),
            $compiled
        );
    }

    public function compileApi($table, $definition)
    {
        $compiled =  str_replace(
            [ '//newRoutes' ],
            [ $definition . PHP_EOL . '//newRoutes'] ,
            file_get_contents(base_path($this->apiPath ))
        );

        return file_put_contents(
            base_path($this->apiPath ),
            $compiled
        );
    }
}