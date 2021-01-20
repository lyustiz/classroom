<template>

  <v-card class="rounded-xl elevation-5 mb-4 px-n3">
    <v-slide-group
      v-model="materiaSelected"
      class="py-4"
      show-arrows="always"
    >
      <v-slide-item v-for="materia in materias" :key="materia.id">
        <v-card dark class="rounded-xl mx-1" flat height="10rem" width="8.1rem" :color="materia.area_estudio.tx_color">
          <v-card-text>
            <v-row no-gutters>
              <v-col class="text-center">
                <v-avatar color="grey lighten-5" size="48">
                  <v-icon :color="materia.area_estudio.tx_color" size="28">mdi-bookshelf</v-icon>
                </v-avatar>
              </v-col>
              <v-col cols="auto" class="py-2">
                <item-menu btn-color="transparent" icon-color="white" small :menus="itemsMenu" :item="materia" @onItemMenu="onItemMenu($event)"></item-menu>
              </v-col>
              <v-col cols="12">
                <div class="col-12 white--text text-center">{{materia.nb_materia}}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-slide-item>

      <v-slide-item v-if="materias.length < 1">
        <v-card dark class="rounded-xl" flat height="10rem" width="8.1rem" color="grey lighten-4"></v-card>
      </v-slide-item>

  </v-slide-group>
  <v-overlay class="rounded-xl" absolute :opacity="0.1" :value="loading">
    <v-icon size="60" class="mdi-spin">mdi-loading</v-icon>
  </v-overlay>
  <v-dialog v-model="dialogDetalle" max-width="500px" content-class="rounded-xl" >
      <AppDetalleMateria :materia="materia"></AppDetalleMateria>
    </v-dialog>

</v-card>

</template>

<script>
import AppDetalleMateria from './AppDetalleMateria'
import AppData from '@mixins/AppData';
export default {

    mixins: [ AppData ],

    components: {
      AppDetalleMateria
    },

    created()
    {
        this.list()
    },

    data()
    {
      return {
        materias: [],
        materiaSelected: null,
        materia:         null,
        dialogDetalle:   false,
        itemsMenu: [
            { action: 'showDetalle',     icon: 'mdi-text-box-search',  label: 'Detalle Materia' },
        ],
      }
    },

    computed:
    {
      alumno()
      {
          return this.$store.getters['getAlumno'];
      },
    },

    methods: 
    {
      list()
      {
        this.getResource( `materia/alumno/${this.alumno.id}` ).then( (data) => 
        { 
          this.materias = data
        })
      },

      showDetalle(materia)
      {
        this.materia       = materia
        this.dialogDetalle = true
      }
    }

}
</script>

<style>

</style>