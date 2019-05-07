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
use Carbon\Carbon;
use App\Transaction;
use Illuminate\Support\Facades\Storage;
use function GuzzleHttp\json_encode;

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

    public function isRequestValidSHA1($req) {
        $notification_secret = "eBIyu47vBjD3dw/G8Y6HFCZz";
        $notification_type = $req->notification_type;
        $operation_id = $req->operation_id;
        $amount = $req->amount;
        $currency = $req->currency;
        $datetime = $req->datetime;
        $sender = $req->sender;
        $codepro = $req->codepro;
        $label = $req->label;
        $request_original_sha = $req->sha1_hash;
        $calculated_sha = $notification_type."&".$operation_id."&".$amount."&".$currency."&".$datetime."&".$sender."&".$codepro."&".$notification_secret."&".$label;
        $calculated_sha = hash("sha1", $calculated_sha);
        
        return $request_original_sha === $calculated_sha;
    }
    
    public function yandexMoneyProviderCallback(Request $req)
    {
                        
/*         $trans = Transaction::find(56);
        $trans->status = 1;
        $trans->is_real = 1;
        $trans->is_real = 1;
        $trans->value = $req->amount;
        $trans->payed_at = new Carbon($req->datetime);
        Storage::disk('local')->put('test.json',json_encode($trans));
        $trans->save(); */


        ////////////////////////////////////////////////////

        if (!$this->isRequestValidSHA1($req)) return;
        
        $id = $req->label;

        
        if ($req->test_notification) {
            $user = User::find(1);
            $id =  $user->transactions()->get()->last()->id;
        }

        
        $trans = Transaction::find($id);
        if (!$trans || $trans->status == 1) return "done";
        $trans->status = 1;
        $trans->is_real = 1;
        $trans->request_data = json_encode($req->all());
        $trans->value = ceil($req->amount);
        $trans->payed_at = new Carbon($req->datetime);
        Storage::disk('local')->put('test.json',json_encode($trans));
        $trans->save();
/* 
        {
            "notification_type": "p2p-incoming",
            "amount": "963.73",
            "datetime": "2019-05-06T23:55:56Z",
            "codepro": "false",
            "sender": "41001000040",
            "sha1_hash": "c12f486dd7444863be68bf9f81c028d18a700bbc",
            "test_notification": "true",
            "operation_label": null,
            "operation_id": "test-notification",
            "currency": "643",
            "label": null
        }
         */

        //notification_type&operation_id&amount&currency&datetime&sender&codepro&notification_secret&label


        //return abort(404);
        //Storage::disk('local')->put('test.json',"VALID!");

        return "done";

    }

    
}