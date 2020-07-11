<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMessagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('messages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('target_id');
			$table->string('destination_type', 15);
			$table->integer('parent_id')->default(0);
			$table->text('text', 65535);
			$table->dateTime('udemy_created_at')->nullable();
			$table->timestamps();
			$table->integer('user_id');
			$table->boolean('important')->nullable();
			$table->boolean('right')->nullable();
			$table->string('message_type', 30)->default('comment');
			$table->integer('replies_count')->nullable();
			$table->text('title', 16777215)->nullable();
			$table->text('udemy_text')->nullable();
			$table->integer('udemy_id')->nullable();
			$table->text('udemy_title', 16777215)->nullable();
			$table->integer('related_udemy_object_id')->nullable();
			$table->boolean('approved')->nullable()->default(0);
			$table->softDeletes();
			$table->text('slug')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('messages');
	}

}
