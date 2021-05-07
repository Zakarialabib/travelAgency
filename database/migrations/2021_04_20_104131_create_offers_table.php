<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offers', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('user_id')->nullable();
            $table->string('reference')->nullable();
			$table->integer('category_id')->unsigned()->nullable();
            $table->integer('city_id')->unsigned()->nullable();
			$table->string('name')->nullable();
			$table->string('slug')->nullable();
			$table->text('description')->nullable();
			$table->float('price', 10, 0)->nullable();
			$table->string('address')->nullable();
			$table->string('thumb')->nullable();
			$table->text('gallery')->nullable();
			$table->text('itinerary')->nullable();
			$table->integer('status')->nullable()->default(1);
			$table->string('seo_title')->nullable();
			$table->string('seo_description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('offers');
    }
}
