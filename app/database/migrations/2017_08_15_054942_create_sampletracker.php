<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSampletracker extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sampletracker', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('barcode');
			$table->string('hub');
			$table->string('district');
			$table->string('dispatched_by');
			$table->string('dispatch_date');
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
		Schema::drop('sampletracker');
	}

}
