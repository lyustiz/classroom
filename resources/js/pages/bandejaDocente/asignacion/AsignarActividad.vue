<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

            <v-container class="deep-purple white--text py-0">
            <v-row no-gutters>
                <v-col>

                    <v-row align="center">
                    
                        <v-col>
                            <v-row no-gutters>
                                <v-col class="text-center text-uppercase"> {{`${this.months[dia.month-1]} ${dia.year}`}}</v-col>
                            </v-row>
                            <v-row no-gutters>
                                <v-col class="text-center display-3 font-weight-light"> {{dia.day.toString().padStart(2,"00")}}</v-col>
                            </v-row>
                        </v-col>

                    </v-row>
                    
                </v-col>

                <v-col>
                    <v-row align="center">
                        <v-col class="text-center text-uppercase">{{tipo.nb_tipo_asignacion}}</v-col>
                    </v-row>
                    <v-row no-gutters  align="center">
                        <v-col class="text-center">
                            <v-icon size="48" :color="tipo.tx_color" v-text="tipo.tx_icono"></v-icon>
                        </v-col>
                    </v-row>
                </v-col>

                <v-col cols="auto" class="mt-2">
                   <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>

            </v-row>
            </v-container>
            
        <v-card-text>

        <v-row>
                 
        <v-col cols="12">
             <v-select
                :items="materias"
                item-text="nb_materia"
                item-value="id"
                v-model="form.id_materia"
                :rules="[rules.select]"
                label="Materia"
                :loading="loading"
                dense
                @change="getTemas($event)"
                hide-details=""
            ></v-select>
        </v-col>

        <v-col cols="12">
             <v-select
                :items="temas"
                item-text="nb_tema"
                item-value="id"
                v-model="form.id_tema"
                :rules="[rules.select]"
                label="Tema"
                :loading="loading"
                :disabled="temas.length < 1"
                dense
                hide-details=""
                @change="getItems()"
            ></v-select>
        </v-col>

        <v-col class="mx-2 pa-2 rounded-lg grey lighten-4 ">
            <div>
                <v-btn fab x-small color="success ml-2" v-show="addBtn && tipo.nb_tipo_asignacion != 'actividad'" @click="addItems()"><v-icon>mdi-plus</v-icon></v-btn>
            </div>
            <v-list dense class="selector-container rounded-lg pa-0">
                <v-list-item-group v-model="form.id_origen" color="deep-purple" class="rounded-lg" multiple>
                    <v-list-item v-for="(item, i) in items" :key="i" :value="item.id" >
                        <template v-slot:default="{ active }" >
                        <v-list-item-avatar color="white">
                            <v-icon :color="tipo.tx_color" v-text="tipo.tx_icono"></v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{item.name}}</v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-checkbox :input-value="active" :disabled="loading" color="deep-purple"></v-checkbox>
                        </v-list-item-action>
                        </template>
                    </v-list-item>
                </v-list-item-group>
            </v-list>
        </v-col>
                          
        </v-row>

        <v-row no-gutters class="mt-1">
            <v-btn color="success" block @click="store()">Asignar</v-btn>
        </v-row>

        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>


    </v-card>

    <v-dialog v-model="dialogEnlace" max-width="500px" content-class="rounded-xl" >
        <enlace-form v-if="dialogEnlace" :tipoEnlace="tipoEnlace" :tipo="tipo" :tema="form.id_tema" @closeDialog="closeDialog('dialogEnlace', $event)" ></enlace-form>
    </v-dialog>

    <v-dialog v-model="dialogRecurso" max-width="500px" content-class="rounded-xl" >
        <recurso-form v-if="dialogRecurso" :tipoRecurso="tipoRecurso" :tipo="tipo" :tema="form.id_tema" :grado="grupo.id_grado" @closeDialog="closeDialog('dialogRecurso', $event)" ></recurso-form>
    </v-dialog>
    
    </v-form>

</template>

<script>

import DataHelper   from '@mixins/AppData';
import EnlaceForm   from '@pages/enlace/AppEnlaceForm.vue'
import RecursoForm  from '@pages/recurso/AppRecurso.vue'


