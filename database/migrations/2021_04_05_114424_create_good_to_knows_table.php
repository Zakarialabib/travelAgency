<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateGoodToKnowsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('good_to_knows', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id')->nullable();
			$table->string('check_in', 191)->nullable();
			$table->string('check_out', 191)->nullable();
			$table->string('cancellation_prepayment', 191)->nullable();
			$table->string('children_beds', 191)->nullable();
			$table->string('internet', 191)->nullable();
			$table->string('pets', 191)->nullable();
			$table->string('groups', 191)->nullable();
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
		Schema::drop('good_to_knows');
	}

}
