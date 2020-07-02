<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EvaluacionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'          => $this->id,
            'name'        => $this->nb_agenda,
            'date'        => $this->fe_agenda,
            'start'       => $this->fe_inicio,
            'end'         => $this->fe_fin,
            'startHour'   => $this->hh_inicio,
            'endHour'     => $this->hh_fin,
            'color'       => $this->tipoAgenda->tx_color,
            'category'    => $this->tipoAgenda->nb_tipo_agenda,
            'categoryId'  => $this->id_tipo_agenda,
            'type'        => $this->tipoActividad->nb_tipo_actividad,
            'typeId'      => $this->id_tipo_actividad,
            'icon'        => $this->tipoActividad->tx_icono,
            'description' => $this->tx_observaciones
        ];

       /*  
        id": 10,
        "id_plan_evaluacion": 2,
        "id_tipo_evaluacion": 1,
        "nu_peso": 10,
        "fe_evaluacion": "2020-05-27",
        "tx_tema": "Historia de Colombia",
        "tx_observaciones": null,
        "id_status": 1,
        "id_usuario": 1,
        "evaluacion": [
            "id": 1,
            "id_plan_detalle": 21,
            "fe_evaluacion": "2020-06-29",
            "hh_inicio": "15:00:19",
            "hh_fin": "19:00:22",
            "nu_peso": 10,
            "tx_observaciones": null,
            "id_status": 1,
            "id_usuario": 1
        ],
        "tipo_evaluacion": {
                            "id": 1,
                            "nb_tipo_evaluacion": "Prueba Corta"
                            } 
        */





    }
}
