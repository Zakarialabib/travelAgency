<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('posts', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id')->nullable();
			$table->string('category', 500)->nullable();
			$table->string('title')->nullable();
			$table->string('slug')->nullable();
			$table->text('content')->nullable();
			$table->string('thumb')->nullable();
			$table->integer('status')->nullable()->default(1);
			$table->string('type', 10);
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
		Schema::drop('posts');
	}

}
