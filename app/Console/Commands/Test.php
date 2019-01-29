<?php

namespace App\Console\Commands;

use Doctrine\DBAL\Tools\Console\Command\ReservedWordsCommand;
use Illuminate\Console\Command;
use Workerman\Worker;

class Test extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test {arg} {--d}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
        global $argv;
        global $globalUid;
        global $worker;
        $arg=$this->argument();
        $argv[1]=$arg['arg'];
        $argv[2] = $this->option('d') ? '-d' : '';

        $worker = new Worker("text://0.0.0.0:2347");
        $worker->count = 1;
        $worker->onConnect = function ($connection) {
            global $globalUid,$worker;
            var_dump(count($worker->connections));
            var_dump($connection->id);
            $connection->uid = ++$globalUid;
//            foreach ($worker->connections as $con) {
//                $con->send('user'.$connection->uid.'进入');
//            }
        };
        $worker->onMessage = function ($connection, $data) {
            global $worker;

            foreach ($worker->connections as $con) {
                $con->send('user'.$connection->uid.':'.$data);
            }
        };
        $worker->onClose = function ($connection) {
            global $worker;
            foreach ($worker->connections as $con) {
                $con->send('user'.$connection->uid.'离开');
            }
        };

        Worker::runAll();
    }

    public function TextTest()
    {

    }

    public function httpTest()
    {
        $worker = new Worker("http://0.0.0.0:2345");
        $worker->count = 4;
        $worker->onMessage = function ($connection, $data) {
            var_dump($data);
            $connection->send('hello word');
        };
    }
}
