<template>
<div class="amber lighten-2 home-holder mt-n6 pt-6">
   
   
<v-container fluid>

    <v-row > 
        <v-col></v-col>
        <v-col>
            <v-img src="images/logo-lg.png" class="logo-holder" width="300"></v-img>
        </v-col>
        <v-col></v-col>
        
    </v-row>

    <v-row>
        <v-col>
            <v-alert dark border="bottom"  color="amber darken-1" >
                MODULOS
            </v-alert>
        </v-col>
        
    </v-row>

    <v-row>
        <v-col>
            <v-card dark color="cyan">
                <v-card-title>
                    <div class=""> Secretaria</div>
                    <v-spacer></v-spacer>
                    <v-btn dark icon><v-icon>mdi-menu</v-icon></v-btn>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-icon size="60">mdi-chair-rolling</v-icon>
                </v-card-text>
            </v-card>
        </v-col>
        <v-col>
            <v-card dark color="green">
                <v-card-title>
                    <div class=""> Docente</div>
                    <v-spacer></v-spacer>
                    <v-btn dark icon><v-icon>mdi-menu</v-icon></v-btn>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-icon size="60">mdi-account-tie</v-icon>
                </v-card-text>
            </v-card>
        </v-col>
        <v-col>
            <v-card dark color="red">
                <v-card-title>
                    <div class=""> Alumno</div>
                    <v-spacer></v-spacer>
                    <v-btn dark icon><v-icon>mdi-menu</v-icon></v-btn>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-icon size="60">mdi-face</v-icon>
                </v-card-text>
            </v-card>
        </v-col>
        <v-col>
            <v-card dark color="purple">
                <v-card-title>
                    <div class=""> Acudiente</div>
                    <v-spacer></v-spacer>
                    <v-btn dark icon><v-icon>mdi-menu</v-icon></v-btn>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-icon size="60">mdi-human-male-child</v-icon>
                </v-card-text>
            </v-card>
        </v-col>
    </v-row>
    
</v-container>



</div>
</template>

<script>


export default 
{

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
.home-holder{
    height: 97vh;
}
.logo-holder{
    border-radius: 10px;
}
</style>
