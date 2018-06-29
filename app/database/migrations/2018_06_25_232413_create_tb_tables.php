<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTbTables extends Migration {

	/**
	* Run the migrations.
	*
	* @return void
	*/
	public function up()
	{
		Schema::create('tb_tables', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('ref_facility');
			$table->string('region');
			$table->integer('district_id')->unsigned();
			$table->string('gender');
			$table->float('age');
			$table->string('patient_nin');
			$table->string('subcounty');
			$table->string('village');
			$table->string('patient_name');
			$table->string('patient_contact');
			$table->string('next_of_kin');
			$table->date('sputum_collection_date');
			$table->string('sputum_collection_time');
			$table->string('collected_by');
			$table->string('collection_officer_contact');
			$table->string('patient_type');
			$table->string('hiv_status');
			$table->string('sputum_smear_results');
			$table->string('chest_xray_status');
			$table->string('requested_by');
			$table->date('request_date');
			$table->string('requesting_officer_contact');

			//to be revised on wether to be pushed to results table or kept here
			$table->string('genexpert_site');
			$table->string('district');
			$table->string('received_by');
			$table->date('date_received');
			// $table->date('test_date');
			// $table->string('test_by');
			$table->foreign('district_id')->references('id')->on('unhls_districts');
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
		Schema::drop('tb_tables');

	}

}
