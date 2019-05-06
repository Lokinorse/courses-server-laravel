<?php

namespace App;


use App\UserCoursesProgress;
use App\UserLessonsProgress;


use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends \TCG\Voyager\Models\User implements MustVerifyEmail
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
        'password',
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

    public function isProgramPurchased($program_id)
    {
        $all_program_plans = Plan::where('target_id', $program_id)->where('target_type', 'program')->get();

        if ($all_program_plans->count() == 0) return false;

        $plan_ids = $all_program_plans->map(function($plan) {return $plan->id;});



        $programPurchased = $this->transactions()
            ->whereIn('target_id', $plan_ids)
            ->where("target_type", "plan")
            ->where('status', 1)
            ->first();

        return !!$programPurchased;
    }

    public function getBalanceAttribute()
    {
        return $this->transactions()->where("status", 1)->get()->sum('value');
    }

    public function getNameAttribute()
    {
        return $this->first_name . ' ' . $this->last_name;
    }
    public function getFallbackAva()
    {
        if ($this->avatar == "users/default.png") return asset("img/users/user-placeholder.png"); 
        return $this->avatar;
    }
    /*     public function getCurrentLesson($program_id)
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
    } */

    public function coursesProgress()
    {
        return UserCoursesProgress::where("user_id", $this->id);
    }

    public function lessonsProgress()
    {
        return UserLessonsProgress::where("user_id", $this->id);
    }

    public function hasCommunityAccess() {
        return !!$this->transactions()->where("status", 1)->where("target_type", "plan")->where('is_real', 1)->first();
    }


}
