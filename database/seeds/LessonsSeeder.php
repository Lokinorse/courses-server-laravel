<?php

use Illuminate\Database\Seeder;
use App\Lesson;

class LessonsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Lesson::create([
            'name'           => 'Настройка среды.',
            'description'           => '<p>Привет! Я рад, что мы с тобой начнем обучение прямо сейчас. Для начала, нужно настроить все программы, без которых пройти курс будет невозможно.</p>
            <p>Для прохождения марафона нам потребуются:</p>
            <p>&nbsp;</p>
            <p>1) Браузер <strong>Google Chrome</strong> последней версии</p>
            <p>2) <strong>Sublime Text 3</strong>, скачанный с официального сайта.&nbsp;</p>
            <p>&nbsp;</p>
            <p>В этом уроке я покажу, как скачать и установить Chrome. Если он у тебя установлен, смело пропускай урок!</p>',
            'youtube_video_id'=> '2opL4LMmLvo',
            'lesson_type'           => 'video',
            'slug' => 'nastrojka-sredy-ustanovka-Google-Chrome',
            'unlocked' => 1,
            'completed' => 1,
            'short_description' => 'Пошаговая установка Google Chrome',
            'video' => '[{"download_link":"lessons\\May2019\\QA1f63mOx0vBiCYE4EQ6.mp4","original_name":"[\u041d\u0410\u0421\u0422\u0420\u041e\u0419\u041a\u0410 \u0421\u0420\u0415\u0414\u042b] \u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 Google Chrome.mp4"}]'
        ]);
    }
}
