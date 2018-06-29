<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTbResults extends Migration {

	/**
	* Run the migrations.
	*
	* @return void
	*/
	public function up()
	{
		Schema::create('tb_results', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('patient_id')->unsigned();
			$table->enum('xpert_mtb_results', array('MTB Not detected','MTB detected', 'Invalid', 'Error', 'No result'));
			$table->enum('rif_resistant_status', array('Not Applicable','Rif resistance detected', 'Rif resistance not detected', 'Indeterminate'));
			$table->date('test_date');
			$table->string('test_by');
			// $table->time('test_time');
			$table->foreign('patient_id')->references('id')->on('tb_tables');
			$table->softDeletes();
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
		Schema::drop('tb_results');
	}

}
