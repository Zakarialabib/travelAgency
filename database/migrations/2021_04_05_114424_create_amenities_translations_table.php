<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAmenitiesTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('amenities_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('amenities_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
			$table->unique(['amenities_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('amenities_translations');
	}

}
