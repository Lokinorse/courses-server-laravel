<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\Program;

class ProgramSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            Program::create([
                'name'           => 'Программа «JS-разработчик с нуля!»',
                'description'           => 'В программе ты поймешь, какую роль имеет Javascript в современном веб. Научишься верстать сайты, познав HTML и CSS. Окунешься в мир серверного программирования и поймешь, как создавать собственные сервисы и платформы, используя только Javascript',
                'thumb'           => '1/ZrIYmtmdXt.png',
                'cost'          => 20000,
                'slug' => 'js-razrabotchik',
            ]);
    }
}
