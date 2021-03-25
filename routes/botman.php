<?php

use App\Http\Controllers\BotManController;
use BotMan\BotMan\Drivers\DriverManager;

DriverManager::loadDriver(\BotMan\Drivers\Web\WebDriver::class);

$botman = resolve('botman');

$botman->hears('.*(Hi|Hello).*', BotManController::class.'@startConversation');

//custom payloads
$botman->hears('GET_STARTED', function ($bot) {
	$bot->reply('Welcome to sawanshop chatbot, Please choose message type from the menu :)');
});
$botman->hears('QUICK_PAYLOAD', BotManController::class.'@quickReply');
$botman->hears('LIST_PAYLOAD', BotManController::class.'@listTemplate');
$botman->hears('GENERIC_PAYLOAD', BotManController::class.'@genericTemplate');
$botman->hears('MEDIA_PAYLOAD', BotManController::class.'@mediaTemplate');