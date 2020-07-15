<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

            <v-col cols="12" md="6">
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                ></v-text-field>
            </v-col>

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
						<td class="text-xs-left">{{ item.nb_usuario }}</td>
                        <td class="text-xs-left">{{ item.tx_correo }}</td>

                        <td class="text-xs-left">
                              <v-tooltip bottom :key="perfil.id" v-for="perfil in item.perfil">
                                <template v-slot:activator="{ on }">
                                    <v-btn fab x-small v-on="on" color="success" class="elevation-5 mr-1">
                                        <v-icon size="22" v-text="perfil.tx_icono"></v-icon>
                                    </v-btn>
                                </template>
                                <span v-text="perfil.nb_perfil"></span>
                            </v-tooltip>
                        </td>

						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item"
                                :resource="resource"
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
                            </status-switch>
                        </td>
                        
                        <td class="text-xs-left">
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
                <usuario-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></usuario-form>

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
import usuarioForm  from './usuarioForm';
export default {
    mixins:     [ listHelper],
    components: { 'usuario-form': usuarioForm },
    data () {
    return {
        title:    'Usuario',
        resource: 'usuario',
        headers: [
			{ text: 'Usuario',   value: 'nb_usuario' },
            { text: 'Email',   value: 'tx_email' },
            { text: 'Perfil',   value: 'perfil' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {
   
    }
}
</script>

<style>
</style>