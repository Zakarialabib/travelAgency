<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToPurchaseDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('purchase_details', function(Blueprint $table)
		{
			$table->foreign('purchase_id', 'Purchase detail fk')->references('id')->on('purchases')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('purchase_details', function(Blueprint $table)
		{
			$table->dropForeign('Purchase detail fk');
		});
	}

}
