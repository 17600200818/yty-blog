<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class BackupSql extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup:sql';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '备份blog数据库';

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
        //从配置文件中获取数据库信息
        $DB_HOST = getenv('DB_HOST');
        $DB_DATABASE = getenv('DB_DATABASE');
        $DB_USERNAME = getenv('DB_USERNAME');
        $DB_PASSWORD = getenv('DB_PASSWORD');
        $dumpfname = public_path('backup/sqls/'.$DB_DATABASE . "_" . date("Y-m-d").".sql");
        $command = "mysqldump --host=$DB_HOST --user=$DB_USERNAME ";
        if ($DB_PASSWORD) $command.= "--password=". $DB_PASSWORD ." ";
        $command.= $DB_DATABASE;
        $command.= " > " . $dumpfname;
        system($command);
    }
}
