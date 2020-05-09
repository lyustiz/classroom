<?php

namespace App\Http\Controllers\CrudGenerate;

use Illuminate\Support\Str;

class Meta
{
    
    public $schemaManager;

    public $schema;

    public $tableObjects;

    public $tables;
    
    public function __construct($connection)
    {
        $this->setSchemaManager($connection);
    }

    public function getTableMetadata(array $tables)
    {
        $this->getTables($tables);

        return $this->tables = $this->setTablesMetadata();
    }

    public function setTablesMetadata()
    {
        $tables = [];

        if($this->tableObjects != [])
        {
            foreach ($this->tableObjects as $tableObject) {
                
                $tablename    = $this->getTableName($tableObject->getName());

                $className    = Str::studly($tablename);

                $instanceName = Str::camel($tablename);

                $columns      = $this->getColumnArray($tableObject->getColumns());
        
                $primaryKey   = $this->getPrimaryKey($tableObject);

                $foreingKeys  = $this->getForeignKeys($tableObject);
                
                $tables[$tablename] = [
                    'name'          => $tablename,
                    'className'     => $className,
                    'instanceName'  => $instanceName,
                    'columns'       => $columns,
                    'primaryKey'    => $primaryKey,
                    'foreignKeys'   => $foreingKeys
                ];
            }
        }
        return $tables;
    }


    /** tables */

    // exception requiere schema

    public function getTables(array $tables)
    {
        
        if(count($tables) < 1)
        {
            $tables = $this->schemaManager->listTables();

        } else {

            $temp = []; 
            foreach ($tables as $table) {
                $temp[] = $this->schemaManager->listTableDetails($table['name']);
            }

            $tables = $temp;
        }
        
        foreach ($tables as  $table) {

            if($table->getNamespaceName() == $this->schema)
            {
                $this->tableObjects[] = $table;
            }
        }
    }

    public function getTableName($tableFullName)
    {
        if(strrpos($tableFullName, '.'))
        {
            return strtolower(substr($tableFullName, strpos($tableFullName, '.') + 1));
        }
    
        return $tableFullName;
    }


    /** cols */

    public function getColumnArray($columnObjects)
    {
        $columns = [];

        foreach ($columnObjects as $columnObject) 
        {
            $colsAttr  = $this->getColumnsAttributes($columnObject);

            $labelName = $this->labelName($colsAttr['name']);

            $prefix    = $this->getPrefix($colsAttr['name']);

            $columns[$colsAttr['name']] = [
                'name'      => $colsAttr['name'],
                'type'      => $colsAttr['type'],
                'notnull'   => $colsAttr['notnull'],
                'length'    => $colsAttr['length'],
                'precision' => $colsAttr['precision'],
                'comment'   => $colsAttr['comment'],
                'labelName' => $labelName,
                'prefix'    => $prefix
            ];
        }

        return $columns; 
    }

    public function getColumnsAttributes($columnObject)
    {
        $attributes = $columnObject->toArray();

        $attributes['type'] = $attributes['type']->getName();

        return $attributes;
    }


    /** constraints */

    public function getPrimaryKey($tableObject)
    {
        $indexes = $this->schemaManager->listTableIndexes($tableObject->getName());

        return  (isset($indexes['primary'])) ? 
                $indexes['primary']->getColumns()[0] : 
                [];
    }

    public function getForeignKeys($tableObject)
    {
        $fkObjects = $tableObject->getForeignKeys();

        $foreignKeys = [];
       
        if(count($fkObjects) > 0)
        {
            foreach ($fkObjects as $fkObject) 
            {
                $foreignName   = $fkObject->getName();
                $localColumn   = $fkObject->getLocalColumns()[0];
                $localTable    = $this->getTableName($fkObject->getLocalTableName());
                $foreignColumn = $fkObject->getForeignColumns()[0];
                $foreignTable  = $this->getTableName($fkObject->getForeignTableName());

                $localTable    = [ 
                    'name'         => $localTable,
                    'className'    => Str::studly($localTable),
                    'instanceName' => Str::camel($localTable),
                ];

                $localColumn    = [ 
                    'name'         => $localColumn,
                    'labelName'    => $this->labelName($localColumn),
                ];

                $foreignTable  = [ 
                    'name'         => $foreignTable,
                    'className'    => Str::studly($foreignTable),
                    'instanceName' => Str::camel($foreignTable),
                ];

                $foreignColumn    = [ 
                    'name'         => $foreignColumn,
                    'labelName'    => $this->labelName($foreignColumn),
                ];

                $foreignKeys[$foreignName] = [
                    'localTable'    => $localTable,
                    'localColumn'   => $localColumn,
                    'foreignTable'  => $foreignTable,
                    'foreignColumn' => $foreignColumn,
                ];
            }
        }
        return  $foreignKeys;
    }

    //global data

    private function setSchemaManager($connection)
    {
        try {
            $this->schemaManager = $connection->getDoctrineSchemaManager();
        } catch (\PDOException $exception) {
            
            exit( $exception->getMessage( ));
        }
        
    }

    public function getDatabases()
    {
        return $this->schemaManager->listDatabases();
    }

    public function getSchemas()
    {
        $plataform = $this->getPlataform();

        $schemas = ['error database options'. $plataform];

        switch ($plataform) {
            case 'postgre':
                $schemas = $this->schemaManager->getSchemaNames();
                break;
            case 'mysql':
                $schemas = ['mysql'];
                break;
        }
        return $schemas;
    }

    public function getPlataform()
    {
        $plataform = explode("\\", get_class($this->schemaManager->getDatabasePlatform()));

        $plataform = array_pop($plataform);

        $postgreSql = [ 'PostgreSqlPlatform','PostgreSQL91Platform','PostgreSQL92Platform','PostgreSQL94Platform' ];

        $Mysql = [ 'MySqlPlatform', 'MySQL57Platform', 'MySQL80Platform', 'MariaDb1027Platform'];

        switch (true) {
            case in_array($plataform, $postgreSql):
                $plataform = 'postgre';
                break;
            case in_array($plataform, $Mysql):
                $plataform = 'mysql';
                break;
            default:
                break;
        }

        return $plataform;
    }

    public function setSchema($schema)
    {
        return $this->schema = $schema;
    }

    //array to object
    static public function arrayToObject(array $array)
    {
        foreach($array as $key => $value)
        {
            if(is_array($value))
            {
                $array[$key] = self::arrayToObject($value);
            }
        }
        return (object)$array;
    }

    protected function labelName($columnName)
    {
        $fieldName =  str_replace($this->getPrefix($columnName) . '_', null, $columnName);
       
        return ucwords(str_replace('_', ' ', $fieldName));
    }

    public function getPrefix($columnName)
    {
        return substr($columnName, 0, 2);
    }
}