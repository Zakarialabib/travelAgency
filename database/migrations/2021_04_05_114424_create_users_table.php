<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('email', 191)->unique();
			$table->string('password', 191);
			$table->integer('delete_status')->default(0);
			$table->integer('profile_complete_status')->default(0);
			$table->text('api_token')->nullable();
			$table->string('remember_token', 100)->nullable();
			$table->integer('customer_id')->unsigned()->nullable()->index('customer_id_user_id');
			$table->integer('is_admin')->nullable()->default(1);
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
		Schema::drop('users');
	}

}
