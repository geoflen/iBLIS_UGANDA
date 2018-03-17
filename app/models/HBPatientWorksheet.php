<?Php 
class HBPatientWorksheet extends Eloquent{
	protected $table = 'hb_patientworksheet';
	
	public function patient(){
		return $this->hasOne('HBPatient','id','hbpatientid');
	}
	public function worksheet(){
		return $this->hasOne('HBWorksheet','id','worksheetid');
	}
}