export default
{
    data()
    {
        return {
            rules:
            {
        /*     
                password: v => (v || '').match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/) ||
                'Password must contain an upper case letter, a numeric character, and a special character',
                 */
                

                select: v => !!v || 'Seleccione una Opcion (Dato Requerido)',
                
                mutiple: v =>  v.length > 0 || 'Seleccione una Opcion (Dato Requerido)',
                
                required: v => (!!v) || 'Dato Requerido',
                
                radio: v => !!v || 'Seleccione una Opcion (Requerido)',

                check: v => [0, 1, true, false].includes(v) || 'Seleccione una Opcion (Requerido)',
                
                monto: v => !!v || 'Monto Requerido',
                
                fecha: v => !!v || 'Fecha Requerida',
                
                email: [
                    v => !!v || 'El Correo es Requerido',
                    v => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'indicar un email válido',
                    v => (v || '').length <= 80 || 'Maximo de caracteres permitidos 80',
                ],
                
                nit: [
                    v => !!v || 'El NIT es Requerido',
                    v => /(^[0-9]+-{1}[0-9]{1})/.test(v) || 'indicar un NIT válido Ej: 123123123-1',
                    v => (v || '').length <= 12 || 'Maximo de caracteres permitidos 12',
                ],

                email_confirmation: v => this.form.tx_new_email === v || 'Los correos no coinciden',
                
                image:  v => !v || v.size < 2000000 || 'Imagen debe tener menos de 2 MB!',
            
                coordinate: v => !v || v != 0 || 'Debe Seleccionar una Ubicacion',
                
                password: [
                    v => !!v || 'La Contraseña es Requerida',
                    v => !!v && v.length > 7 || 'La contraseña debe tener almenos 6 caracteres',
                    v => !!v && v.length <= 15 || 'La contraseña debe tener maximo 15 caracteres'
                ],

                password_confirmation: v => this.form.password === v || 'Las contraseñas no coinciden',

                minlength: len => value => (value || '').length >= len || `Minimo de caracteres requeridos ${len}`,

                maxlength: len => value => (value || '').length <= len || `Maximo de caracteres permitidos ${len}`, 
            }
        }
    },
}
