<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHotelBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('hotel_bookings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->string('reference', 191);
			$table->string('pnr', 191);
			$table->string('hotel_name', 191);
			$table->string('hotel_code', 191);
			$table->string('hotel_city_code', 191);
			$table->string('hotel_chain_code', 191);
			$table->string('hotel_context_code', 191);
			$table->string('room_booking_code', 191);
			$table->string('rate_plan_code', 191);
			$table->string('guarantee', 191);
			$table->integer('adult_guest');
			$table->integer('child_guest');
			$table->string('check_in_date', 191);
			$table->string('check_out_date', 191);
			$table->bigInteger('base_amount');
			$table->bigInteger('vat');
			$table->bigInteger('markup');
			$table->bigInteger('markdown');
			$table->bigInteger('voucher_id');
			$table->bigInteger('voucher_amount');
			$table->bigInteger('total_amount');
			$table->string('expiry_date', 191);
			$table->integer('payment_status')->default(0);
			$table->integer('reservation_status')->default(0);
			$table->integer('cancellation_status')->default(0);
			$table->text('pnr_request_response');
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
		Schema::drop('hotel_bookings');
	}

}
