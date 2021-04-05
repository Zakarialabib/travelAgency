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
			$table->integer('price_range')->nullable();
			$table->float('price', 10, 0)->nullable();
			$table->string('amenities')->nullable()->default('');
			$table->string('address')->nullable();
			$table->float('lat', 10, 0)->nullable();
			$table->float('lng', 10, 0)->nullable();
			$table->string('email')->nullable();
			$table->string('phone_number')->nullable();
			$table->string('website')->nullable();
			$table->string('social', 500)->nullable()->default('')->comment('array');
			$table->string('opening_hour', 500)->nullable();
			$table->date('date')->nullable();
			$table->string('thumb')->nullable();
			$table->text('gallery')->nullable();
			$table->text('menu')->nullable();
			$table->text('itinerary')->nullable();
			$table->string('video')->nullable();
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
