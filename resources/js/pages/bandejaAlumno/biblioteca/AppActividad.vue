<template>

<v-container fluid class="cyan actividad-container">

    <v-row justify="center" class="red">

        <v-col class="red white--text display-1"> {{title}}</v-col>
        <v-spacer></v-spacer>
        <v-col cols="auto">
            <app-button small :size="30" innerClass="ma-1" color="green" label="Volver al Inicio" icon="mdi-home" @click="$emit('closeModal')" ></app-button>
        </v-col>
        
    </v-row>
 

    <v-row justify="center">


        <v-col cols="8">

            
             <v-row>

                <v-alert elevation="2" border="left" color="amber lighten-1" icon="mdi-lightbulb-on" dark prominent class="white mx-6 rounded-lg text-justify" width="100%">
                    <p class="headline mx-6 font-weight-light">{{description}}</p>
                </v-alert>

            </v-row>

            <v-row>

                <v-alert colored-border border="left" color="deep-purple accent-4" elevation="2" class="white mx-6 rounded-lg text-justify" width="100%">

                    <v-col class="pa-4">

                    <h3 class="deep-purple--text" >Actividades:</h3>
                    <v-divider></v-divider>
                    
                    <p class="font-weight-medium mt-8">1. Haz los siguientes movimientos:</p>

                    <ul>
                        <li>Toca la punta de tu nariz con la mano izquierda.</li>
                        <li>Para de mover tu corazón.</li>
                        <li>Toca tu rodilla derecha con la mano izquierda.</li>
                        <li>Toca tu oreja izquierda con la mano derecha.</li>
                        <li> Mueve tu estómago por dentro.</li>                                  
                    </ul>

                    <p class="mt-8 font-weight-medium"> 2. Discute con uno de tus compañeros sobre el  ejercicio anterior. Contesten las siguientes preguntas:</p>

                    <v-textarea
                        prepend-inner-icon="mdi-help"
                        outlined
                        auto-grow
                        label="Cuáles movimientos pudieron hacer dándole una orden al  cuerpo para que lo hiciera?"
                        rows="3"
                        row-height="30"
                    ></v-textarea>

                    <v-textarea
                        prepend-inner-icon="mdi-help"
                        outlined
                        auto-grow
                        label="Cuáles movimientos no pudieron hacer aunque hayan tratado  de ordenarle al cuerpo que lo hiciera?"
                        rows="3"
                        row-height="30"
                    ></v-textarea>

                    <v-row dense>
                        <v-spacer></v-spacer>
                        <v-col cols="auto">
                            <v-btn color="success">Responder</v-btn>
                        </v-col>
                    </v-row>

                    </v-col>
                    
                </v-alert>

            </v-row>

        </v-col>

        <v-col cols="4">

            <v-carousel :show-arrows="false" :show-arrows-on-hover="true"  height="550" width="100%" class="rounded-lg white" continuous cycle>
                <v-carousel-item >
                    <v-img src="/images/actividad/actividad2.png"></v-img>
                </v-carousel-item>
                <v-carousel-item>
                    <v-img src="/images/actividad/actividad3.png"></v-img>
                </v-carousel-item>
                <v-carousel-item >
                     <v-img src="/images/actividad/actividad4.png"></v-img>
                </v-carousel-item>
                <v-carousel-item >
                     <v-img src="/images/actividad/actividad5.png"></v-img>
                </v-carousel-item>
            </v-carousel>

        </v-col>
        
    </v-row>

    
</v-container>




  
</template>

<script>
export default {

    data()
    {
        return {
            title: '¿Cómo se mueve el ser humano?',
            description: '    El cuerpo humano puede moverse debido a que tiene músculos y huesos. Hay movimientos que son voluntarios, porque podemos decidir si los hacemos o no, y el momento en que los queremos hacer, como por ejemplo caminar, correr o saltar. Hay otros movimientos que son involuntarios, porque no los podemos controlar, como los latidos del corazón y los movimientos intestinales. Los músculos voluntarios son diferentes a los músculos involuntarios',
            items: [],
            image: '',
            form: {
                pregunta1: false,
                pregunta2: false,
                pregunta3: false
            }
        }
    },

}
</script>

<style>
.actividad-container{
    min-height: 100vh;
}
</style>