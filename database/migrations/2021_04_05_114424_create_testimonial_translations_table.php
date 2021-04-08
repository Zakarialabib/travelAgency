<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTestimonialTranslationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('testimonial_translations', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('testimonial_id')->nullable();
			$table->string('locale', 10)->nullable();
			$table->string('name')->nullable();
			$table->string('job_title')->nullable();
			$table->string('content', 500)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('testimonial_translations');
	}

}
