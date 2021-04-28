<template>

    <v-card min-height="80vh" class="rounded-xl">

        <v-card-title class="blue darken-4 white--text">
            Enviar Correo de Bienvenida
        </v-card-title>
        
        <v-card-text>

        <v-row dense>

        <v-col cols="12" md="6">
            <v-select
                :items="grados"
                v-model="grado"
                item-text="nb_grado"
                item-value="id"
                label="Grado"
                class="mb-0"
                :loading="loading"
                :readonly="loading"
                dense
                filled
                rounded
                @change="getGrupos($event)"
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
                :items="grupos"
                v-model="grupo"
                item-text="nb_grupo"
                item-value="id"
                label="Grupo"
                class="mb-0"
                :loading="loading"
                :readonly="loading"
                :disabled="grupos.length<1"
                dense
                filled
                rounded
                @change="getAlumnos($event)"
            ></v-select>
        </v-col>

        </v-row>

        <v-row v-if="alumnos.length > 0">
            <v-col>
                 <v-list subheader dense class="rounded-lg" color="grey lighten-5"> 

                    <v-subheader>
                            <v-col>Alumnos</v-col>
                            <v-col cols="auto">
                                <v-checkbox v-model="selectAll" label="todos"></v-checkbox>
                            </v-col>
                            <v-col cols="auto">
                                <v-btn color="info" small @click="enviarCorreos()" :disabled="form.id_usuarios < 1">
                                    Enviar <v-icon right >mdi-send</v-icon>
                                </v-btn>
                            </v-col>
                    </v-subheader>

                    <v-list-item-group v-model="form.id_usuarios" multiple >
                    <v-list-item v-for="alumno in alumnos" :key="alumno.id" :value="alumno.usuario_alumno.id" class="rounded-lg"> 
                        <template v-slot:default="{ active }" >
                        <v-list-item-avatar>
                            <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                            <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle> 
                                <v-row dense>
                                    <v-col>
                                        Usuario: {{alumno.usuario_alumno.nb_usuario}} 
                                    </v-col>
                                    <v-col cols="auto">
                                        {{alumno.usuario_alumno.tx_email}} 
                                    </v-col>
                                </v-row>
                            </v-list-item-subtitle>    
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-row dense>
                                <v-col>
                                    <list-simple-icon label="Correo Enviado" icon="mdi-email-check" color="green" v-if="alumno.usuario_alumno.welcome_at"></list-simple-icon>
                                    <list-simple-icon label="Pendiente" icon="mdi-email-alert" :size="28" color="red" v-else></list-simple-icon>
                                </v-col>
                                <v-col>
                                    <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                                </v-col>
                            </v-row>
                        </v-list-item-action>
                        </template>
                    </v-list-item>
                    </v-list-item-group>
                </v-list>
            </v-col>
        </v-row>


        
        </v-card-text>

    </v-card>
  
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    created()
    {
        this.list()
    },

    data () {
        return {
           grados:        [],
           grado:         null,
           grupos:        [],
           grupo:         null,
           alumnos:       [], 
           form:
            {
				id_usuarios: 	  [],
				id_status: 	      1,
				id_usuario: 	  1,
            },
            selectAll: false
        }
    },

    watch: {
        selectAll( active )
        {
            console.log('active',active)
            if(active)
            {
                this.form.id_usuarios = this.alumnos.map(alumno => alumno.usuario_alumno.id)
            } else {
                this.form.id_usuarios = []
            }
            
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `grado/list` ).then( data => this.grados   = data )
        },

        getGrupos(grado)
        {
            this.alumnos = []
            this.getResource( `grupo/grado/${grado}` ).then( data => this.grupos  = data )
        },

        getAlumnos(grupo)
        {
            this.getResource( `alumno/detalle/grupo/${grupo}` ).then( data => this.alumnos  = data )
        },

        enviarCorreos()
        {
            if(this.form.id_usuarios.length < 1 ){
                this.showError('Seleccione por lo menos 1 alumno')
                return
            }

            this.postResource('welcomeAlumnos', this.form).then( data => {
                this.showMessage('Correos enviados correctamente');
                this.getAlumnos(this.grupo)
                this.form.id_usuarios = []
            })
        }
     
    }

}
</script>

<style>

</style>