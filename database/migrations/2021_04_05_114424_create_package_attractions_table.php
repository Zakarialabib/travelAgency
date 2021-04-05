<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePackageAttractionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('package_attractions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id')->nullable();
			$table->string('attraction_name', 191)->nullable();
			$table->text('address')->nullable();
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
		Schema::drop('package_attractions');
	}

}
