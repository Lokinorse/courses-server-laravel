<?php

namespace App;

use Illuminate\Notifications\Notifiable;

class User extends \TCG\Voyager\Models\User
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'provider',
        'provider_user_id',
        'provider_user_token',
        'nickname',
        'name',
        'avatar',
        'email',
        'first_name',
        'last_name',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function progress()
    {
        return $this->belongsToMany('App\Unit', 'user_progress', 'user_id', 'unit_id');
    }

    public function transactions()
    {
        return $this->hasMany('App\Transaction');
    }

    public function isPromoUsed($promo_id)
    {
        $usedPromo = $this->transactions()->where('status', 1)->where("promo_id", $promo_id)->first();
        return !!$usedPromo;
    }

    public function isUnitPurchased($unit_id)
    {
        $unitPurchased = $this->transactions()->where('status', 1)->where("target_id", $unit_id)->first();
        return !!$unitPurchased;
    }

    public function getBalanceAttribute()
    {
        return $this->transactions()->where("status", 1)->get()->sum('value');
    }

    public function getCurrentLesson($program_id)
    {
        $program = Unit::where("id", $program_id)->first();
        $progress = $this->progress()->withPivot("status")->get();

        $currentLesson = $progress->first(function($unit) {
            return $unit->pivot->status == 0;
        });
        if (!$currentLesson) {
            $currentLesson = $program->getLessons()->first();
        }
        return $currentLesson;
    }

}
