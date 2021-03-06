<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. The "local" disk, as well as a variety of cloud
    | based disks are available to your application. Just store away!
    |
    */

    'default' => env('FILESYSTEM_DRIVER', 'local'),

    /*
    |--------------------------------------------------------------------------
    | Default Cloud Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Many applications store files both locally and in the cloud. For this
    | reason, you may specify a default "cloud" driver here. This driver
    | will be bound as the Cloud disk implementation in the container.
    |
    */

    'cloud' => env('FILESYSTEM_CLOUD', 's3'),

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    | Supported Drivers: "local", "ftp", "sftp", "s3"
    |
    */

    'disks' => [

        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
        ],

        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'/storage',
            'visibility' => 'public',
        ],

        'foto' => [
            'driver' => 'local',
            'root' => storage_path('app/public/foto'),
            'url' => env('APP_URL').'/storage/foto',
            'visibility' => 'public',
        ],

        'detallePlan' => [
            'driver' => 'local',
            'root' => storage_path('app/public/detallePlan'),
            'url' => env('APP_URL').'/storage/detallePlan',
            'visibility' => 'public',
        ],

        'evaluacion' => [
            'driver' => 'local',
            'root' => storage_path('app/public/evaluacion'),
            'url' => env('APP_URL').'/storage/evaluacion',
            'visibility' => 'public',
        ],

        'grado' => [
            'driver' => 'local',
            'root' => storage_path('app/public/grado'),
            'url' => env('APP_URL').'/storage/grado',
            'visibility' => 'public',
        ],

        'grupo' => [
            'driver' => 'local',
            'root' => storage_path('app/public/grupo'),
            'url' => env('APP_URL').'/storage/grupo',
            'visibility' => 'public',
        ],

        'alumno' => [
            'driver' => 'local',
            'root' => storage_path('app/public/alumno'),
            'url' => env('APP_URL').'/storage/alumno',
            'visibility' => 'public',
        ],

        'docente' => [
            'driver' => 'local',
            'root' => storage_path('app/public/docente'),
            'url' => env('APP_URL').'/storage/docente',
            'visibility' => 'public',
        ],

        'colegio' => [
            'driver' => 'local',
            'root' => storage_path('app/public/colegio'),
            'url' => env('APP_URL').'/storage/colegio',
            'visibility' => 'public',
        ],

        'recurso-audio' => [
            'driver' => 'local',
            'root' => storage_path('app/public/recurso/audio'),
            'url' => env('APP_URL').'/storage/recurso/audio',
            'visibility' => 'public',
        ],

        'recurso-video' => [
            'driver' => 'local',
            'root' => storage_path('app/public/recurso/video'),
            'url' => env('APP_URL').'/storage/recurso/video',
            'visibility' => 'public',
        ],

        'recurso-guia' => [
            'driver' => 'local',
            'root' => storage_path('app/public/recurso/guia'),
            'url' => env('APP_URL').'/storage/recurso/guia',
            'visibility' => 'public',
        ],

        'recurso-libro' => [
            'driver' => 'local',
            'root' => storage_path('app/public/recurso/libro'),
            'url' => env('APP_URL').'/storage/libro',
            'visibility' => 'public',
        ],

        'libro' => [
            'driver' => 'local',
            'root' => storage_path('app/public/libro'),
            'url' => env('APP_URL').'/storage/libro',
            'visibility' => 'public',
        ],

        'tarea' => [
            'driver' => 'local',
            'root' => storage_path('app/public/tarea'),
            'url' => env('APP_URL').'/storage/tarea',
            'visibility' => 'public',
        ],

        'tarea-alumno' => [
            'driver' => 'local',
            'root' => storage_path('app/public/tarea/alumno'),
            'url' => env('APP_URL').'/storage/tarea/alumno',
            'visibility' => 'public',
        ],
        
        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'/storage',
            'visibility' => 'public',
        ],

        's3' => [
            'driver' => 's3',
            'key' => env('AWS_ACCESS_KEY_ID'),
            'secret' => env('AWS_SECRET_ACCESS_KEY'),
            'region' => env('AWS_DEFAULT_REGION'),
            'bucket' => env('AWS_BUCKET'),
            'url' => env('AWS_URL'),
        ],

    ],

    /*
    |--------------------------------------------------------------------------
    | Symbolic Links
    |--------------------------------------------------------------------------
    |
    | Here you may configure the symbolic links that will be created when the
    | `storage:link` Artisan command is executed. The array keys should be
    | the locations of the links and the values should be their targets.
    |
    */

    'links' => [
        public_path('storage') => storage_path('app/public'),
    ],

];
