<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePackageBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('package_bookings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->integer('package_id');
			$table->string('reference', 191);
			$table->integer('adults');
			$table->integer('children');
			$table->integer('infants');
			$table->integer('customer_title_id');
			$table->string('customer_sur_name', 191);
			$table->string('customer_first_name', 191);
			$table->string('customer_other_name', 191);
			$table->string('customer_phone', 191);
			$table->string('customer_email', 191);
			$table->string('total_amount', 191);
			$table->integer('payment_status');
			$table->integer('booking_status')->default(0);
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
		Schema::drop('package_bookings');
	}

}
