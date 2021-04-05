<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToReturnDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('return_details', function(Blueprint $table)
		{
			$table->foreign('return_id', 'Return_Details_ID')->references('id')->on('returns')->onUpdate('RESTRICT')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('return_details', function(Blueprint $table)
		{
			$table->dropForeign('Return_Details_ID');
		});
	}

}
