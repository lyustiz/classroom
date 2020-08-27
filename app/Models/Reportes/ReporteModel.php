<?php

namespace App\Models\Reportes;

use Illuminate\Database\Eloquent\Model;

class ReporteModel extends Model
{
    private $schema = 'classroom';
    private $query  =  null;
    
    function getReporte( 	$tabla 		, 
                            $campos     ,
                            $where 		= [], 
                            $between 	= [], 
                            $order_by 	= [], 
                            $group_by	= []
						   )
	{
                
        $this->query = \DB::table($tabla)->distinct();
        
        foreach ($campos as $key => $campo) {

            $this->query->addSelect($campo)->get();

        }

		foreach($where as $campo => $valores)
		{
			if( is_array($valores) )
			{
                $this->query->whereIn($campo, $valores);

			}else{
				
                $this->query->where($campo, $valores);

			}
		}	
        
		foreach($between as $campo => $valores)
		{
			if( ( $valores['from'] != '' ) and ( $valores['to'] != '' ) )
			{
               
               // $this->db->where("TO_DATE(".$campo.", 'DD/MM/YYYY') BETWEEN '".$valores['desde']."' AND '".$valores['hasta']."'");
                
                $this->query->whereBetween("TO_DATE($campo, 'DD/MM/YYYY')", [ $valores['desde'], $valores['hasta'] ]);
                

			}else if(($valores['from']!='') and ($valores['to']=='' )){
				
				$this->query->where("TO_DATE($campo, 'DD/MM/YYYY')",  $valores['desde']);
				
			}
		}			

		foreach($order_by as $campo => $tipo)
		{
            $this->query->orderBy($campo, $tipo);
		}
		
		if( count($group_by) > 0 )	
		{
            $this->query->groupBy($group_by);
		}
		
		try {
            
            $result = $this->query->get()->toArray();

		} catch (Exception $e) {
			
			$result = [ "error en la consulta",  $e->getMessage() ];
		}
		
		return $result;
		
	}
}