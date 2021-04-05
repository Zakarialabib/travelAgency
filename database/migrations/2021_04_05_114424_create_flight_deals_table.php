<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateFlightDealsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('flight_deals', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id');
			$table->string('origin', 191);
			$table->string('destination', 191);
			$table->string('date', 191);
			$table->string('airline', 191);
			$table->string('cabin', 191);
			$table->text('information');
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
		Schema::drop('flight_deals');
	}

}
