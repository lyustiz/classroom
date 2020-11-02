<template>

    <v-card class="rounded-xl" min-height="200px" light>

        <v-card-text >  

            <v-tooltip bottom color="green">
                <template v-slot:activator="{ on }">   
                    <v-btn fab color="success" x-small v-on="on" @click="insertForm()" :loading="loading" absolute top right>
                        <v-icon size="25"  >mdi-plus</v-icon>
                    </v-btn>         
                </template>
                <span>agregar pregunta</span>
            </v-tooltip>  
            
            <v-list dense>

                <v-list-group  v-for="pregunta in items" :key="pregunta.id">

                    <template v-slot:activator>

                        <v-list-item color="blue">
                            <v-list-item-avatar color="white" size="35">
                                <v-icon size="30" :color="pregunta.tipo_pregunta.tx_color">{{pregunta.tipo_pregunta.tx_icono}}</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title> {{ pregunta.nb_pregunta }}</v-list-item-title>
                                <v-list-item-subtitle>{{ pregunta.nb_descripcion }}</v-list-item-subtitle>
                            </v-list-item-content>

                            <v-list-item-action>
                                <v-btn icon>
                                    <v-icon size="20" color="orange lighten-1" @click.stop="updateForm(pregunta)">mdi-lead-pencil</v-icon>
                                </v-btn>
                            </v-list-item-action>
                            <v-list-item-action>
                                <v-btn icon>
                                    <v-icon size="20" color="red lighten-1" @click.stop="deleteForm(pregunta)">mdi-delete</v-icon>
                                </v-btn>
                            </v-list-item-action>
                        </v-list-item>

                    </template>

                    <actividad-respuesta :pregunta="pregunta"></actividad-respuesta>
                    
                </v-list-group>

            </v-list>

        </v-card-text>

        <actividad-pregunta-form
            :action="action"
            :item="item"
            @closeModal="closeModal()"
            :dialog="modal"
            :title="title"
            :actividad="actividad"
        ></actividad-pregunta-form>

        <form-delete
            :dialog="dialog"
            :loading="loading"
            message="¿Desea eliminar la Pregunta Seleccionada?"
            @deleteItem="deleteItem()"
            @deleteCancel="deleteCancel()"
        ></form-delete>
            
        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>

</template>

<script>
import listHelper from '@mixins/Applist';
import actividadPreguntaForm  from './AppActividadPreguntaForm';
import actividadRespuesta     from '@pages/actividadRespuesta/AppActividadRespuesta';
export default {

    mixins:     [ listHelper],

    props: {

        actividad: {
            type: Object,
            default: () => {}
        }
    },

    components: { 
        'actividad-pregunta-form': actividadPreguntaForm,
        'actividad-respuesta':     actividadRespuesta  
    },

    data () {
            return {
                title:    'ActividadPregunta',
                resource: 'actividadPregunta',
            }
    },

    methods:
    {
        listUrl()
        {
            return `${this.fullUrl}/actividad/${this.actividad.id}`
        },
    }
}
</script>

<style>
</style>