<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

            <v-row>

            <v-col cols="12" md="4">
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                ></v-text-field>

            </v-col>

            <v-col cols="12" md="4">
                <v-select
                :items="selects.grado"
                    v-model="grado"
                    item-value="nb_grado"
                    item-text="nb_grado"
                    label="Grado"
                    clearable
                    hide-details
                    dense
                ></v-select>

            </v-col>

            <v-col cols="12" md="4">
                <v-select
                    :items="selects.materia"
                    v-model="materia"
                    item-value="nb_materia"
                    item-text="nb_materia"
                    label="Materia"
                    clearable
                    hide-details
                    dense
                ></v-select>

            </v-col>

            </v-row>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td>{{ item.nu_tema }}</td>
                        <td>{{ item.nb_tema }}</td>
						<td><list-simple-icon icon="mdi-text-box-outline" color="indigo" :label="item.tx_descripcion"></list-simple-icon></td>
						<td>{{ item.grado.nb_grado }}</td>
						<td>{{ item.materia.nb_materia }}</td>
						<td>
                            <status-switch 
                                :loading="loading" 
                                :resource="resource" 
                                :item="item" 
                                @onChangeStatus="changeStatus($event)">
                            </status-switch>
                        </td>
                        
                        <td>
                            <list-buttons 
                                @update="updateForm(item)" 
                                @delete="deleteForm(item)" >
                            </list-buttons>
                        </td>
                    </tr>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <tema-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tema-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>
            
            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import temaForm  from './temaForm';
export default {

    mixins:     [ listHelper],

    components: { 
        'tema-form': temaForm 
    },

    watch:
    {
        items(items)
        {
            if(items.length>0)
            {
                items.forEach( (item) => {
                    this.selects.grado.push(item.grado)
                    this.selects.materia.push(item.materia)
                }, this)
            }
        }
    },

    data () {
        return {
            title:    'Tema',
            grado:   '',
            materia: '',
            resource: 'tema',
            headers: [
                { text: 'Nro',         value: 'nu_tema' },
                { text: 'Tema',        value: 'nb_tema' },
                { text: 'Descripcion', value: 'tx_descripcion' },
                { text: 'Grado',       value: 'grado.nb_grado',     filter: this.filterGrado },
                { text: 'Materia',     value: 'materia.nb_materia', filter: this.filterMateria },
                { text: 'Status',      value: 'id_status' },
                { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
            ],
            selects:{
                grado:   [],
                materia: []
            }
        }
    },

    methods:
    {
        filterGrado(value, search, item )
        {
            if(!this.grado) return true
            
            return value == this.grado
        },

        filterMateria(value, search, item )
        {
            if(!this.materia) return true
            
            return value == this.materia
        }
    }
}
</script>

<style>
</style>