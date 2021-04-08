<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelPackagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('travel_packages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('category_id');
			$table->string('name', 191);
			$table->integer('flight');
			$table->integer('hotel');
			$table->integer('attraction');
			$table->string('phone_number', 191);
			$table->text('information');
			$table->bigInteger('adult_price');
			$table->bigInteger('child_price');
			$table->bigInteger('infant_price');
			$table->integer('status');
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
		Schema::drop('travel_packages');
	}

}
