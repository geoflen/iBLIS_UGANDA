<?Php 
class HBPatient extends Eloquent{
	protected $table = 'hb_patient';
	
	public function district(){
		return $this->hasOne('HbDistrict','id','districtid');
	}
	public function facility(){
		return $this->hasOne('Facility','id','facilityid');
	}
	public function hub(){
		return $this->hasOne('Facility','id','hubid');
	}
	public function hbpatientworksheet(){
		return $this->belongsTo('HBPatientWorksheet','id','hbpatientid');
	}
	
}