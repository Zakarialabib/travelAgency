<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bookings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('place_id')->nullable();
			$table->integer('numbber_of_adult')->nullable();
			$table->integer('numbber_of_children')->nullable();
			$table->date('date')->nullable();
			$table->string('name')->nullable()->default('');
			$table->string('email')->nullable();
			$table->string('phone_number', 20)->nullable();
			$table->string('message', 500)->nullable();
			$table->integer('type')->nullable();
			$table->integer('payment_status')->default(0);
			$table->integer('status')->nullable()->default(2)->comment('status default pending: 2');
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
		Schema::drop('bookings');
	}

}
