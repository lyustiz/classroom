<template>
<div>
    
    <!-- btn nuevo -->
    <v-btn 
        :color="$App.theme.button.new" 
        :loading="loading"
        @click="insertForm()">
        Crear Banco<v-icon right>add</v-icon>
    </v-btn>

    <!-- Filtro Busqueda -->
    <v-flex xs12 xs6 mb-2>
        <v-text-field
            v-model="search"
            label="Buscar"
            single-line
            hide-details
            clearable
        ></v-text-field>
    </v-flex>

    <!-- Lista del Recurso -->
    <v-data-table
        :loading="loading"
        :search ="search"
        :headers="headers"
        :items  ="items"
        item-key="id_banco">

        <!-- Acciones -->
        <template v-slot:item.action="{ item }">
            <list-buttons
                @update="updateForm(item)"  
                @delete="deleteForm(item)">
            </list-buttons>
        </template>

    </v-data-table>
    
    <!-- Formulario Insert/Update-->
    <app-modal :modal="modal" @closeModal="closeModal()">    

        <banco-form 
            @closeModal="closeModal()"
            :action="action"
            :item="item"
        ></banco-form>

    </app-modal>

    <!-- Formulario Delete -->
    <form-delete
        :dialog="dialog"
        :message="`Desea eliminar el Banco ${item.nb_banco}`"
        @confirm="deleteConfirm()"
        @cancel="deleteCancel()" >
    </form-delete>

</div>

</template>

<script>
    import BancoForm from './BancoForm'
    import listMixin from '~/mixins/Applist' 

    export default {
        mixins:[ listMixin ],
        components:{ 'banco-form': BancoForm },
        data(){
            return {
                resource: 'banco',
                headers:[
                    { text: 'Nombre',           value: 'nb_banco'},
                    { text: 'Nombre Comercial', value: 'nb_comercial'},
                    { text: 'Código' ,          value: 'co_banco'},
                    { text: 'Siglas' ,          value: 'tx_siglas'},
                    { text: 'Tipo Banco',       value: 'id_tipo_banco'},
                    { text: 'Grupo' ,           value: 'tx_grupo' },
                    { text: 'Acción',           value: 'action'}
                ],
            }
        }
    }
</script>

<style>

</style>
