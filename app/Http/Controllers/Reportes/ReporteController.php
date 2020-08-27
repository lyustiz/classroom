<?php

namespace App\Http\Controllers\Reportes;
use App\Models\Reportes\ReporteModel;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Reportes\Connection;
use App\Http\Controllers\Reportes\MetaData;
use App\Http\Controllers\Reportes\ExcelReportClass;

class ReporteController extends Controller
{
    private $connector;
    
    private $connection;

    private $schema;

    private $meta;

    private $tableName;

    private  $delId        = [];

    private  $addId        = [];

    protected $dataReport = null;

        
    public function __construct(Connection $conection, ReporteModel $reporteModel)
    {
        $this->connector  = $conection;
        
        $this->connection = $this->connector->connect('classroom');

        $this->meta       = new MetaData($this->connection);

        $this->dataReport = $reporteModel;
    }

    public function generate(Request $request)
    {
        $validate = request()->validate([
            'tableName'     => 	'required|string|max:40',
            'addFields'     => 	'nullable|array',
            'delFields'     => 	'nullable|array',
            'catsFiels'     => 	'nullable|array',
        ]);
        
        $this->tableName = $request->tableName;

        return $this->generateReport();
    }

    public function execute(Request $request)
	{
        $validate = request()->validate
        ([
            'campos'        	=> 'required|array',
		],
		[
			'campos.required'   => 'Seleccione al menos un campo del reporte'
		]);
		
		return $this->executeReport($request->all()); 
	}

	public function executeExcel(Request $request)
	{
        $validate = request()->validate
        ([
            'campos'        	=> 'required|array',
		],
		[
			'campos.required'   => 'Seleccione al menos un campo del reporte'
		]);
		
		return $this->executeReportExcel($request->all()); 
	}



    public function columnMetaData()
    {
        return $this->meta->columnMetaData($this->tableName);
    }

    public function generateReport()
    {
		$this->dataReport->schema = $this->schema;
		
        $data = $this->setFormInputs();
        
        return $data;
    }
    
    public function setFormInputs()
    {
        $fieldsData  = $this->getFieldData();

        $formInputs = [
                        'fields'  => $fieldsData['fields'],
                        'table'   => $this->tableName,
                        'filters' => $this->getTableFilters($fieldsData['filters']),
                        'dateset' => $fieldsData['dateset'],
                      ];

        return $formInputs;
	}

	public function getFieldData()
	{
		$columnMetaData	 = $this->columnMetaData();

		$addId   = $this->addId;
		
		$delId   = $this->delId;
				
		$fields  = [];
		
		$filters = [];
		
		$dateSet = [];
		
		foreach($columnMetaData as $columName =>  $column)
		{
			switch(true) {   
			
				case ( $column->prefix != 'id' ) or ( in_array($columName, $addId) ):   //nombre campo
					
					if($column->prefix != 'fe')
					{ 
						$fields []  = ['name' => $column->label, 'value' => "$columName|$column->label"];
					} 
					else
					{
                        $fields []  = ['name' => $column->label, 'value' => "$columName|$column->label"];
                        
						$dateSet[]  = ['name' => $column->label, 'value' => "$columName|$column->label"];
					}
					  
					break;

				case ( $column->prefix == 'id' ) and ( !in_array($columName, $delId) ): //filters(id)
					
					$filters[] = ['label' => $column->label, 'value' => $columName];           	
					
					break;

				break;
			}; 
		}
		
		return  [
                    'fields'   => $fields,
					'filters'  => $filters,
                    'dateset'  => $dateSet
                ];
	}
	
	public function getTableFilters($filters)
	{
		foreach($filters as $filter )
		{
			$filterId  = $filter['value'];
									
			$fieldId   = $filterId;
			
			$field     = str_replace( 'id_' , 'nb_', $filterId );  
						
            $fields    = [ $fieldId,  $field ]; 
			
            $data      = $this->dataReport->getReporte($this->tableName, $fields);

            $items 	   = [];
            
			if( count($data) > 0)
			{
				foreach( $data as $row)
				{
                    $row = (array) $row;

                    if( (array) $row[$field] != "" )
					{
						$items[] = ['name' => $row[$field], 'value' => $row[$fieldId] ];
					}
				}
				
			}else{
				
				$items[] = ['name' => 'Sin datos', 'value' => '0' ] ;
				
			}
			
			$inputs[] =	array(	
                                'fieldId' 	=> $fieldId,
								'label' 	=> $filter['label'],
								'items' 	=> $items,
							);
        }

		return $inputs;
    }
    
    public function executeReport(Array $request)
	{
		$tabla  	  = $request['tableName'];
		$headers	  = [];
		$campos       = [];
		$filtros   	  = []; 
	 	$between   	  = []; 
		$order_by 	  = []; 
		$group_by 	  = [];
		 
		//check Filtros
		foreach( $request['filtros'] as $filtro )
		{			
			if( count($filtro) < 1 )
			{
				continue;
			}
			
			if(   $filtro[ key( $filtro ) ]  != null)
			{
				$filtros[ key( $filtro) ] = $filtro[ key( $filtro ) ];
			}

		}
		//check Campos
		foreach( $request['campos'] as $data )
		{
			$data = explode( '|', $data);
			$campos []  = $data[0];
			$headers[]  = ['text'=> $data[1], 'value' =>  $data[0] ];
		}

		$data = $this->dataReport->getReporte($tabla, $campos, $filtros, $between, $order_by, $group_by);
		
		return  ['data' => $data, 'headers' => $headers];
		
	}

	public function executeReportExcel(Array $request) 
    {         
        $tabla    = $request['tableName']; 
        $headers  = []; 
        $campos   = []; 
        $filtros  = []; 
        $between  = []; 
        $order_by = []; 
        $group_by = []; 
         
		//check Filtros 
		foreach( $request['filtros'] as $filtro )
		{			
			if( count($filtro) < 1 )
			{
				continue;
			}
			
			if(   $filtro[ key( $filtro ) ]  != null)
			{
				$filtros[ key( $filtro) ] = $filtro[ key( $filtro ) ];
			}

		}

        //check Campos 
        foreach( $request['campos'] as $data ) 
        { 
            $data = explode( '|', $data); 

            $campos []  = $data[0]; 
            $headers[]  = $data[1]; 

        } 
		
		$data = $this->dataReport->getReporte($tabla, $campos, $filtros, $between, $order_by, $group_by); 
		
		$data = json_decode(json_encode($data),true); 
		
		$repoteExcel = new ExcelReportClass($data, $headers); 

		 return \Excel::download($repoteExcel, 'users.xlsx');

        /* if( \Excel::store($repoteExcel, 'reporte.xlsx', 'public') ) 
        { 
            return  Storage::url('reporte.xlsx'); 
        };  */
     
    } 

    public function getArchivo() 
    { 
        $file ='./storage/reporte.xlsx'; 
        return response()->download($file); 

    } 
}