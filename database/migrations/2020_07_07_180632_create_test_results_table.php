<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTestResultsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('test_results', function(Blueprint $table)
		{
			$table->increments('id');
			$table->timestamps();
			$table->integer('lesson_id');
			$table->integer('user_id');
			$table->text('json_answers', 65535)->nullable();
			$table->boolean('mistakes')->nullable();
			$table->boolean('is_passed')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('test_results');
	}

}
