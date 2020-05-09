<?php

namespace App\Http\Controllers\CrudGenerate\view;

use Illuminate\Support\Str;
use App\Http\Controllers\CrudGenerate\Directory;

class ViewListGenerator
{
    public $table;

    public $columns;

    public $foreignTables;

    public $headers = array();
    
    public $listColumns;

    public $definition;

    //CONFIG

    private $basePath;

    private $filePath;

    private $templatePath;

    private $hiddenCols;

    public function __construct($table)
    {
        $this->table   = $table;

        $this->columns = $table->columns;

        $this->config();
    }

    public function config()
    {
        $conf  = \Config::get('crudgenerate');

        $paths = $conf['paths'];

        $cols  = $conf['cols'];

        $this->basePath     = base_path(
                                $paths['views'] .  
                                $this->table->instanceName . '/' 
                            );
        
        $this->filePath     = $this->basePath . $this->table->instanceName . '.vue';                    

        $this->templatePath = base_path( $paths['templates'] . 'view/' );
        
        $this->hiddenCols   = $cols['hiddenCols'];
    }

    public function generate()
    {
        $this->definition();
        
        Directory::createDirectory($this->basePath);

        return $this->compile();
    }

    public function definition()
    {
        foreach ($this->columns as $column )
        {
            if($column->name != $this->table->primaryKey)
            {
                $this->defineHeaders();

                $this->defineListColumns();
            }
        } 
    }

    public function compile()
    {
        $listGenerate =  file_put_contents(
            $this->filePath,
            $this->compileList()
        );

        if($listGenerate === false )
        {
            dd('Error al generar list de la tabla: ' . $this->table->name );
        };
        
        return  $this->filePath; 
    }

    protected function compileList()
    {
        $formName    = Str::kebab($this->table->className) . '-form';

        return str_replace(
            ['{{tableName}}', '{{primaryKey}}', '{{className}}', '{{instanceName}}', '{{formName}}', '{{headers}}', '{{listColumns}}', '{{slugName}}',],
            [$this->table->name, $this->table->primaryKey, $this->table->className, $this->table->instanceName, $formName, $this->headers, $this->listColumns, Str::kebab($this->table->className) ],
            file_get_contents( $this->templatePath . "list.template" )
        );
    }
     
    public function defineHeaders()
    {
        $headers = [];
        
        $exceptions = array_merge($this->hiddenCols, ['id', 'id_usuario', $this->table->primaryKey]);

        foreach ($this->columns as $column) 
        {
            if(!in_array($column->name, $exceptions))
            {
                $headers[] = $this->headerTemplate($column);
            }
        }

        $this->headers = implode( PHP_EOL ."\t\t\t" , $headers );
    }

    public function defineListColumns()
    {
        $listColumns = [];

        $exceptions = array_merge($this->hiddenCols, ['id', 'id_usuario', $this->table->primaryKey]);
        
        foreach ($this->columns as $column) 
        {
            if(!in_array($column->name, $exceptions))
            {
                if($column->name == 'id_status')
                {
                    $listColumns[] = $this->listSwitchTemplate($column);
                }
                else
                {
                    $listColumns[] = $this->listTemplate($column);
                }
            }
        }

        $this->listColumns = implode( PHP_EOL ."\t\t\t\t\t\t" , $listColumns );
    }

    public function headerTemplate($column)
    {
        return str_replace(
            [ '{{headerName}}', '{{columnName}}' ],
            [ $column->labelName,  $column->name ],
            file_get_contents( $this->templatePath . 'list/header.template' )
        );
    } 

    public function listTemplate($column)
    {
        return str_replace(
            [ '{{columnName}}' ],
            [ $column->name ],
            file_get_contents($this->templatePath . 'list/column.template' )
        );
    } 
    
    public function listSwitchTemplate($column)
    {
        return str_replace(
            [ '{{columnName}}' ],
            [ $column->name ],
            file_get_contents($this->templatePath . 'list/switch.template' )
        );
    }
}