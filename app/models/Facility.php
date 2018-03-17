<?php 

class Facility extends Eloquent
{
	protected $table = 'facility';
	
	public function district(){
		return $this->hasOne('District','districtid','id');
	}
}