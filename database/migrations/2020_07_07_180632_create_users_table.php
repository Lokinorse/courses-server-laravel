<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->increments('id');
			$table->bigInteger('role_id')->unsigned()->nullable()->index('users_role_id_foreign');
			$table->string('first_name', 191)->default('');
			$table->string('last_name', 191)->default('');
			$table->string('email', 191)->nullable()->unique();
			$table->dateTime('email_verified_at')->nullable();
			$table->string('password', 191)->nullable();
			$table->string('api_token', 60)->nullable()->unique();
			$table->string('provider', 191)->nullable()->default('vkontakte');
			$table->string('provider_user_id', 191)->nullable();
			$table->string('provider_user_token', 191)->nullable()->default('');
			$table->string('avatar', 191)->nullable();
			$table->string('remember_token', 100)->nullable();
			$table->text('settings', 65535)->nullable();
			$table->timestamps();
			$table->integer('udemy_id')->nullable();
			$table->boolean('faked')->nullable();
			$table->string('bdate')->nullable();
			$table->boolean('is_used')->nullable()->default(1);
			$table->string('name')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
