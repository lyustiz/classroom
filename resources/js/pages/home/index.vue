<template>
<div>
   <v-alert class="mx-3 mt-5" icon="mdi-shovel"  dark color="amber" :value="true">
              En Construccion 
          </v-alert>
</div>
</template>

<script>

import AppFilters from '~/components/app/AppFilters';
import ListCategoria from '~/components/categoria/ListCategoria';
import ListPublicidad from '~/components/publicidad/ListPublicidad';

export default 
{
    components: { 
        'app-filters': AppFilters,
        'list-categoria': ListCategoria,
        'list-publicidad': ListPublicidad,
    },

    data () 
	{
        return {
            Showfilter: true,
            logo: require('~/assets/img/logo.png'),
        }
    },
}
</script>

<style>
</style>
