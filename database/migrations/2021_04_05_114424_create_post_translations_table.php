<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('post_translations', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->integer('post_id')->unsigned();
			$table->string('locale', 191)->index();
			$table->string('title', 191);
			$table->text('content');
			$table->unique(['post_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('post_translations');
	}

}
