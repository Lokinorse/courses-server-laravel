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
		Schema::create('lessons_', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->timestamps();
			$table->string('name', 191);
			$table->text('description')->nullable();
			$table->text('slug')->nullable();
			$table->boolean('unlocked')->default(0);
			$table->boolean('completed')->default(1);
			$table->integer('test_id')->nullable();
			$table->string('youtube_video_id', 200)->nullable();
			$table->string('lesson_type', 20)->default('video');
			$table->integer('practice_id')->nullable();
			$table->text('short_description')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('lessons_');
	}

}
