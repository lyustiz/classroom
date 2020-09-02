<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" height="80vh" flat >

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Permisos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0" >
            <v-col class="grey lighten-3 subtitle-2">
                <v-icon class="mr-2" color="orange">mdi-account-settings</v-icon>{{perfil.nb_perfil}}
            </v-col>
        </v-card-title>

        <v-card-text>

        <v-row dense>

        <v-col cols="12">
            <v-select
            :items="selects.menu"
            item-text="nb_menu"
            item-value="id"
            v-model="form.id_menu"
            :rules="[rules.select]"
            label="Menu"
            :loading="loading"
            dense
            filled
            ></v-select>
        </v-col>

        <v-col cols="12">

            <v-list subheader two-line dense width="100%" color="grey lighten-4" class="rounded-xl"> 
                    
                <v-subheader class="grey pl-4 lighten-3 rounded-t-xl">
                    Permisos asignados
                </v-subheader>
                
                <v-list-item v-for="permiso in permisos" :key="permiso.id" >

                    <v-list-item-avatar>
                        <v-icon color="indigo" size="42" v-text="permiso.menu.tx_icono"></v-icon>
                    </v-list-item-avatar> 
                
                    <v-list-item-content>
                        <v-list-item-title class="indigo--text" v-text="permiso.menu.nb_menu"></v-list-item-title>
                        <v-row no-gutters> 
                            
                            <v-tooltip top color="indigo">
                                <template v-slot:activator="{ on }">
                                    <div v-on="on">
                                     <v-switch class="mr-2" color="success" :input-value="permiso.bo_select" :false-value="0" :true-value="1" prepend-icon="mdi-database-search" hide-details></v-switch>
                                    </div>
                                </template>
                                <span>Consultar</span>
                            </v-tooltip>

                            <v-tooltip top color="indigo">
                                <template v-slot:activator="{ on }">
                                    <div v-on="on">
                                     <v-switch class="mr-2" color="success" :input-value="permiso.bo_insert" :false-value="0" :true-value="1" prepend-icon="mdi-database-plus" hide-details></v-switch>
                                    </div>
                                </template>
                                <span>Agregar</span>
                            </v-tooltip>

                            <v-tooltip top color="indigo">
                                <template v-slot:activator="{ on }">
                                    <div v-on="on">
                                     <v-switch  class="mr-2" color="success" :input-value="permiso.bo_update" :false-value="0" :true-value="1" prepend-icon="mdi-database-edit" hide-details></v-switch>
                                    </div>
                                </template>
                                <span>Editar</span>
                            </v-tooltip>

                            <v-tooltip top color="indigo">
                                <template v-slot:activator="{ on }">
                                    <div v-on="on">
                                     <v-switch class="mr-2" color="success" :input-value="permiso.bo_delete" :false-value="0" :true-value="1" prepend-icon="mdi-database-remove" hide-details></v-switch>
                                    </div>
                                </template>
                                <span>Eliminar</span>
                            </v-tooltip>

                            <v-tooltip top color="indigo">
                                <template v-slot:activator="{ on }">
                                    <div v-on="on">
                                     <v-switch class="mr-2" color="success" :input-value="permiso.bo_admin" :false-value="0" :true-value="1" prepend-icon="mdi-shield-account" hide-details></v-switch>
                                    </div>
                                </template>
                                <span>Administrador</span>
                            </v-tooltip>
                            
                    
                        </v-row>
                    </v-list-item-content>

             <!-- TODO/ implement insert and update permiso  avoid reload and modal fail-->
                    <v-list-item-action>
                        <app-button color="red" icon="mdi-delete" label="Eliminar Permiso" class="my-1"></app-button>
                    </v-list-item-action>

                </v-list-item>

                </v-list>

        </v-col>
<!-- 
        <v-col cols="12" md="6">
            <v-select
            :items="selects.menu"
            item-text="nb_menu"
            item-value="id"
            v-model="form.id_menu"
            :rules="[rules.select]"
            label="Menu"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_select"
            label="Select"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_select== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_insert"
            label="Insert"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_insert== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_update"
            label="Update"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_update== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_delete"
            label="Delete"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_delete== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_admin"
            label="Admin"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_admin== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox>

        <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_default"
            label="Default"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_default== null)"
            dense
            class="col-auto d-none ml-3"
        ></v-checkbox>   
         
 -->
        </v-row>

        </v-card-text>

       <!--  <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                action="upd"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>
 -->
        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/AppData';

export default {
    mixins: [Appform],

    props:
    {
        perfil:{
            type: Object,
            default: () => {}
        }
    },

    created()
    {
        this.form.id_perfil = this.perfil.id
        this.list()
    },

    watch:
    {
        perfil(val)
        {
            this.form.id_perfil = this.perfil.id
            this.list()
        }
    },

    data() {
        return {
            resource: 'permiso',
            form:
            {
                id: 	          null,
				id_menu: 	      null,
				id_perfil: 	      null,
				bo_select: 	      null,
				bo_insert: 	      null,
				bo_update: 	      null,
				bo_delete: 	      null,
				bo_admin: 	      null,
				bo_default: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },

            selects:
            {
	 	 	 	menu:  [],
            },

            defaultForm:
            {
                bo_select:  0,
                bo_insert:  0,
                bo_update:  0,
                bo_delete:  0,
                bo_admin:   0,
                bo_default: 0,
            },

            permisos: [],

            permiso:  []
        }
    },

    methods:
    {
        list()
        {
            this.getResource(`permiso/perfil/${this.perfil.id}/asignacion`).then( data =>{
                this.selects.menu = data.menus
                this.permisos     = data.permisos
            })
        }
    }
}
</script>

<style scoped>
    .v-input--selection-controls
    {
        margin-top: 0px !important;
    }
</style>