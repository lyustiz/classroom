<?php

namespace App\Http\Controllers\CrudGenerate;

use Illuminate\Support\Str;

class Connection
{
    protected $connectionName;

    protected $schemaName;
    
    protected $connection;


    public function connect($schemaName = 'classroom', $database = null)
    {
        $this->schema = $schemaName;

        return $this->setConnection($database);
    }

    public function setConnection($connectionName)
    {
        return $this->connection = \DB::connection($connectionName);

    }

    public function getSchema()
    {
         
        return $this->schemaName;
    }

    public function setSchema($schemaName)
    {
        $this->schemaName = $schemaName;
    }

}
