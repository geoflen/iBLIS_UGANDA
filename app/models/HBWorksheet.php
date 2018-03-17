<?Php 
class HBWorksheet extends Eloquent{
	protected $table = 'hb_worksheet';
	
	public function district(){
		return $this->hasOne('HbDistrict','id','districtid');
	}
	public function facility(){
		return $this->hasOne('Facility','id','facilityid');
	}
	public function hub(){
		return $this->hasOne('Facility','id','hubid');
	}
}