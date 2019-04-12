<?php

namespace App\Http\Controllers;

use App\User;
use App\Promo;
use App\Transaction;
use Carbon\Carbon;


class PromoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($promo_id, $vk_user_id)
    {
        $promo = Promo::where("id", $promo_id)->where('actual_to', ">", Carbon::now())->first();

        if (!$promo) {
            abort(404);
        }


        $user = User::where('provider_user_id', $vk_user_id)->first();
        if (!$user || $user->isPromoUsed($promo_id)) {
            abort(404);
        }



        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->promo_id = $promo->id;
        $transaction->description = "Зачисление с промокода";
        $transaction->value = $promo->value;
        $transaction->status = 1;
        $transaction->target_id = null;
        $transaction->is_real = 0;
        $transaction->save();


        $modal = [
            "header" => "На счет зачислено 20 000 рублей!",
            "content" => "
                Можно приступать к обучению. 
                <br/> 
                Осталось приобрести на полученные бонусы курс и в бой! 
                <br/> 
                <span>Тебе хватит денег, чтобы <b>оплатить его полностью</b>. </span>
                <br/> 
                <b>Скоро увидимся и удачи на курсе!</b>
            "
        ];
        return redirect("cabinet")->with("message_modal" , json_encode($modal));
        


    }
}
