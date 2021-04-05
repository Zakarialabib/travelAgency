<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHotelDealsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('hotel_deals', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id');
			$table->string('name', 191);
			$table->string('city', 191);
			$table->text('address');
			$table->integer('star_rating');
			$table->string('stay_start_date', 191);
			$table->string('stay_duration', 191);
			$table->string('stay_end_date', 191);
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
		Schema::drop('hotel_deals');
	}

}
