<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTestQuestionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('test_questions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('order')->default(0);
			$table->string('name');
			$table->timestamps();
			$table->integer('lesson_id')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('test_questions');
	}

}
