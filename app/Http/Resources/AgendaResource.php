<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AgendaResource extends JsonResource
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
            'type'        => $this->agendaActividad->nb_agenda_actividad,
            'typeId'      => $this->id_agenda_actividad,
            'icon'        => $this->agendaActividad->tx_icono,
            'description' => $this->tx_observaciones
        ];
    }
}

/**
 * 
 * 
 * 








 * 
 * 
 * 
 */