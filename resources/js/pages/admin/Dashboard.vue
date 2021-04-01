<template>
  <v-container fluid class=" lighten-2">
  <div id="full-container"  >
      
      <v-toolbar dark color="indigo lighten-1" class="rounded-lg" dense flat>
          <v-row>
              <v-col class="mt-1">Administrador</v-col>
              <v-col> 
                   <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                    solo-inverted
                    @input="searchMenu($event)"
                    autofocus
                    ></v-text-field>
              </v-col>
          </v-row>
          
      </v-toolbar>
      
  </div>

      <v-row>
          <v-col v-for="(menu, idx) in menus" :key="idx" cols="6" sm="4" md="3" lg="2" @click="navegateTo(menu.name)">

            <v-card color="transparent" class="rounded-xl pointer" flat >
                <v-card-text class="text-center">
                   <v-avatar size="100" :color="menu.color" ripple>
                        <v-icon size="70" color="white">{{menu.icon}}</v-icon>
                    </v-avatar>
                </v-card-text>
                <div class="text-center">{{menu.label}}</div>
            </v-card> 
                
          </v-col>

      </v-row>
      
  </v-container>
  
</template>

<script>

export default {

    created()
    {
        this.listMenu()
    },

    data()
    {
        return {
           admin: null,
           menus: [],
           search: null,
        }
    },
    methods: {

        listMenu()
        {
            this.admin = this.$router.options.routes.filter((menu) =>  menu.path == '/admin')
            this.menus = this.admin[0].children.filter((menu) => menu.path != '/' && menu.visible )
        },
        
        searchMenu(search)
        {
            if(search)
            {
                this.menus = this.admin[0].children.filter((menu) => menu.path != '/' && menu.label.toLowerCase().includes(search.toLowerCase())  )
            } 
            else {
                this.menus = this.admin[0].children.filter((menu) => menu.path != '/' )
            }
            
        },

        navegateTo(routeName)
        {
            this.$router.push( {name: routeName}).catch(err => {})
        }
    }

}
</script>

<style scoped>
#full-container{
    min-height: 200%;
    background-attachment: fixed;
    background-size: 100% 100%; 
}

.card-menu {
    cursor: pointer;
}
</style>


