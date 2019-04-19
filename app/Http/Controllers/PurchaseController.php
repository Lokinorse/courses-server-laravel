<?php

namespace App\Http\Controllers;

use App\Program;
use App\Transaction;
use App\UserProgress;
use App\User;
use Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($program_id)
    {

        $program = Program::find($program_id);
        $user = Auth::user();
        if (!$user || !$program || $user->isProgramPurchased($program_id) ) {
            abort(404);
        }
        //dd("TEST");

        if ($user->balance <  $program->cost) {
            $modal = [
                "header" => "Недостаточно денег",
                "content" => "
                    Сейчас на счету у тебя " . $user->balance ." рублей. <br/> Для разблокировки курса требуется ". $program->cost . " рублей.
                "
            ];
            return redirect("cabinet")->with("message_modal", json_encode($modal));
        }
        
        DB::beginTransaction();
        try {
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->promo_id = null;
            $transaction->description = "Разблокировка учебного юнита";
            $transaction->value = $program->cost * -1;
            $transaction->status = 1;
            $transaction->target_id = $program->id;
            $transaction->target_type = 'program';
            $transaction->is_real = 1;
            $transaction->save();
            
            $first_course = $program->sortedCourses()->first();

            $first_course->unlock();

            //throw new \Exception("TEST");

        } catch (\Throwable $th) {
            //throw $th;
            dd($th);
            DB::rollback();
        }


        DB::commit();



        $modal = [
            "header" => "Успех!",
            "content" => 
                $program->name. " успешно разблокирована.
                <br/>
                Теперь ты в любое время можешь получить к нему доступ к личном кабинете.
            ",
            "footer" => '
                <div class="actions-group pull-left">
                    <a class="main-button" href="'.url($program->slug . '/' . $first_course->slug).'">Пройти к обучению</a>
                </div>
            ',
        ];
        return redirect("cabinet")->with("message_modal", json_encode($modal));

    }
}
