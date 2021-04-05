<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePackagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('packages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_category_id')->nullable();
			$table->string('package_name', 191)->nullable();
			$table->smallInteger('flight')->nullable();
			$table->smallInteger('hotel')->nullable();
			$table->smallInteger('attraction')->nullable();
			$table->string('location', 191)->nullable();
			$table->string('phone_number', 191)->nullable();
			$table->string('time_length', 191)->nullable();
			$table->text('info')->nullable();
			$table->string('duration_type', 191)->nullable();
			$table->string('transports', 191)->nullable();
			$table->string('language_spoken', 191)->nullable();
			$table->string('adult_price', 191)->nullable();
			$table->string('kids_price', 191)->nullable();
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
		Schema::drop('packages');
	}

}
