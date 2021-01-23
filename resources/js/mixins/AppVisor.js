import AppData   from '@mixins/AppData';

export default 
{
    mixins: [AppData],    
    props:
    {
        evaluar: {
            type: Boolean,
            default: false
        },

        segundos: {
            type: Number,
            default: 60
        },

        evaluacion: {
            type: Object,
            default: ()  => {}
        }
    },

    created()
    {
        if(this.evaluar)
        {
            if(this.validarData())
            {
                this.time = ( this.segundos )  ? this.segundos :  this.evaluacion.evaluacion.tipo_evaluacion.nu_criterio
                this.registroAcceso()
                this.conteo()
            }
        }
    },

    beforeDestroy()
    {
        clearInterval(this.timer)
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno']
        }
    },

    data()
    {
        return {
            isCompleted: false,
            time: 0,
            timer: null,
            form: {
                id_usuario: this.IdUser
            }
        }
    },

    methods: {

        validarData()
        {           
            if(!this.evaluacion.id) {
                this.showError('Error en Asignacion')
                return
            }

            if(!this.segundos) {
                this.showError('Error en criterios de evaluacion')
                return
            }

            if(!this.evaluacion.id_alumno) {
                this.showError('Error en datos alumno')
                return
            }

            if(this.evaluacion.fe_completado) {
                this.showMessage('Actividad Completada')
                this.isCompleted = true
                return true
            }

            return true
        },

        registroAcceso()
        {
            this.updateResource(`evaluacionAlumno/${this.evaluacion.id}/acceso`, this.form).then( (data) => {

            })

        },

        registroCompletado()
        {
            if(this.isCompleted) return
            
            this.updateResource(`evaluacionAlumno/${this.evaluacion.id}/completada`, this.form).then( (data) => {
                this.isCompleted = true
                this.$emit('onClomplete')
            })
        },

        conteo() 
        {
            if (!this.timer) {
                this.timer = setInterval( () => {
                    if (this.time > 0) {
                        this.time--
                    } else {
                       clearInterval(this.timer)
                       this.registroCompletado()
                    }
                }, 1000 )
            }
        },

    }
}
