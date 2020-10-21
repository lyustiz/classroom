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
                
                mutiple: v =>  v.length > 0 || 'Seleccione una Opcion (Dato Requerido)', //search mal colocado

                multiple: v =>  v.length > 0 || 'Seleccione una Opcion (Dato Requerido)',
                
                required: v => (!!v) || 'Dato Requerido',
                
                radio: v => !!v || 'Seleccione una Opcion (Requerido)',

                check: v => [0, 1, true, false].includes(v) || 'Seleccione una Opcion (Requerido)',
                
                monto: v => !!v || 'Monto Requerido',
                
                fecha: v => !!v || 'Fecha Requerida',

                hora: v => !!v || 'Hora Requerida',

                url:   v => /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})).?)(?::\d{2,5})?(?:[/?#]\S*)?$/i.test( v ) || 'url invalido',

                youtube:   v => /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=|\?v=)([^#&?]*).*/i.test( v ) || 'url de yutube invalida',

                file: v => !!v || 'Archivo Requerido',
                
                number: v => /^(?:-?\d+|-?\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test( v ) || 'numero no valido',

                digits: v => /^\d+$/.test( v ) || 'solo se permiten digitos',

                email: [
                    v => !!v || 'El Correo es Requerido',
                    v => /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test( v ) || 'indicar un email válido',
                    v => (v || '').length <= 80 || 'Maximo de caracteres permitidos 80',
                ],
                
                nit: [
                    v => !!v || 'El NIT es Requerido',
                    v => /(^[0-9]+-{1}[0-9]{1})/.test(v) || 'indicar un NIT válido Ej: 123123123-1',
                    v => (v || '').length <= 12 || 'Maximo de caracteres permitidos 12',
                ],

                email_confirmation: v => this.form.tx_email === v || 'Los correos no coinciden',
                
                image:  v => !v || v.size < 2000000 || 'Imagen debe tener menos de 2 MB!',
            
                coordinate: v => !v || v != 0 || 'Debe Seleccionar una Ubicacion',
                
                password: [
                    v => !!v || 'La Contraseña es Requerida',
                    v => !!v && v.length > 7 || 'La contraseña debe tener almenos 6 caracteres',
                    v => !!v && v.length <= 15 || 'La contraseña debe tener maximo 15 caracteres'
                ],

                password_confirmation: v => this.form.password === v || 'Las contraseñas no coinciden',

                minlength: len => value => (value || '').length >= len || `min caracteres requeridos ${len} actual ${value.length}`,

                maxlength: len => value => (value || '').length <= len || `max caracteres permitidos ${len} actual ${value.length}`,
                
                min: len => value => (value || '').length >= len || `min caracteres requeridos ${len} actual ${value.length}`,

                max: len => value => (value || '').length <= len || `max caracteres permitidos ${len} actual ${value.length}`,

                minNum: num => value => parseInt(value || 0) >= num || `valor minimo ${num}`,

                maxNum: num => value => parseInt(value || 0) <= num || `var maximo permitido ${num}`,

            }
        }
    },
}
