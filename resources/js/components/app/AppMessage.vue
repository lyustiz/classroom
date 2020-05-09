<template>
    <v-snackbar
		:timeout="timeoutMsj"
		:color="colorMsj"
		v-model="showMsj"
		:multi-line="false"
    
    >
        {{ txtMsj }}
        {{ subTxtMsj }}
        <v-btn text  @click.native="closeMsj()">
          <v-icon>close</v-icon>
        </v-btn>
    </v-snackbar>
</template>

<script>
  export default {
    computed:
    {
      showMsj()
      {
        return this.$store.getters['msjShow']
      },
      txtMsj()
      {
        return this.$store.getters['msjText']
      },
      subTxtMsj()
      {
        return this.$store.getters['msjSubtext']
      },
      colorMsj()
      {
        return this.$store.getters['msjColor']
      },
      timeoutMsj()
      {
        return this.$store.getters['msjTimeout']
      }
    },
    methods: {
      closeMsj () {
        this.$store.commit('setMsjShow', false)
      }
    }
  }
</script>
