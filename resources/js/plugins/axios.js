window.axios = require('axios');

let apiToken = `Bearer ${localStorage.getItem("token")}`
            
window.axios.defaults.headers.common['Authorization']= apiToken

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

let token = document.head.querySelector('meta[name="csrf-token"]');

if (token)
{
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
}
else
{
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}
