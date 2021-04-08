<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePlaceTypeTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('place_type_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('place_type_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
			$table->unique(['place_type_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('place_type_translations');
	}

}
