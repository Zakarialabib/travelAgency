<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProfilesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('profiles', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('user_id', 191);
			$table->string('sur_name', 191)->nullable();
			$table->string('first_name', 191)->nullable();
			$table->string('other_name', 191)->nullable();
			$table->string('phone_number', 191)->nullable();
			$table->string('nationality', 191)->nullable();
			$table->text('address')->nullable();
			$table->text('photo')->nullable();
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
		Schema::drop('profiles');
	}

}
