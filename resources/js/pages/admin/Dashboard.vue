<template>
  <v-container>
  <div id="full-container" >
      <v-toolbar dark color="info" dense>
          Administrador
      </v-toolbar>
      
  </div>

      <v-row>
          <v-col v-for="(menu, idx) in menus" :key="idx" cols="6" md="4" lg="3" @click="navegateTo(menu.name)">

              <v-card dark color="orange card-menu" ripple>

                  <v-card-title v-html="menu.label" class="subtitle-1"></v-card-title>
                
                    <v-card-text>
                        <v-col cols="12 text-center">
                            <v-avatar class="white" size="60"  >
                                <v-icon size="40" color="orange">{{menu.icon}}</v-icon>
                            </v-avatar>
                        </v-col>
                    </v-card-text> 

                </v-card>
                
          </v-col>

      </v-row>
      
  </v-container>
  
</template>

<script>

export default {

    created()
    {
         const admin = this.$router.options.routes.filter((menu) =>  menu.path == '/admin')

         this.menus = admin[0].children.filter((menu) => menu.path != '/' )
    },

    data()
    {
        return {
           menus: []
        }
    },
    methods: {
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
    background-color: blue;
    background-attachment: fixed;
    background-size: 100% 100%; 
}

.card-menu {
    cursor: pointer;
}
</style>


