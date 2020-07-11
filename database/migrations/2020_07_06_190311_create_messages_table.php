<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->bigIncrements('id')->nullable(false);
            $table->integer('target_id')->nullable(false);
            $table->string('destination_type')->nullable(false)->collation('utf8mb4_unicode_ci');
            $table->integer('parent_id')->default(0)->nullable(false);
            $table->text('text')->collation('utf8mb4_unicode_ci')->nullable(false);
            $table->softDeletes('udemy_created_at', 0);
            $table->integer('user_id')->nullable(false)->change();
            $table->tinyInteger('important')->default(0)->nullable();
            $table->tinyInteger('right')->default(0)->nullable();
            $table->string('message_type', 30)->collation('utf8mb4_unicode_ci');
            $table->integer('replies_count')->default(0)->nullable();
            $table->mediumText('title')->collation('utf8mb4_unicode_ci');
            $table->longText('udemy_text')->collation('utf8mb4_unicode_ci');
            $table->integer('udemy_id')->default(0)->nullable();
            $table->mediumText('udemy_title')->nullable()->collation('utf8mb4_unicode_ci');
            $table->integer('related_udemy_object_id')->default(0)->nullable();

            //Adds nullable created_at and updated_at TIMESTAMP equivalent columns with precision (total digits):
            $table->timestamps(0);
            //
            $table->tinyInteger('approved')->default(0)->nullable();
            $table->softDeletes('deleted_at', 0);
            $table->longText('slug')->collation('utf8mb4_unicode_ci');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('messages');
    }
}
