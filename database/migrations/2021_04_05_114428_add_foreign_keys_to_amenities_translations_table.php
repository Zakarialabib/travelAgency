<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToAmenitiesTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('amenities_translations', function(Blueprint $table)
		{
			$table->foreign('amenities_id')->references('id')->on('amenities')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('amenities_translations', function(Blueprint $table)
		{
			$table->dropForeign('amenities_translations_amenities_id_foreign');
		});
	}

}
