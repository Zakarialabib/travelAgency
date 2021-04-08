<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToPlaceTypeTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('place_type_translations', function(Blueprint $table)
		{
			$table->foreign('place_type_id')->references('id')->on('place_types')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('place_type_translations', function(Blueprint $table)
		{
			$table->dropForeign('place_type_translations_place_type_id_foreign');
		});
	}

}
