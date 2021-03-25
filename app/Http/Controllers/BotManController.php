<?php

namespace App\Http\Controllers;

use BotMan\BotMan\BotMan;
use App\Http\Conversations\OnboardingConversation;

class BotManController extends Controller
{
    /**
     * Place your BotMan logic here.
     */
    public function handle()
    {
        $botman = app('botman');
$botman->verifyServices('MY_SECRET_VERIFICATION_TOKEN');

// ...
$botman->hears('foo', function($bot){});
$botman->listen();
    }

   
    /**
     * Loaded through routes/botman.php.
     *
     * @param BotMan $bot
     */
    public function startConversation(BotMan $bot)
    {
        $bot->startConversation(new OnboardingConversation());
    }
}
