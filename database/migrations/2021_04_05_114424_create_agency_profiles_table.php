<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAgencyProfilesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('agency_profiles', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->string('company_name', 191);
			$table->text('company_address');
			$table->string('cac_rc_number', 191);
			$table->string('company_phone_number', 191);
			$table->string('company_email', 191);
			$table->string('company_contact_person_email', 191);
			$table->string('company_contact_person_phone_number', 191);
			$table->text('company_contact_person_address');
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
		Schema::drop('agency_profiles');
	}

}
