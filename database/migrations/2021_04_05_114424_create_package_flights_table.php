<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePackageFlightsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('package_flights', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id')->nullable();
			$table->string('from_location', 191)->nullable();
			$table->string('to_location', 191)->nullable();
			$table->string('airline', 191)->nullable();
			$table->string('departure_date_time', 191)->nullable();
			$table->string('arrival_date_time', 191)->nullable();
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
		Schema::drop('package_flights');
	}

}
