<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePromosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('promos', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('name')->nullable();
			$table->timestamps();
			$table->integer('value')->nullable();
			$table->dateTime('actual_to')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('promos');
	}

}
