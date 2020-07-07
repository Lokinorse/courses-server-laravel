<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTestAnswersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('test_answers', function(Blueprint $table)
		{
			$table->increments('id');
			$table->boolean('type')->default(0);
			$table->string('name')->nullable();
			$table->integer('question_id');
			$table->boolean('order')->nullable();
			$table->timestamps();
			$table->boolean('is_right')->nullable()->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('test_answers');
	}

}
