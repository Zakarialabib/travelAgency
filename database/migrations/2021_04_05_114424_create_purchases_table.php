<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePurchasesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('purchases', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('reference_no', 191);
			$table->integer('user_id')->unsigned()->index('PurchaseUser');
			$table->integer('supplier_id')->unsigned()->index('PurchaseSupplier');
			$table->float('total_qty', 10, 0);
			$table->float('tax', 10, 0);
			$table->float('total_tax', 10, 0);
			$table->float('total_cost', 10, 0);
			$table->float('grand_total', 10, 0);
			$table->float('paid_amount', 10, 0);
			$table->integer('status');
			$table->integer('paid_by');
			$table->integer('payment_status');
			$table->string('document', 191)->nullable();
			$table->text('note', 65535)->nullable();
			$table->text('payment_note', 65535)->nullable();
			$table->text('staff_note', 65535)->nullable();
			$table->integer('is_locked')->nullable()->default(1);
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
		Schema::drop('purchases');
	}

}
