<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plans', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('target_id');
            $table->timestamps();
            $table->string('target_type')->collation('utf8mb4_unicode_ci');
            $table->string('cost')->default(0)->nullable();
            $table->text('description')->collation('utf8mb4_unicode_ci')->nullable();
            $table->tinyInteger('recommended')->default(0)->nullable();
            $table->tinyInteger('discount');
            $table->string('name')->collation('utf8mb4_unicode_ci')->nullable();
            $table->string('conversion_tag')->collation('utf8mb4_unicode_ci')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('plans');
    }
}
