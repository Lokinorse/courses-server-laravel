<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUdemyObjectsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('udemy_objects', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('type')->nullable();
			$table->integer('udemy_id')->nullable();
			$table->text('title')->nullable();
			$table->timestamps();
			$table->integer('object_index')->nullable();
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
		Schema::drop('udemy_objects');
	}

}
