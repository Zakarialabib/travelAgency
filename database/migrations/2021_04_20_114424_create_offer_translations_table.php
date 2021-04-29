<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOfferTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('offer_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('offer_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
			$table->text('description')->nullable();
			$table->unique(['offer_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('offer_translations');
	}

}
