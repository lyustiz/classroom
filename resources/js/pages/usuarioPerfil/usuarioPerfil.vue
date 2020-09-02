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
                        <td class="text-xs-left">{{ item.usuario.nb_usuario }}</td>
                        <td class="text-xs-left">{{ item.usuario.nb_nombres }}</td>
                        <td class="text-xs-left">
                              <list-simple-icon :label="item.perfil.nb_perfil" color="success" :icon="item.perfil.tx_icono"></list-simple-icon>
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
                <usuario-perfil-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></usuario-perfil-form>

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
import usuarioPerfilForm  from './usuarioPerfilForm';
export default {
    mixins:     [ listHelper],
    components: { 'usuario-perfil-form': usuarioPerfilForm },
    data () {
    return {
        title:    'Usuario Perfil',
        resource: 'usuarioPerfil',
        headers: [
            { text: 'Usuario',       value: 'usuario.nb_usuario' },
            { text: 'Nombre',        value: 'usuario.nb_nombres' },
            { text: 'Perfil',        value: 'perfil.nb_perfil' },
			{ text: 'Status',        value: 'id_status' },
            { text: 'Acciones',      value: 'actions', sortable: false, filterable: false },
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