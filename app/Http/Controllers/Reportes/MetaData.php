<?php

namespace App\Http\Controllers\Reportes;

use Illuminate\Support\Str;

class MetaData
{
    public $schemaManager;

    public $tableObjects;
    
    public function __construct($connection)
    {
        $this->setSchemaManager($connection);
    }

    public function columnMetaData(String $tableName)
    {
        $tableObject = $this->schemaManager->listTableDetails($tableName);

        return $this->arrayToObject($this->columnsdata($tableObject));
    }

    public function columnsdata($tableObject)
    {
        return  $this->getColumnArray($tableObject->getColumns());
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
                'label'     => $labelName,
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

    protected function labelName($columnName)
    {
        $fieldName =  str_replace($this->getPrefix($columnName) . '_', null, $columnName);
       
        return ucwords(str_replace('_', ' ', $fieldName));
    }

    public function getPrefix($columnName)
    {
        return substr($columnName, 0, 2);
    }

    //Manager
    private function setSchemaManager($connection)
    {
        try {
            $this->schemaManager = $connection->getDoctrineSchemaManager();
        } catch (\PDOException $exception) {
            
            exit( $exception->getMessage( ));
        }
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
}