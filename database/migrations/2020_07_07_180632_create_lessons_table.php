<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateLessonsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('lessons', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->timestamps();
			$table->string('name', 191);
			$table->text('description')->nullable();
			$table->string('youtube_video_id', 191)->nullable();
			$table->text('lesson_type')->nullable();
			$table->text('slug')->nullable();
			$table->boolean('unlocked')->default(0);
			$table->boolean('completed')->default(1);
			$table->integer('test_id')->nullable();
			$table->integer('practice_id')->nullable();
			$table->string('short_description')->nullable();
			$table->text('video', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('lessons');
	}

}
