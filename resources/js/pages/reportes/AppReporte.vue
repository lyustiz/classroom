<template>

    <v-dialog scrollable fullscreen persistent v-model="dialog">

    <template v-slot:activator="{ on, attrs }">
        <v-btn fab color="grey lighten-5" v-bind="attrs" v-on="on" x-small depressed>
            <v-icon color="indigo">mdi-printer</v-icon>
        </v-btn>
    </template>

    <v-card flat class="report-container">

         <v-card-title class="pa-0">
            <app-simple-toolbar :title="title" @closeModal="dialog = false"></app-simple-toolbar>
        </v-card-title>
        
        <v-form ref="form" v-model="valid" lazy-validation>
        <v-toolbar class="elevation-0 grey lighten-5">
        
            <v-row>

                <v-col cols="10">
                    <v-select
                        :items="campos"
                        v-model="form.campos"
                        item-text="name"
                        item-value="value"
                        :rules="[rules.mutiple]"
                        label="Columnas para Mostrar"
                        autocomplete
                        chips
                        deletable-chips
                        multiple
                        filled
                        clearable
                        single-line
                        dense
                        hide-details
                        rounded
                    ></v-select>
                </v-col>

                <v-col cols="auto" class="my-1">
                    <app-button color="warning" label="Reiniciar" icon="mdi-restore" @click="clear()" depressed></app-button>
                    <app-button color="blue" label="Mostrar Datos" icon="mdi-table-eye" @click="getReporte()" depressed></app-button>
                    <app-button color="success" label="Exportar a Excel" icon="mdi-file-excel-box" @click="getReporteExcel()" depressed></app-button>
                </v-col>

                <v-col cols="auto" class="my-1">
                    <v-badge left color="red" :value="hasFilter()" overlap dot bordered>
                        <app-button color="indigo" label="Filtrar Datos" icon="filter_list" @click="showMenu($event, 'filter')" depressed></app-button>
                    </v-badge>
                    <v-badge left color="red" :value="hasSearch()" overlap dot bordered>
                        <app-button color="info" label="Buscar" icon="search" @click="showMenu($event, 'search')" depressed></app-button>
                    </v-badge>
                </v-col>

            </v-row>

            <v-menu 
                v-model="filter" 
                :close-on-click="false" 
                :close-on-content-click="false" 
                :position-x="position.x" 
                :position-y="position.y" 
                min-width="30vw"
                absolute>
                <v-card>
                    <v-card-text>
                    <v-icon color="red" @click="filter=false">mdi-close-circle-outline</v-icon>
                    <v-select v-for="(filtro, index) in filtros" :key="index"
                        :items="filtro.items"
                        v-model="form.filtros[index][filtro.fieldId]"
                        item-text="name"
                        item-value="value"
                        :label="filtro.label"
                        autocomplete
                        hide-details
                        multiple
                        clearable
                    ></v-select>
                    </v-card-text>
                </v-card>
            </v-menu>

            <v-menu 
                v-model="search" 
                :close-on-click="false" 
                :close-on-content-click="false" 
                :position-x="position.x" 
                :position-y="position.y" 
                min-width="30vw"
                absolute>
                <v-card>
                    <v-card-text>
                        <v-icon color="red" @click="search=false">mdi-close-circle-outline</v-icon>
                        <v-text-field
                            v-model="searching"
                            append-icon="search"
                            label="Buscar"
                            hide-details
                            clearable
                        ></v-text-field>
                    </v-card-text>
                </v-card>
            </v-menu>

        </v-toolbar>
        </v-form>

        <v-card-text>

            <template v-if="items">
                <report-data :items="items" :headers="headers" :search="searching"></report-data> 
            </template>
            <template v-else-if="!items && loading==false">
                <v-alert type="warning" :value="true" prominent outlined border="left" class="mt-3">
                    Seleccione las columnas y haga click en "mostrar datos"  <v-icon color="blue" class="ml-1">mdi-table-eye</v-icon>
                </v-alert>
            </template>
            <pre>{{$data}}</pre>
        </v-card-text>

        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>
   
    </v-card>
    </v-dialog>    
</template>

<script>

import AppData from '@mixins/AppData';
import AppReportData from './AppReportData'

export default {

    mixins:     [ AppData],

    components:{

        'report-data' : AppReportData
    },

    props: 
    {
        tableName: {
            type: String,
            default: 'vw_alumno'
        },

        title: {
            type: String,
            default: 'Reporte'
        },

        hiddenCols: {
            type: Array,
            default: () => []
        },

        showCols: {
            type: Array,
            default: () => []
        },

        nameCols: {
            type: Array,
            default: () => []
        },
    },

    watch:
    {
        dialog(active)
        {
            if(active)
            {
                this.form.tableName  = this.tableName
                this.form.hiddenCols = this.hiddenCols
                this.form.showCols   = this.showCols
                this.form.nameCols   = this.nameCols
                this.list();
            }
        }
    },

    data () {
        return {
            campos:     [],
            filtros:    false,
            filter:     false,
            search:     false,
            dateSets:   false,
            items:      false,
            headers:    false,
            searching:  null,
            position: { x:0, y:0 },
            form:{
                campos:     [],
                filtros:    [],
                dateSets:   [],
                tableName:  null,
                hiddenCols: [],
                showCols:   [],
                nameCols:   [],
            },
        }
    },
    methods:
    {
        list()
        {
            this.postResource('reporte/generate', this.form ).then(data =>{
                this.campos     = data.fields;
                this.mapFiltros(data.filters);
                this.mapDateSets(data.dateset);
            })
        },

        getReporte(){
            
            if(!this.$refs.form.validate()) return this.showError('Seleccione Campos para mostrar la Data')

            this.items = false; 
            this.panel = false;

            this.postResource('reporte/execute', this.form ).then(data =>{
                this.items   = data.data;
                this.headers = data.headers;
            })
        },

        mapFiltros(filtros){

            for(var keys in filtros)
            {
                let setFilters = {};

                setFilters[ filtros[keys].fieldId ] = [];

                this.form.filtros.push(setFilters);
            }

            this.filtros = filtros;
        },

        mapDateSets(datefields){
           
            for(var keys in datefields)
            {
                let setDateField = {};
                let setDateMenu = {};

                setDateField[ datefields[keys].value ] = '';
                setDateMenu[ datefields[keys].value ] = false;

                this.form.dateSets.push(setDateField);
            }
         
            this.dateSets = datefields;
        },
        
        getReporteExcel(){

            if(!this.$refs.form.validate()) return this.showError('Seleccione Campos para mostrar la Data')

            let type     = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            let filename = 'reporte.xlsx' ;

            this.downloadResource('reporte/execute/excel', this.form, type, filename).then(data =>{
                this.showMessage(data)
            })

        },

        clear()
        {
            this.$refs.form.reset();
            this.items = false;
            this.searching == null
        },

        showMenu(activator, menu )
        {
            this.position.x = activator.pageX
            this.position.y = activator.pageY + 20
            this[menu] = true
        },

        hasFilter()
        {
            let hasFilter = false
            for (const filter of this.form.filtros) {
                let filterName = Object.keys(filter)[0]
                if(filter[filterName] != "") hasFilter = true
            }
            return hasFilter
        },

        hasSearch(){
            return this.searching !== null
        }

    }
}

</script>

<style scoped>

</style>