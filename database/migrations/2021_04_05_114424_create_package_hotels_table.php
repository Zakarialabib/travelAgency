<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePackageHotelsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('package_hotels', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id')->nullable();
			$table->string('hotel_name', 191)->nullable();
			$table->text('address')->nullable();
			$table->integer('hotel_star_rating')->nullable();
			$table->string('hotel_location', 191)->nullable();
			$table->text('hotel_info')->nullable();
			$table->integer('gallery_id')->nullable();
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
		Schema::drop('package_hotels');
	}

}
