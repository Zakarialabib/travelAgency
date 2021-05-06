<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePlacesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('places', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id')->nullable();
			$table->integer('country_id')->nullable();
			$table->integer('city_id')->nullable();
			$table->string('category')->nullable();
			$table->string('place_type')->nullable();
			$table->string('name')->nullable();
			$table->string('slug')->nullable();
			$table->text('description')->nullable();
			$table->float('price', 10, 0)->nullable();
			$table->string('amenities')->nullable()->default('');
			$table->string('address')->nullable();
			$table->float('lat', 10, 0)->nullable();
			$table->float('lng', 10, 0)->nullable();
			$table->string('thumb')->nullable();
			$table->text('gallery')->nullable();
			$table->text('itinerary')->nullable();
			$table->integer('booking_type')->nullable();
			$table->string('link_bookingcom')->nullable();
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
		Schema::drop('places');
	}

}
