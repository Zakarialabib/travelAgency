<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCategoryTypeTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('category_type_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('category_type_id')->unsigned();
			$table->string('locale')->index();
			$table->string('name')->nullable();
            $table->string('description')->nullable();
			$table->unique(['category_type_id','locale']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('category_type_translations');
	}

}
