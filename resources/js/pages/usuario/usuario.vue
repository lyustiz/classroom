<template>

    <list-container :titulo="titulo" :head-color="$App.theme.headList">

        <template slot="HeadTools">
            <add-button @insItem="insItem()"></add-button>
        </template>

            <v-flex xs12 xs6>
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                ></v-text-field>
            </v-flex>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                v-model ="selected"
                item-key="id"
                :loading="isLoading"
                sort-by=""
            >

                <template slot="items" slot-scope="item">

                    <td class="text-xs-left">{{ item.item.id }}</td>
					<td class="text-xs-left">{{ item.item.nb_nombres }}</td>
					<td class="text-xs-left">{{ item.item.nb_usuario }}</td>
					<td class="text-xs-left">{{ item.item.password }}</td>
					<td class="text-xs-left">{{ item.item.tx_email }}</td>
					<td class="text-xs-left">{{ item.item.tx_foto }}</td>
					<td class="text-xs-left">{{ item.item.id_tipo_usuario }}</td>
					<td class="text-xs-left">{{ item.item.tx_observaciones }}</td>
					<td class="text-xs-left">{{ item.item.verification }}</td>
					<td class="text-xs-left">{{ item.item.email_verified_at }}</td>
					<td class="text-xs-left">{{ item.item.remember_token }}</td>
					<td class="text-xs-left">{{ item.item.api_token }}</td>
					<td class="text-xs-left">{{ item.item.id_status }}</td>
					<td class="text-xs-left">{{ item.item.id_usuario }}</td>
					<td class="text-xs-left">{{ item.item.created_at }}</td>
					<td class="text-xs-left">{{ item.item.updated_at }}</td>
                    
                
                    <td class="text-xs-center">
                        <list-buttons @editar="updItem(item.item)" @eliminar="delForm(item.item)" ></list-buttons>
                    </td>

                </template>

            </v-data-table>

            <app-modal
                :nb-action="nbAction"
                :modal="modal"
                @modalClose="modalClose()"
                :head-color="$App.theme.headModal"
            >
                <usuario-form
                    :accion="accion"
                    :item="item"
                    :titulo="titulo"
                    @modalClose="modalClose()"
                ></usuario-form>

            </app-modal>

            <app-dialogo
                :dialog="dialog"
                mensaje="Desea eliminar el Item Seleccionado?"
                @delItem="delItem()"
                @delCancel="delCancel()"
            ></app-dialogo>

            <app-mensaje></app-mensaje>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '~/mixins/Applist';
import usuarioForm  from './usuarioForm';
export default {
    mixins:     [ listHelper],
    components: { 'usuario-form': usuarioForm },
    data () {
    return {
        titulo: 'Usuario',
        headers: [
            { text: 'Id',   value: 'id' },
			{ text: 'Nombres',   value: 'nb_nombres' },
			{ text: 'Usuario',   value: 'nb_usuario' },
			{ text: 'Password',   value: 'password' },
			{ text: 'Email',   value: 'tx_email' },
			{ text: 'Foto',   value: 'tx_foto' },
			{ text: 'Tipo Usuario',   value: 'id_tipo_usuario' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Verification',   value: 'verification' },
			{ text: 'Email Verified At',   value: 'email_verified_at' },
			{ text: 'Remember Token',   value: 'remember_token' },
			{ text: 'Api Token',   value: 'api_token' },
			{ text: 'Status',   value: 'id_status' },
			{ text: 'Usuario',   value: 'id_usuario' },
			{ text: 'Created At',   value: 'created_at' },
			{ text: 'Updated At',   value: 'updated_at' },
            { text: 'Acciones', value: 'id'  },
        ],
    }
    },
    methods:
    {
        list () {

            this.isLoading = false
            
            axios.get(this.apiUrl  +'usuario')
            .then(response => {
                this.items = response.data;
                this.isLoading = false
            })
            .catch(error => {
                this.showError(error)
                this.isLoading = false
            })
        },
        delItem()
        {
            axios.delete(this.apiUrl    + 'usuario/'+this.item.id)
            .then(response => {
                this.verMsj(response.data.msj)
                this.list();
                this.item = '';
                this.dialogo = false;
            })
            .catch(error => {
                this.showError(error)
            })
        }
    }
}
</script>

<style>
</style>