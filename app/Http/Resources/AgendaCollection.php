<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class AgendaCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'data'        => $this->collection,
            'id'          => $this->id,
            'name'        => $this->nb_agenda,
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
    }
}
