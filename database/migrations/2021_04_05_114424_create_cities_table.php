<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCitiesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('cities', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('country_id');
			$table->string('name');
			$table->string('slug');
			$table->string('intro')->nullable();
			$table->text('description')->nullable();
			$table->string('thumb')->nullable();
			$table->string('banner')->nullable();
			$table->string('best_time_to_visit')->nullable();
			$table->string('currency')->nullable();
			$table->string('language')->nullable();
			$table->float('lat', 10, 0)->nullable();
			$table->float('lng', 10, 0)->nullable();
			$table->integer('priority')->default(0);
			$table->integer('status')->default(1);
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
		Schema::drop('cities');
	}

}
