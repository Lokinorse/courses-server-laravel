<?php

namespace App\Http\Controllers;

use App\Unit;
use App\Transaction;
use App\User;
use Auth;
use Carbon\Carbon;

class PurchaseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($unit_id)
    {

        $unit = Unit::where("id", $unit_id)->first();
        $user = Auth::user();
        if (!$user || !$unit || $user->isUnitPurchased($unit_id) ) {
            abort(404);
        }

        if ($user->balance <  $unit->cost) {
            $modal = [
                "header" => "Недостаточно денег",
                "content" => "
                    Сейчас на счету у тебя " . $user->balance ." рублей. <br/> Для разблокировки курса требуется ". $unit->cost . " рублей.
                "
            ];
            return redirect("cabinet")->with("message_modal", json_encode($modal));
        }

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->promo_id = null;
        $transaction->description = "Разблокировка учебного юнита";
        $transaction->value = $unit->cost * -1;
        $transaction->status = 1;
        $transaction->target_id = $unit->id;
        $transaction->is_real = 1;
        $transaction->save();

        $modal = [
            "header" => "Успешно раблокирован курс!",
            "content" => 
                $unit->name. " успешно разблокирован.
                <br/>
                Теперь ты в любое время можешь получить к нему доступ к личном кабинете.
            ",
            "footer" => '
                <div class="actions-group pull-left">
                    <a class="modal-actions next-step" href="'.url($unit->slug).'">Пройти к обучению</a>
                </div>
            ',
        ];
        return redirect("cabinet")->with("message_modal", json_encode($modal));

    }
}
