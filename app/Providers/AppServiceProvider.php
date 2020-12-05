<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Eloquent\Relations\Relation;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->isLocal()) {
            $this->app->register(\Laravel\Telescope\TelescopeServiceProvider::class);
            $this->app->register(TelescopeServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        Relation::morphMap([
            //Asignaciones
            'actividad'       => 'App\Models\Actividad',
            'enlace'          => 'App\Models\Enlace',
            'recurso'         => 'App\Models\Recurso',
            'libro'           => 'App\Models\Libro',
            'tipo_asignacion' => 'App\Models\TipoAsignacion',
            //Evaluaciones
            'prueba'          => 'App\Models\Prueba',
            'tarea'           => 'App\Models\Tarea',
            'rasgo'           => 'App\Models\Rasgo',
            'tipo_evaluacion' => 'App\Models\TipoEvaluacion',
        ]);
    }
}
