<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateReturnDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('return_details', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('return_id')->unsigned()->index('Return_Details_ID');
			$table->string('name')->default('');
			$table->float('qty', 10, 0)->default(0);
			$table->float('price', 10, 0)->default(0);
			$table->float('total', 10, 0)->default(0);
			$table->date('updated_at')->nullable();
			$table->date('created_at')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('return_details');
	}

}
