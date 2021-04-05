<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('categories', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name')->nullable();
			$table->string('slug')->nullable();
			$table->integer('priority')->nullable()->default(0);
			$table->integer('is_feature')->nullable()->default(0);
			$table->string('feature_title')->nullable();
			$table->string('image')->nullable();
			$table->string('icon_map_marker')->nullable();
			$table->string('color_code', 80)->nullable();
			$table->string('type', 10)->nullable()->default('place');
			$table->integer('status')->nullable()->default(1);
			$table->string('seo_title')->nullable();
			$table->string('seo_description')->nullable();
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('categories');
	}

}
