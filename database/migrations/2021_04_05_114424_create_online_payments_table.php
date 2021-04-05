<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOnlinePaymentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('online_payments', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->text('reference', 65535);
			$table->text('booking_reference', 65535);
			$table->bigInteger('amount');
			$table->integer('gateway_id');
			$table->text('response_code', 65535)->nullable();
			$table->text('response_description')->nullable();
			$table->integer('payment_status');
			$table->text('response_full')->nullable();
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
		Schema::drop('online_payments');
	}

}
