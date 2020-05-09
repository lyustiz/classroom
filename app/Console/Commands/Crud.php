<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
 

class Crud extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'generate:crud {name?} {--active : poner activo} {--T|table= : tabla objetivo}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Genera un crud';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       // $connection = \DB::connection($database)->getDoctrineConnection();
        
        // $name = $this->ask('What is your name?');
        // $password = $this->secret('What is the password?');
        // $name = $this->choice('What is your name?', ['Taylor', 'Dayle'], 0);

       // $table = substr($table, strlen(\DB::getTablePrefix()));
       
       // $this->argument('name'). $this->option('table'). $name)
       dd(DB::connection());
       $this->info("TEST!".DB::connection());
        // if ($this->confirm('Do you wish to continue?')) {
        //     $this->error('Something went wrong!');
            
        // }
        
    }
}
