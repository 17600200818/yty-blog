<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class SendEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:email';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '发送邮件';

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
        $sqlFile = getenv('APP_URL').'/backup/sqls/blog_'.date("Y-m-d").'.sql';
        $date = date("Y-m-d").'.sql';
        $view = 'emails.backupSql';
        $data = compact('sqlFile', 'date');
        $from = '865554919@qq.com';
        $name = 'blog';
        $to = '17600200818@163.com';
        $subject = 'blog数据库备份';

        Mail::send($view, $data, function ($message) use ($from, $name, $to, $subject) {
            $message->from($from, $name)->to($to)->subject($subject);
        });
    }
}
