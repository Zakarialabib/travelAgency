<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBankDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bank_details', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('account_name', 191)->nullable();
			$table->string('account_number', 191)->nullable();
			$table->string('bank_id', 191)->nullable();
			$table->string('bank_branch', 191)->nullable();
			$table->string('ifsc_code', 191)->nullable();
			$table->string('pan', 191)->nullable();
			$table->integer('status')->default(1);
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
		Schema::drop('bank_details');
	}

}
