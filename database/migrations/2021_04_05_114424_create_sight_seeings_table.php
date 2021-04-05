<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSightSeeingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sight_seeings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id');
			$table->integer('attraction_id');
			$table->string('title', 191);
			$table->text('description');
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
		Schema::drop('sight_seeings');
	}

}
