<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCustomersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('customers', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id')->unsigned()->nullable()->index('customer_user_id');
			$table->string('name', 191)->nullable();
			$table->text('company_name', 65535)->nullable();
			$table->string('email', 191)->nullable();
			$table->string('phone_number', 191)->nullable();
			$table->string('tax_no', 191)->nullable();
			$table->string('address', 191)->nullable();
			$table->string('city', 191)->nullable();
			$table->string('postal_code', 191)->nullable();
			$table->string('country', 191)->nullable();
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
		Schema::drop('customers');
	}

}
