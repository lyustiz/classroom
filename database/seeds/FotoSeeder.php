<?php

use Illuminate\Database\Seeder;

class FotoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Models\Foto::class, 100)->create();

        //// php artisan db:seed --class=FotoSeeder
    }
}
