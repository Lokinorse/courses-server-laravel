<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Utils\VkCommunityApi;
use App\User;


class BotController extends Controller
{

    public function process(Request $request)
    {
        $secret = $request->secret;
        if ($secret != env('VKONTAKTE_BOT_SECRET')) {
            return "invalid";
        }

        $type = $request->input("type");
        if ($type == "confirmation") {
            return env('VKONTAKTE_BOT_VERIFICATION');
        }

        $object = null;
        if ($request->input("object")) {
            $object = $request->input("object");
        }
        if (!$object) {
            return "ok";
        }

        $provider_id = null;
        if (isset($object["from_id"])) {
            $provider_id = $object["from_id"];
        }

        if (isset($object["user_id"])) {
            $provider_id = $object["user_id"];
        }

        if (!$provider_id) {
            return "ok";
        }

        switch ($type) {
            case 'message_allow':
                return "ok";
                break;
            case 'message_new':
                $message = trim(mb_strtolower($object["text"]));
                if ($this->promomessage($message, $provider_id)) return "ok";

                return "ok";
                break;
        }
        return 'ok';
    }


    public function promomessage($message, $user_id) {
        //dd(strpos($message, "поехали"));
/*         if (
            strpos($message, "начать") === false 
            && strpos($message, "поехали") === false 
            && strpos($message, "го") === false 
            && strpos($message, "готов") === false
            && strpos($message, "привет") === false
            && strpos($message, "вперед") === false
            && strpos($message, "погнали") === false
        ) return false; */


        $user = User::where('provider_user_id', $user_id)->first();
        if (!$user) return false;
        if ($user->isPromoUsed(env("CURRENT_PROMO_ID"))) return false;

        $url = env("APP_URL")."promo/".env("CURRENT_PROMO_ID")."/".$user_id;
        $promoMessage = "Привет! Вот активационная ссылка для  активации курса! \nСюда в чат будут присылаться оповещения от платформы обучающей с вебинарами и полезной информацией. Платформа тесно интегрирована с VK, поэтому не советую отписываться. \n\n ".$url;


        $vk = new VkCommunityApi();
        $vk->vkApi_messagesSend($user_id,  $promoMessage, array());
        return true;
    } 

}
