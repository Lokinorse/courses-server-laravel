<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLessonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lessons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();
            $table->string('name')->collation('utf8mb4_unicode_ci');
            $table->longText('description')->collation('utf8mb4_unicode_ci')->nullable();
            $table->string('youtube_video_id')->collation('utf8mb4_unicode_ci');
            $table->longText('lesson_type')->collation('utf8mb4_unicode_ci')->nullable();
            $table->string('slug')->collation('utf8mb4_unicode_ci')->nullable();
            $table->tinyInteger('unlocked')->default(0);
            $table->tinyInteger('completed')->default(1);
            $table->integer('test_id')->default(0)->nullable();
            $table->integer('practice_id')->default(0)->nullable();
            $table->text('short_description')->collation('utf8mb4_unicode_ci')->nullable();
            $table->text('video')->collation('utf8mb4_unicode_ci')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lessons');
    }
}
