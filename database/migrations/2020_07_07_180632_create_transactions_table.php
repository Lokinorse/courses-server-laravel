<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTransactionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('transactions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id')->nullable();
			$table->timestamps();
			$table->text('description')->nullable();
			$table->integer('value')->nullable();
			$table->smallInteger('promo_id')->nullable();
			$table->integer('target_id')->nullable();
			$table->softDeletes();
			$table->boolean('status')->nullable()->default(0);
			$table->boolean('is_real')->nullable()->default(0);
			$table->string('target_type')->nullable()->default('program');
			$table->dateTime('payed_at')->nullable();
			$table->text('request_data')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('transactions');
	}

}
