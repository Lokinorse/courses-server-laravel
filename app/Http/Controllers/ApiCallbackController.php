<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
use Socialite;
use App\User;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\Auth\LoginController;
class ApiCallbackController extends Controller
{
    public function handleProviderCallback(Request $req, $provider)
    {
        if ($req->input("state")) {
            $actionPayload = json_decode($req->input("state"));
            switch(isset($actionPayload) && $actionPayload->action) {
                case "connect_group":
                    $pjc = new ProjectController();
                    return $pjc->finishConnect($req, $actionPayload);
            }
        }
        $loginController = new LoginController();
        return $loginController->loginProviderCallback($req, $provider);
    }


    public function yandexMoneyProviderCallback(Request $req)
    {
        return "done";
        return $loginController->loginProviderCallback($req, $provider);
    }

    
}