<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAdminMenuItemsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('admin_menu_items', function(Blueprint $table)
		{
			$table->bigInteger('id')->unsigned();
			$table->string('label', 191);
			$table->string('link', 191);
			$table->bigInteger('parent')->unsigned()->default(0);
			$table->integer('sort')->default(0);
			$table->string('class', 191)->nullable();
			$table->bigInteger('menu')->unsigned();
			$table->integer('depth')->default(0);
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
		Schema::drop('admin_menu_items');
	}

}
