<template>

<v-card min-height="92.3vh" flat color="grey lighten-4">

    <v-card-text>

        <v-row>                        

            <v-col cols="3" class="text-center" >

                <v-row >

                <v-col>
                    <clase-calendar :clases="clases" @onUpdateDate="updateDate($event)"></clase-calendar>
                </v-col>

                <v-col cols="12">
                    <v-select
                        :items="grados"
                        v-model="grado"
                        item-text="nb_grado"
                        item-value="id"
                        label="Grado"
                        :loading="loading"
                        hide-details
                        dense
                        filled
                        rounded
                        @change="getGrupos($event)"
                        return-object
                        clearable
                    ></v-select>
                </v-col>

                <v-col cols="12">
                    <v-select
                        :items="grupos"
                        v-model="grupo"
                        item-text="nb_grupo"
                        item-value="id"
                        label="Grupo"
                        :loading="loading"
                        hide-details
                        dense
                        filled
                        rounded
                        @change="getMaterias($event)"
                        return-object
                        clearable
                    ></v-select>
                </v-col>

                <v-col cols="12">
                    <v-select
                        :items="materias"
                        v-model="materia"
                        item-text="nb_materia"
                        item-value="id"
                        label="Materia"
                        persistent-hint
                        :loading="loading"
                        hide-details
                        dense
                        filled
                        rounded
                        return-object
                        @change="filterData()"
                        clearable
                    ></v-select>
                </v-col>

                </v-row>
            </v-col>

            <v-col cols="9" >

                <v-row>

                <v-col cols="6">

                    <v-sheet
                        class="rounded-xl d-flex align-center text-center justify-center"
                        color="grey lighten-3"
                        min-width="400"
                        min-height="190"
                        height="100%"
                        width="100%"
                    >
                       
                         <v-col cols="12">

                             <v-tooltip bottom color="success">
                                <template v-slot:activator="{ on }">
                                   <v-btn v-on="on" fab color="success" :loading="loading" @click="addClase()">
                                        <v-icon :size="30">mdi-plus</v-icon>
                                    </v-btn>
                                </template>
                                <span >Nueva Clase</span> 
                            </v-tooltip>

                            <v-tooltip bottom color="success">
                                <template v-slot:activator="{ on }">
                                   <v-btn v-on="on" fab color="success" :loading="loading" @click="navegateToName('bandeja-docente')">
                                        <v-icon :size="30">mdi-home</v-icon>
                                    </v-btn>
                                </template>
                                <span >Volver al Inicio</span> 
                            </v-tooltip>

                            <v-tooltip bottom color="info">
                                <template v-slot:activator="{ on }">
                                    <v-btn v-on="on" fab color="info" :loading="loading" @click="list()">
                                        <v-icon :size="30" >mdi-refresh</v-icon>
                                    </v-btn>
                                </template>
                                <span >Actualizar</span> 
                            </v-tooltip>

                           <v-tooltip bottom color="red">
                                <template v-slot:activator="{ on }">
                                    <v-btn v-on="on" fab dark color="red" :loading="loading" target="popup" @click="popup('https://meet.google.com/')">
                                        <v-icon :size="30">mdi-google</v-icon>
                                    </v-btn>
                                </template>
                                <span >Google Meet</span> 
                            </v-tooltip>

                            <v-tooltip bottom color="#0e71eb">
                                <template v-slot:activator="{ on }">
                                    <v-btn v-on="on" fab dark color="#0e71eb" :loading="loading" target="popup" @click="popup('https://zoom.us/join')">
                                        <v-icon :size="30">mdi-video</v-icon>
                                    </v-btn>
                                </template>
                                <span >Zoom</span>
                            </v-tooltip>

                        <!--     <v-tooltip bottom color="amber">
                                <template v-slot:activator="{ on }" >
                                    <v-btn v-on="on" fab dark color="amber" :loading="loading" @click="initVirtualinMeet()">
                                        <v-icon :size="30">mdi-video-check-outline</v-icon>
                                    </v-btn>
                                </template>
                                <span >Virtualin</span>
                            </v-tooltip>
 -->
                        </v-col>
                    </v-sheet>
                    
                </v-col>

                <v-col cols="6" v-for="clase in clases" :key="clase.id">
                    <clase-card :clase="clase" :loading="loading" @onUpdateData="list()"></clase-card>
                </v-col>

                </v-row>
                
            </v-col>

        </v-row>
         
    </v-card-text>

    <app-modal
        :modal="modal"
        @closeModal="closeDialog('modal')"
        :head-color="$App.theme.headModal"
        title="Iniciar Clase"
    >
        <clase-form
            dia="1"
            :docente="docente"
            :grados="grados"
            :grado="grado"
            :grupo="grupo"
            :materia="materia"
            :item="null"
            action="ins"
            @closeModal="closeDialog('modal', true)"
            v-if="modal"
        ></clase-form>

    </app-modal>

 </v-card>

