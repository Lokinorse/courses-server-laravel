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
use App\Plan;
use App\Program;
use Illuminate\Support\Facades\DB;
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
        //dd("TEST");
        Storage::disk('local')->put('error0.test',"ВОШЛИ");

        //dd("TEST");
        if (!$this->isRequestValidSHA1($req)) {
            Storage::disk('local')->put('error1.test',"INVALID SHA1");
            if (!$req->test_notification) return;
            
        }

        $transaction_info = $req->label;
        $transaction_info = explode("/", $transaction_info);
        if (count($transaction_info) != 3 ) return abort(404);
        //dd($transaction_info);
        Storage::disk('local')->put('error0.test',"0");
        $user_id = $transaction_info[0];
        $transaction_id = $transaction_info[1];
        $plan_id = $transaction_info[2];


        $user = User::find($user_id);
        if ($req->test_notification) {
            $user = User::find(1);
        }
        $trans = Transaction::find($transaction_id);
        $plan = Plan::find($plan_id);

        Storage::disk('local')->put('error2.test',"2");
        if (!$user) return "done";
        if (!$plan) return "done";
        if (!$trans || $trans->status == 1) return "done";

        if ($plan->discounted_cost != ceil($req->amount)) return "done";
        

        Storage::disk('local')->put('error3.test',"3");


        DB::beginTransaction();
        try {
            $trans->description = "Разблокировка пакета " . $plan->name;
            $trans->target_type = "plan";
            $trans->target_id = $plan->id;
            $trans->status = 1;
            $trans->is_real = 1;
            $trans->request_data = json_encode($req->all());
            $trans->value = ceil($req->amount);
            $trans->payed_at = new Carbon($req->datetime);
            

            $program = Program::find($plan->target_id);

            $first_course = $program->sortedCourses()->first();

            $first_course->unlock($user_id);

            //throw new \Exception("TEST");
            Storage::disk('local')->put('error3.test',"3");
            $trans->save();
        } catch (\Throwable $th) {
            //throw $th;
            Storage::disk('local')->put('error5.test',json_encode($th));
            //dd($th);
            DB::rollback();
        }


        DB::commit();

        Storage::disk('local')->put('errorCOMMITED.test',"COMMITED");

        //Storage::disk('local')->put('test.json',json_encode($trans));



        return "done";

    }

    
}