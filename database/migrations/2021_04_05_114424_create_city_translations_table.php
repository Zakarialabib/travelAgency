<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCityTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('city_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('city_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
			$table->string('intro')->nullable();
			$table->string('description')->nullable();
			$table->unique(['city_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('city_translations');
	}

}
