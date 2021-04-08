<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePayLatersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('pay_laters', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->text('reference', 65535);
			$table->text('booking_reference', 65535);
			$table->integer('amount');
			$table->integer('bank_detail_id');
			$table->string('slip_photo', 191);
			$table->integer('status');
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
		Schema::drop('pay_laters');
	}

}
