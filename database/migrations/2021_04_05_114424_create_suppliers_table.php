<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSuppliersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('suppliers', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 191)->nullable();
			$table->string('company_name', 191)->nullable();
			$table->string('tax_number', 191)->nullable();
			$table->string('email', 191)->nullable();
			$table->string('phone_number', 191)->nullable();
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
		Schema::drop('suppliers');
	}

}
