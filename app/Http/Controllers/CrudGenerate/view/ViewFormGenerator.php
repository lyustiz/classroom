<?php

namespace App\Http\Controllers\CrudGenerate\view;

use Illuminate\Support\Str;
use App\Http\Controllers\CrudGenerate\Directory;

class ViewFormGenerator
{
    public $table;
    
    public $columns;

    public $foreignTables;

    public $pickers;

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

        $this->basePath    = base_path(
                                $paths['views'] .  
                                $this->table->instanceName . '/' 
                             );

        $this->filePath     = $this->basePath . $this->table->instanceName . 'Form.vue';

        $this->templatePath = base_path( $paths['templates'] . 'view/' );
        
        $this->hiddenCols   = $cols['hiddenCols'];
    }

    public function generate()
    {
        $this->definition();

        Directory::createDirectory($this->basePath);

        return  $this->compile();
    }

    public function definition()
    {
        foreach ($this->columns as $column )
        {
            if( $column->name != $this->table->primaryKey && !in_array($column->name, $this->hiddenCols) && $column->name != 'id_usuario')
            {
                $this->definition .= $this->fieldTemplates($column);
            }
        }

        $this->definition .= $this->selectFields();
    }

    public function compile()
    {
        $formGenerate = file_put_contents(
            $this->filePath,
            $this->compileForm()
        );

        if( $formGenerate === false)
        {
            dd('Error al generar form de la tabla: ' . $this->table->name );
        };

        return  $this->filePath; 
    }
    
    protected function compileForm()
    {
        $tableColumns  = $this->formatTableColumns();

        $foreignTables = $this->formatForeingTables(); 

        $pickers       = $this->formatPickers(); 
        
        return str_replace(
            ['{{tableName}}', '{{className}}', '{{tableField}}', '{{formFields}}', '{{foreignTables}}', '{{pickers}}'],
            [$this->table->name, $this->table->className, $tableColumns, $this->definition, $foreignTables, $pickers],
            file_get_contents( $this->templatePath . "form.template" )
        );
    }

    public function fieldTemplates($column)
    {

        switch (true) 
        {
            case in_array( $column->type, [ 'string', 'text' ] ):

                return $this->fieldTemplate('text', $column->name, $column->labelName);

            case in_array( $column->type, [ 'datetime', 'date' ] ): 

                $this->pickers[] =  $column->name;
                return $this->fieldTemplate('date', $column->name, $column->labelName);
    
            case $column->type == 'integer':
                
                if($column->prefix =='id')
                {
                    $fkTableName     = str_replace( 'id_', '', $column->name );

                    $fkColTableName  = str_replace( 'id_', 'nb_', $column->name );

                    return $this->fieldTemplate('select', $column->name, $column->labelName, $fkTableName, $fkColTableName, 'id');
                }

                return $this->fieldTemplate('text', $column->name, $column->labelName);
        
            case $column->type == 'decimal':

                return $this->fieldTemplate('text', $column->name, $column->labelName);

            case $column->type == 'boolean':

                return $this->fieldTemplate('checkbox', $column->name, $column->labelName);
            
            default:

                return $this->fieldTemplate('text', $column->name, $column->labelName);
       }
    }

    protected function fieldTemplate( $columnType, $columnName, $labelName, $fkTableName = null, $fkColTableName = null, $fkTableId = null )
    {
        $fkColTableName = str_replace( 'id_', 'nb_', $fkColTableName );

        $fkInstanceName = Str::camel($fkTableName); 
        
        return str_replace(
            [ '{{columnName}}', '{{labelName}}', '{{fkTableName}}', '{{fkColTableName}}', '{{fkTableId}}', '{{fkInstanceName}}' ],
            [ $columnName, $labelName, $fkTableName, $fkColTableName, $fkTableId, $fkInstanceName ],
            file_get_contents($this->templatePath . 'form/' . $columnType. ".template")
        );
    }

    public function selectFields()
    {
        $selectFields        = null;

        if( $this->table->foreignKeys != [])
        {
            foreach ($this->table->foreignKeys as $foreingnKey) {

                $selectFields .=    $this->fieldTemplate(
                                        'select', 
                                        $foreingnKey->localColumn->name,
                                        $foreingnKey->localColumn->labelName,
                                        $foreingnKey->foreignTable->instanceName,
                                        $foreingnKey->foreignColumn->name
                                    );

                $this->foreignTables[] = $foreingnKey->foreignTable->instanceName;
            }
        }
        return $selectFields;
    }

    public function formatTableColumns()
    {
        $formColumns = [];

        foreach( $this->columns as $column ) 
        {
            if(!in_array($column->name, $this->hiddenCols))
            {
                $formColumns[] = $column->name . ": \tnull,";
            }
        }

        return implode(  PHP_EOL ."\t\t\t\t" , $formColumns ) ;
    }

    public function formatForeingTables()
    {
        $formatTable = [];

        if($this->foreignTables != [])
        {
            foreach ($this->foreignTables as $foreignTable) 
            {
                $formatTable[] = $foreignTable . ": \t [],";
            }
        }
        else{

            foreach ($this->columns as $column) 
            {
                
                if($column->prefix =='id' && $column->name != 'id' && $column->name != 'id_usuario')
                {
                    $foreignTable  = str_replace( 'id_', '', $column->name );

                    $foreignTable  = Str::camel($foreignTable);

                    $formatTable[] = $foreignTable . ": \t [],";
                }
            }
        }
 
        return implode(  PHP_EOL ."\t \t \t \t" , $formatTable ) ;
    }

    public function formatPickers()
    {
        
        $formatPickers = [];

        if($this->pickers != [])
        {
            foreach ($this->pickers as $picker) 
            {
                if(!in_array($picker, $this->hiddenCols))
                {
                    $formatPickers[] = $picker . ": \t null,";
                }
            }
        }
 
        return implode(  PHP_EOL ."\t \t \t \t" , $formatPickers );
    }

}