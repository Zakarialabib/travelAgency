<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToPlaceTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('place_translations', function(Blueprint $table)
		{
			$table->foreign('place_id')->references('id')->on('places')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('place_translations', function(Blueprint $table)
		{
			$table->dropForeign('place_translations_place_id_foreign');
		});
	}

}
