<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVatsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('vats', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('flight_vat_type')->default(1);
			$table->integer('flight_vat_value')->default(0);
			$table->integer('hotel_vat_type')->default(1);
			$table->integer('hotel_vat_value')->default(0);
			$table->integer('car_vat_type')->default(1);
			$table->integer('car_vat_value')->default(0);
			$table->integer('package_vat_type')->default(1);
			$table->integer('package_vat_value')->default(0);
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
		Schema::drop('vats');
	}

}
