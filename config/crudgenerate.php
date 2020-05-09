<?php

return [

    'paths' => [
        'models'      => 'Models/',
        'controllers' => 'Http/Controllers/',
        'views'       => 'resources/js/pages/',
        'routes'      => 'resources/js/router/index.js',
        'apis'        => 'routes/api.php',
        'templates'   => 'resources/templates/'
    ],

    'cols' => [
        'createdAt'   => '',
        'updatedAt'   => '',
        'hiddenCols'  => ['created_at', 'updated_at']
    ],

    'actions' => [
        'index', 'show', 'store', 'edit', 'update', 'destroy'
    ]
];