export default {

    components: {
        'enlace-form':   EnlaceForm,
        'recurso-form':  RecursoForm,
    },

    mixins:     [ DataHelper ],

    props: {

        grupo: {
            type: Object,
            default: () => {}
        },

        dia: {
            type: Object,
            default: () => {}
        },

        tipoAsignaciones:{
            type: Array,
            default: []
        },

        tipo:{
            type: Object,
            default: null
        }
    },
    
    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    created()
    {
      console.log(this.grupo);
      
       this.form.id_grupo           = this.grupo.id
       this.form.id_tipo_asignacion = this.tipo.id
       this.form.tx_origen          = this.tipo.tx_origen
       this.form.fe_inicio          = this.dia.date
       this.form.fe_fin             = this.dia.date
       this.form.id_status          = 1

        if(this.tipo.tx_origen == 'enlace'){
            this.tipoEnlace  = (this.tipo.nb_tipo_asignacion == 'web') ? 1 : 2
        }

        if(this.tipo.tx_origen == 'recurso'){
            this.tipoRecurso = (this.tipo.nb_tipo_asignacion == 'audio') ? 1 : 3
        }

       this.resource  = this.getResourcePath()
       this.list()
    },

    data() {
        return {
            materias: [],
            temas:    [],
            form:{
                id: null,
                id_grupo: 	        null,
				id_tipo_asignacion: null,
				id_materia: 	    null,
				id_tema: 	        null,
				id_origen: 	        [],
				tx_origen: 	        null,
				fe_inicio: 	        null,
				fe_fin: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
				id_usuario: 	    null,
            },
            items:      [],
            resource:   null,
            addBtn:     false,
            dataItems: {
                actividad: { name: 'nb_actividad', url: 'id',     description: 'tx_descripcion' } ,
                video:     { name: 'nb_enlace',    url: 'tx_url', description: 'tx_descripcion' } ,
                audio:     { name: 'nb_recurso',   url: 'tx_url', description: 'tx_descripcion' } ,
                enlace:    { name: 'nb_enlace',    url: 'tx_url', description: 'tx_descripcion' } ,
                lectura:   { name: 'nb_libro',     url: 'tx_url', description: 'tx_descripcion' } ,
            },
            //add
            tipoEnlace:    null,
            tipoRecurso:   null,
            dialogRecurso: false,
            dialogEnlace:  false
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `materia/grupo/${this.grupo.id}/docente/${this.docente.id}` ).then( data =>  this.materias = data)
        },

        getTemas(materia)
        {
            this.temas        = []
            this.actividades  = []
            this.form.id_tema =  null
            this.addBtn       = false
            this.getResource( `tema/grado/${this.grupo.grado.id}/materia/${materia}` ).then( data =>  this.temas = data)
        },

        getItems()
        {
            this.items = []
            this.getResource( `${this.resource}/tema/${this.form.id_tema}` ).then( data => {
                if(data.length > 0) {
                    this.getDataCols(data)
                }
                this.addBtn  = true
            })
        },

        store()
        {
            if(this.form.id_origen.length < 1) {
                this.showError('Favor Seleccionar ' + this.tipo.nb_tipo_asignacion )
                return
            }
            
            this.storeResource('asignacion', this.form).then( data => {
                this.showMessage(data.msj)
                this.$emit('closeDialog', true)
            })
            
        },

        getResourcePath()
        {
            if(this.tipo.tx_origen == 'enlace'){
                return `${this.tipo.tx_origen}/tipoEnlace/${this.tipoEnlace}`
            }

            if(this.tipo.tx_origen == 'recurso'){
                return `${this.tipo.tx_origen}/tipoRecurso/${this.tipoRecurso}`
            }

            return this.tipo.tx_origen
        },

        getDataCols(data)
        {
            let cols = this.dataItems[this.tipo.nb_tipo_asignacion]
            for (const item of data) 
            {
                if(this.tipo.tx_origen == 'recurso'){
                    let fullurl = `${item.archivo.tipo_archivo.tx_base_path}/${item.id}/${item.archivo.nb_real}`
                    this.items.push( { id: item.id, name: item.archivo.nb_archivo, url: fullurl, description: this.tipo.nb_tipo_asignacion })
                } else{
                    this.items.push( { id: item.id, name: item[cols.name], url: item[cols.url], description: item[cols.description] })
                }
            }
        },

        addItems()
        {
            if(this.tipo.tx_origen == 'recurso')
            {
                this.dialogRecurso = true
            }

            if(this.tipo.tx_origen == 'enlace')
            {
                this.dialogEnlace = true
            }
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            if(refresh){
                this.getItems()
            }
        }

    }
}
    

</script>

<style scoped>
.selector-container{
    height: 140px;
    overflow-y: auto;
}
</style>