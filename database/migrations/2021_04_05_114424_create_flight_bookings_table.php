<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateFlightBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('flight_bookings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->text('reference', 65535);
			$table->text('pnr', 65535)->nullable();
			$table->bigInteger('itinerary_amount');
			$table->bigInteger('markup');
			$table->bigInteger('markdown');
			$table->bigInteger('vat');
			$table->integer('voucher_id');
			$table->bigInteger('voucher_amount');
			$table->bigInteger('total_amount');
			$table->text('ticket_time_limit', 65535);
			$table->integer('payment_status')->default(0);
			$table->integer('issue_ticket_status')->default(0);
			$table->integer('void_ticket_status')->default(0);
			$table->integer('cancel_ticket_status')->default(0);
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
		Schema::drop('flight_bookings');
	}

}
