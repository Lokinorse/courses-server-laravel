<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (User::count() == 0) {
            $role = Role::where('name', 'admin')->firstOrFail();

            User::create([
                'name'           => 'Антон Платонов',
                'first_name'           => 'Антон',
                'last_name'           => 'Платонов',
                'email'          => 'tonyplato@yandex.ru',

                'provider'           => 'vkontakte',
                'provider_user_id'       => '46973575',
                'provider_user_token'       => 'd9c22f1eeb0f738c91ac1bd10fa5845bc01d3902b35d13e48738192e988ef05268830fec7b86cdda94b88',

                'remember_token' => Str::random(60),
                'role_id'        => $role->id,
            ]);
        }
    }
}
