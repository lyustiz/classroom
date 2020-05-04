<template>
    <div>
    <v-carousel
        cycle
        height="320"
        hide-delimiter-background
        show-arrows-on-hover
        class="elevation-3 list-publicidad"
    >
        <v-carousel-item
            v-for="(item, i) in publicidad"
            :key="i"
            :src="item.src"
            class="list-publicidad"
        >
        </v-carousel-item>

    </v-carousel>
    </div>
</template>

<script>
export default {
    created()
    {
       this.publicidad = [ 
                            { src: '/images/publicidad1' + this.imgSize },
                            { src: '/images/publicidad3' + this.imgSize }
                        ];
    },
    computed:{
        imgSize()
        {
            return ( this.$vuetify.breakpoint.xsOnly) ? '-m.jpg' : '.jpg'
        },
    },
    data() {
        return{
            publicidad: [ ],
        }
    },
    

}
</script>

<style>
.list-publicidad .v-image__image {
    border-radius: 20px;
}

.list-publicidad {
    border-radius: 20px;
}
</style>