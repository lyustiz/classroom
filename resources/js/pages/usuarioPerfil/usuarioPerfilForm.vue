<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.usuario"
            item-text="nb_usuario"
            item-value="id"
            v-model="form.id_usuario"
            :rules="[rules.select]"
            label="Usuario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
      
        <v-col cols="12" md="6">
            <v-select
            :items="selects.perfil"
            item-text="nb_perfil"
            item-value="id"
            v-model="form.id_perfil"
            :rules="[rules.select]"
            label="Perfil"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.status"
            item-text="nb_status"
            item-value="id"
            v-model="form.id_status"
            :rules="[rules.select]"
            label="Status"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'usuarioPerfil',
            form:
            {
                id: 	           null,
				id_usuario: 	   null,
				id_perfil: 	       null,
				tx_observaciones:  null,
				id_status: 	       null,
				id_usuario_ed: 	   null,
            },
            selects:
            {
                perfil: 	 [],
	 	 	 	status: 	 [],
	 	 	 	usuario: 	 [],
            },
            default:
            {
                id_usuario_ed: this.idUser
            }
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>