export default {
    computed:
    {
        msjTimeout()
        {
            return this.$store.getters['msjTimeout']
        }
    },
    methods:
    {
        validResponse(response){
            this.showMessage(response.data.msj)
            this.modal = false;
            this.$emit('closeModal')    
        },
		showMessage (message)
        {
            this.showMsjBar(message, 'success')
        },
        showError (error)
        {
            
            if(!error)
            {
                this.showMsjBar( 'Ha ocurrido un error, Consulte al administrador')
                return false
            }
            
            console.log('error', error, error ? error.response : 'no response'   )


            if(error.hasOwnProperty('response'))
            {
                if(error.response === undefined)
                {
                    this.showMsjBar( 'El servicio no Responde', 'error')
                    return
                }

                let status = error.response.status;
                let msj    = '';

                switch (status)
                {
                    case 500:
                    msj = 'Error interno'
                    break;

                    case 404:
                    msj = 'Servicio No disponible'
                    break;

                    case 403:
                    msj = error.response.data
                    break;

                    case 401:
                        msj = 'Session invalida favor Ingresar nuevamente '
                        this.showMsjBar(msj, 'error')
                        setTimeout(() => {
                            axios.post('logout')
                            .then(response =>
                            {
                                if (response.status==200){
                                    localStorage.removeItem("auth")
                                    window.location='/'
                                }
                            })
                            .catch(error =>
                            {
                                this.mostrarBarraMsj( 'Error en LogOut', 'error')
                                localStorage.removeItem("auth")
                                window.location='/'
                            })
                        }, 2000);
                    break;

                    case 429:
                    for (var idx in error.response.data.errors)
                    {
                        msj = msj + error.response.data.errors[idx];
                    }
                    msj = ( msj != '') ? msj :  'Servicio Ocupado favor Ingresar en unos Minutos'
                    break;

                    case 422:
                    for (var idx in error.response.data.errors)
                    {
                        msj = msj + ' ' + error.response.data.errors[idx];
                    }
                    break;

                    case 400:
                    for (var idx in error.response.data)
                    {
                        msj = msj + error.response.data[idx];
                    }
                    break;

                    default:
                    for (var idx in error.response.data)
                    {
                        msj = msj + error.response.data[idx];
                    }
                    break;
                }

                this.showMsjBar( msj, 'error')

            }else
            {
                this.showMsjBar(error, 'error')
            }

        },

        clearMsj ()
        {
            setTimeout( () =>
            {
                this.$store.commit('setMsjShow', false)
                this.$store.commit('setMsjText', '')
                this.$store.commit('setMsjSubText', '')
            }, this.msjTimeout)
        },

        showMsjBar (message, color)
        {
           
            this.$store.commit('setMsjShow', true)
            this.$store.commit('setMsjColor', color || 'error')

            if (typeof message === 'string')
            {
                this.$store.commit('setMsjText', message)
                this.clearMsj()
                return
            }

            this.$store.commit('setMsjText', message.message)

            if (message.response)
            {
                this.$store.commit('setMsjSubText',message.response.data.message)
            }

            this.clearMsj()
        },
    }
}
