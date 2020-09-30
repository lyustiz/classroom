const CACHE_STATIC  = 'virtualin-static-1.0';
const CACHE_DYNAMIC = 'virtualin-dynamic-1.0';


let urlsToCache = [
    '/',
    '/css/main.css',
    '/mix-manifest.json'
  ];

//instalacion del service worker
// apertura de la cache y almacenado de archivos
self.addEventListener('install', (eventInstall) => {

    //cacheo los elementos principales de la pagina 
    let cacheStatic = caches.open(CACHE_STATIC)
    .then( (cache)=>{

        return cache.addAll(urlsToCache);
    })
    .catch( (err) =>{
        
        console.log('Cache error:', err);
    })
    
    eventInstall.waitUntil(cacheStatic);

})

// interceptar todas las peticiones
self.addEventListener('fetch', (eventFetch)=> {

    //verificar que todas las peticiones estan en la cache
    let dataResponse = caches.match(eventFetch.request)
    .then( (response) => { 
        
        //si estan en la cache las devuelvo sin pedirlas
        if(response)
        {
            return response;
        }

        //sino busco los recursos en la web
        //return fetch(eventFetch.request)
        return fetch(eventFetch.request)
        .then( (newRequest) => {

            caches.open(CACHE_DYNAMIC)
            .then( (cache)=> {
                // coloco todo los objetos en la cache dinamica
                //if(eventFetch.request.url.includes('.css'))
                
                cache.put(eventFetch.request, newRequest);
            })

            //clono el request para el siguiente fetch
            return newRequest.clone()
        })
    })

    // responde con los objetos en cache o los remotos
    eventFetch.respondWith(dataResponse);

})
