<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToPurchasesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('purchases', function(Blueprint $table)
		{
			$table->foreign('supplier_id', 'Purchase Supplier')->references('id')->on('suppliers')->onUpdate('RESTRICT')->onDelete('CASCADE');
			$table->foreign('user_id', 'Purchase User')->references('id')->on('users')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('purchases', function(Blueprint $table)
		{
			$table->dropForeign('Purchase Supplier');
			$table->dropForeign('Purchase User');
		});
	}

}
