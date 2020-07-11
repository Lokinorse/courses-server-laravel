<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('programs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();
            $table->string('name')->collation('utf8mb4_unicode_ci')->default(0)->nullable();
            $table->text('description')->collation('utf8mb4_unicode_ci');
            $table->text('thumb')->collation('utf8mb4_unicode_ci')->nullable();
            $table->smallInteger('cost')->default(0)->nullable();
            $table->string('slug')->collation('utf8mb4_unicode_ci')->default(0)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('programs');
    }
}
