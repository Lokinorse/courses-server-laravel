<?php

use Illuminate\Database\Seeder;
use App\Plan;
class PlansSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Plan::create([
            'target_type'           => 'program',
            'target_id' => 1,
            'cost'           => 870,
            'description' => '<ul style="font-family: "Exo 2", sans-serif; padding: 0px 26px; margin: 0px 0px 34px; box-sizing: border-box; display: flex; list-style: none; flex-direction: column; color: #000000; font-size: medium;">
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все лекции из курса</li>
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все видео из курса</li>
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Домашние задания</li>
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Безвременный доступ к урокам</li>
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Доступ к сообществу</li>
            <li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Интерактивные тесты</li>
            </ul>',
            'recommended' => 0,
            'discount' => 0,
            'name' => 'Стартовый',
            'conversion_tag' => 'tarif-ya-sam',

        ]);
    }
}
