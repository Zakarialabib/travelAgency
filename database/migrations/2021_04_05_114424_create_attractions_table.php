<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAttractionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('attractions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('package_id');
			$table->string('name', 191);
			$table->string('city', 191);
			$table->text('address');
			$table->string('date', 191);
			$table->text('information');
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
		Schema::drop('attractions');
	}

}
