<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVisaApplicationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('visa_applications', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('surname', 191);
			$table->string('given_name', 191);
			$table->string('phone', 191);
			$table->string('email', 191);
			$table->string('residence_country', 191);
			$table->string('destination_country', 191);
			$table->string('ipAddress', 45);
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
		Schema::drop('visa_applications');
	}

}
