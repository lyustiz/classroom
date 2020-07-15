<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat class="rounded-xl">

        <v-card-text>

        <v-row no-gutters>

        <v-col cols="12" md="12">
           <v-autocomplete
                v-model="form.id_grupo"
                :items="selects.grupo"
                item-text="nb_grupo"
                item-value="id"
                outlined
                label="Grupos"
                :disabled="loading"
                :loading="loading"
                autofocus
                dense
                return-object
                @change="addGrupo($event)">
          </v-autocomplete>
        </v-col>

        <v-col>

        <v-list subheader>
        <v-subheader>Grupos</v-subheader>

            <v-list-item
                v-for="grupo in grupos"
                :key="grupo.id"
            >
                <v-list-item-avatar>
                    <v-avatar color="purple white--text" >{{ grupo.nb_grupo | initLeter }}</v-avatar>
                </v-list-item-avatar>

                <v-list-item-content>
                <v-list-item-title v-text="grupo.nb_grupo"></v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                    <v-btn small class="grey lighten-4" icon @click="deleteGrupo(grupo)">
                        <v-icon color="red">mdi-delete</v-icon>
                    </v-btn>
                </v-list-item-action>
            </v-list-item>

        </v-list>

        </v-col>
          
        </v-row>

        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import AppData from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';

export default {
    mixins: [ AppData, AppSelect ],
    props:
    {
        alumno: {
            type:       Object,
            default:    null
        },
    },
    created()
    {
        this.list();
        this.default.id_alumno = this.alumno.id_alumno
    },
    data() {
        return {
            resource: 'docenteGrupo',
            grupos: [],
            form:
            {
                id: 	          null,
				id_grupo: 	      null,
				id_alumno: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	grupo: 	 [],
            },
            default: 
            {
                id_status: 1,
                id_alumno: null
            }
        }
    },

    methods:
    {
        list()
        {
            this.grupos = []
            let resource  = 'grado/asignacion/' + this.idDocente
            this.getResource( resource ).then( data =>  
            {
                this.grupos = data.docenteGrupo
                this.selects.grupo = data.grupo
            })
        },

        addGrupo(grupo)
        {
            this.form.id_grupo = grupo.id

            this.storeResource(this.resource, this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                
                this.selects.grupo = this.selects.grupo.filter( (grupos) => grupos.id != grupo.id)

                this.grupos.push({ 
                    id: data.docenteGrupo.id , 
                    id_grupo: data.docenteGrupo.id_grupo,
                    nb_grupo: data.docenteGrupo.grupo.nb_grupo 
                })

                this.form.id_grupo = null;
            })
        },

        deleteGrupo(item)
        {
            let resourceId  = 'docenteGrupo/' + item.id
            this.deleteResource(resourceId).then( (data) =>  
            {
                this.showMessage(data.msj)

                this.grupos = this.grupos.filter( (grupo) => grupo.id != item.id)

                this.selects.grupo.push({ 
                    id: item.id_grupo , 
                    nb_grupo: item.nb_grupo
                })
            })
        }

    }
}
</script>

<style>
</style>