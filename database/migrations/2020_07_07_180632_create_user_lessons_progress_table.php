<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUserLessonsProgressTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('user_lessons_progress', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('lesson_id');
			$table->timestamps();
			$table->integer('user_id');
			$table->integer('status')->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('user_lessons_progress');
	}

}
