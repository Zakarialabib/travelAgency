<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSaleDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sale_details', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('sale_id')->unsigned()->nullable()->index('sale_id');
			$table->string('name')->nullable();
			$table->float('qty', 10, 0)->nullable();
			$table->float('price', 10, 0)->nullable();
			$table->float('total', 10, 0)->nullable();
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
		Schema::drop('sale_details');
	}

}
