<?php

class TBResult extends \Eloquent {
	protected $fillable = [];

	protected $table = 'tb_results';

	public function tb(){
		return $this->belongsTo('TB', 'patient_id');
	}

	public function district(){
		return $this->belongsTo('District', 'district_id');
	}

}
