<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePlansTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('plans', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('target_id');
			$table->timestamps();
			$table->string('target_type')->default('program');
			$table->integer('cost')->nullable();
			$table->text('description', 65535)->nullable();
			$table->boolean('recommended')->nullable();
			$table->boolean('discount');
			$table->string('name')->nullable();
			$table->string('conversion_tag')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('plans');
	}

}
