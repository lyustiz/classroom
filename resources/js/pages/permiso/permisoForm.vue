<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

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
                menu: 	 [],
	 	 	 	perfil:  [],
	 	 	 	status:  [],
            },
            defaultForm:{
                bo_select:  0,
                bo_insert:  0,
                bo_update:  0,
                bo_delete:  0,
                bo_admin:   0,
                bo_default: 0,
            },
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>