</template>

<script>
import AppData       from '@mixins/AppData';
import ClaseForm     from './AppClaseForm';
import ClaseCalendar from './components/ClaseCalendar';
import ClaseCard     from './components/ClaseCard';


export default {

    mixins:     [ AppData],

    components: { 
        'clase-form':     ClaseForm,
        'clase-calendar': ClaseCalendar,
        'clase-card':     ClaseCard,
    },

    created()
    {
        this.list();
        this.comboData();
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        },
    },

    data () {
            return {
                menu: [
                    { action: 'addAsistencia',  icon: 'mdi-account-multiple-check',  label: 'Asistencia' },
                ],
                clases:     [],
                grados:     [],
                grupos:     [],
                materias:   [],
                grado:      null,
                grupo:      null,
                materia:    null,
                clase:      null,
                asistencia: null,

                day: null,

                dialogAsistencia: false,

                windowsMeet: false,
                windowsUrl: false
            }
    },

    methods:
    {
        
        list(){
            this.getResource(`clase/docente/${this.docente.id}`).then( data =>{
                this.items = data
                this.filterData()
            })
        },
        
        comboData()
        {
            this.grupos   = []
            this.materias = []
            this.getResource(`grado/grupo/materia/alumno/docente/${this.docente.id}`).then( data =>{
                this.grados = data
            })
        },

        updateDate(day)
        {
            this.day = day
            this.grado   = null
            this.grupo   = null
            this.materia = null
            this.filterData()
        },

        addClase()
        {
            if(this.hasIniciada()) {
                this.showError('Existe una clase Iniciada favor finalizarla')
                return
            } 
            this.modal = true
        },

        hasIniciada()
        {
            for (const clase of this.items) {
                if(!clase.fe_completada)
                {
                    return true
                }
            }
            return false
        },

        getGrupos(grado)
        {
            this.grupos   = grado.grupo
            this.materia  = null
            this.filterData()
        },

        getMaterias(grupo)
        {           
            this.materias  = grupo.materia
            this.filterData()
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            if(refresh)
            {
                this.list();
            }
        },

        popup(url){
            
            let width  = window.innerWidth * 90 / 100
            let height = window.innerHeight * 90 / 100
            let left   = window.innerWidth  * 10 / 100 / 2
            let top    = window.innerHeight * 10 / 100 / 2

            if( this.windowsMeet === false || this.windowsMeet.closed) {
                this.windowsMeet = window.open(url, 'googlemeet', `width=${width},height=${height},left=${left},top=${top},menubar=0,toolbar=0`);
                this.windowsMeet.document.title = "Virtualin Meet";
                this.windowsMeet.focus();
            }else
            {
                this.windowsMeet.focus();
            }
            
        },

        initVirtualinMeet()
        {
            if(this.windowsMeet){ this.windowsMeet.close() }
            this.navegateTo('meet-docente')
        },

        filterData()
        {
            this.clases =    this.items.filter( (item) => 
            {
                if ( (this.day) ? ( item.fe_clase.substr(0, 10)  )!= this.day : false ) return false

                if ((this.grado) ? item.id_grado != this.grado.id : false ) return false

                if ((this.grupo) ? item.id_grupo != this.grupo.id : false ) return false

                if ((this.materia) ? item.id_materia != this.materia.id : false ) return false
            
                return true
            })
        }
    }
}
</script>

<style>

</style>