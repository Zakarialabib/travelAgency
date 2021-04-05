<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePlaceTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('place_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('place_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
			$table->text('description')->nullable();
			$table->unique(['place_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('place_translations');
	}

}
