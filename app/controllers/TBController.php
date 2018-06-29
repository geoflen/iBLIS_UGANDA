<?php

use Illuminate\Database\QueryException;

/**
*Contains functions for managing patient records
*
*/
class TBController extends \BaseController {

	/**
	* Display a listing of the resource.
	*
	* @return Response
	*/

	public function index()
	{

		$search = Input::get('search');

		$district = District::orderBy('name','ASC')->lists('name', 'id');
		$region = array('0' => 'Eastern Region', '1' => 'Northern Region', '2' => 'SouthWestern Region', '3' => 'Central Region');

		$patients = TB::leftjoin('tb_results as tr', 'tr.patient_id', '=', 'tb_tables.id')
		->select('tb_tables.*','xpert_mtb_results', 'rif_resistant_status', 'tr.test_date', 'tr.test_by')
		->from('tb_tables')
		->get();

		if (count($patients) == 0) {
			Session::flash('message', trans('messages.no-match'));
		}

		// Load the view and pass the patients
		return View::make('tb.index')
		->with('district',$district)
		->with('region',$region)
		->with('patients', $patients)->withInput(Input::all());
	}

	/**
	* Show the form for creating a new resource.
	*
	* @return Response
	*/
	public function create()
	{
		//Create patients
		$district = District::orderBy('name','ASC')
		->lists('name', 'id');
		$region = array('0' => 'Eastern Region', '1' => 'Northern Region', '2' => 'SouthWestern Region', '3' => 'Central Region');

		return View::make('tb.genexpert')
		->with('region',$region)
		->with('district',$district);
	}

	/**
	* Store a newly created resource in storage.
	*
	* @return Response
	*/
	public function store()
	{
		$rules = array(
		'patient_name' => 'required',
		'age'       => 'required',
		'gender' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {

			// store
			$patient = new TB;
			$patient->ref_facility = Input::get('ref_facility');
			$patient->region = Input::get('region');
			$patient->district_id	= Input::get('district_id');
			$patient->gender	= Input::get('gender');
			$patient->age	= Input::get('age');
			$patient->patient_nin = Input::get('patient_nin');
			$patient->subcounty = Input::get('subcounty');
			$patient->village	= Input::get('village');
			$patient->patient_name	= Input::get('patient_name');
			$patient->patient_contact	= Input::get('patient_contact');
			$patient->next_of_kin	= Input::get('next_of_kin');
			$patient->sputum_collection_date	= Input::get('sputum_collection_date');
			$patient->sputum_collection_time	= Input::get('sputum_collection_time');
			$patient->collected_by	= Input::get('collected_by');
			$patient->collection_officer_contact	= Input::get('collection_officer_contact');
			$patient->patient_type	= Input::get('patient_type');
			$patient->hiv_status	= Input::get('hiv_status');
			$patient->sputum_smear_results	= Input::get('sputum_smear_results');
			$patient->chest_xray_status	= Input::get('chest_xray_status');
			$patient->requested_by	= Input::get('requested_by');
			$patient->request_date	= Input::get('request_date');
			$patient->requesting_officer_contact	= Input::get('requesting_officer_contact');
			$patient->genexpert_site	= Input::get('genexpert_site');
			$patient->district	= Input::get('district');
			$patient->received_by	= Input::get('received_by');
			$patient->date_received	= Input::get('date_received');

			try{
				$patient->save();

				return Redirect::route('tb.index')
				->with('message', 'Successfully saved patient information!');

			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}
		}
	}
	/**
	* Display the specified resource.
	*
	* @param  int  $id
	* @return Response
	*/

	public function show($id)
	{
		$search = Input::get('search');

		$patient = TB::leftjoin('tb_results as pr', 'pr.patient_id', '=', 'tb_tables.id')
		->select('tb_tables.*','pr.xpert_mtb_results','pr.rif_resistant_status', 'pr.test_date')
		->from('tb_tables')->find($id);

		if (count($patient) == 0) {
			Session::flash('message', trans('messages.no-match'));
		}

		// Load the view and pass the patients
		$antenatal = array('0'=>'Lifelong ART', '1' => 'No ART', '2' => 'UNKNOWN');
		return View::make('tb.show')
		->with('antenatal',$antenatal)
		->with('patient', $patient)->withInput(Input::all());
	}
	/**
	* Show the form for editing the specified resource.
	*
	* @param  int  $id
	* @return Response
	*/
	public function edit($id)
	{
		//Get the patient
		$patient = TB::find($id);

		//Open the Edit View and pass to it the $patient
		//Create patients
		$district = District::orderBy('name','ASC')
		->lists('name', 'id');
		$region = array('0' => 'Eastern Region', '1' => 'Northern Region', '2' => 'SouthWestern Region', '3' => 'Central Region');

		return View::make('tb.edit')
		->with('region',$region)
		->with('patient',$patient)
		->with('district',$district);
	}

	/**
	* Update the specified resource in storage.
	*
	* @param  int  $id
	* @return Response
	*/
	public function update($id)
	{
		$rules = array(
		'infant_name' => 'required',
		'age'       => 'required',
		'gender' => 'required',
		'mother_name' => 'required'
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::to('tb/' . $id . '/edit')
			->withErrors($validator)
			->withInput(Input::except('password'));
		}

		else {
			// Update
			$patient = TB::find($id);
			$patient->ref_facility = Input::get('ref_facility');
			$patient->region = Input::get('region');
			$patient->district_id	= Input::get('district_id');
			$patient->gender	= Input::get('gender');
			$patient->age	= Input::get('age');
			$patient->patient_nin = Input::get('patient_nin');
			$patient->subcounty = Input::get('subcounty');
			$patient->village	= Input::get('village');
			$patient->patient_name	= Input::get('patient_name');
			$patient->patient_contact	= Input::get('patient_contact');
			$patient->next_of_kin	= Input::get('next_of_kin');
			$patient->sputum_collection_date	= Input::get('sputum_collection_date');
			$patient->sputum_collection_time	= Input::get('sputum_collection_time');
			$patient->collected_by	= Input::get('collected_by');
			$patient->collection_officer_contact	= Input::get('collection_officer_contact');
			$patient->patient_type	= Input::get('patient_type');
			$patient->hiv_status	= Input::get('hiv_status');
			$patient->sputum_smear_results	= Input::get('sputum_smear_results');
			$patient->chest_xray_status	= Input::get('chest_xray_status');
			$patient->requested_by	= Input::get('requested_by');
			$patient->request_date	= Input::get('request_date');
			$patient->requesting_officer_contact	= Input::get('requesting_officer_contact');
			$patient->genexpert_site	= Input::get('genexpert_site');
			$patient->district	= Input::get('district');
			$patient->received_by	= Input::get('received_by');
			$patient->date_received	= Input::get('date_received');

			$patient->save();

			// redirect
			return Redirect::route('tb.index')
			->with('message', 'The patient details were successfully updated!') ->with('activepatient',$patient ->id);

		}
	}

	/**
	* Remove the specified resource from storage.
	*
	* @param  int  $id
	* @return Response
	*/
	public function destroy($id)
	{
	}

	/**
	* Remove the specified resource from storage (soft delete).
	*
	* @param  int  $id
	* @return Response
	*/
	public function delete($id)
	{
		//Soft delete the patient
		$patient = TB::find($id);
		$patient->delete();

		// redirect
		$url = Session::get('SOURCE_URL');
		return Redirect::to($url)
		->with('message', 'The commodity was successfully deleted!');
	}

	/**
	* Return a Patients collection that meets the searched criteria as JSON.
	*
	* @return Response
	*/
	public function search()
	{
		return UnhlsPatient::search(Input::get('text'))->take(Config::get('kblis.limit-items'))->get()->toJson();
	}

	public function enter_results($patient_id){
		$patient = TB::find($patient_id);
		return View::make('tb.enter_results')
		->with('patient', $patient);
	}

	public function save_results($patient_id)
	{
		$rules = array(
		'xpert_mtb_results' => 'required',
		'test_date' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			// store
			$result = new TBResult;
			$result->patient_id = $patient_id;
			$result->xpert_mtb_results = Input::get('xpert_mtb_results');
			$result->rif_resistant_status = Input::get('rif_resistant_status');
			$result->test_date = Input::get('test_date');
			$result->test_by = Input::get('test_by');
			try{
				$result->save();
				return Redirect::route('tb.index')
				->with('message', 'Successfully saved results information:!');

			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}
		}
	}


	public function edit_results($patient_id){
		$patient = TB::find($patient_id);
		$result = TBResult::where('patient_id', $patient_id)->limit(1)->first();
		return View::make('tb.edit_results')
		->with('patient', $patient)->with('result', $result);
	}

	public function update_results($id)
	{
		$rules = array(
		'xpert_mtb_results' => 'required',
		'rif_resistant_status' => 'required',
		'test_date' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			// store
			$result = TBResult::find($id);
			$result->xpert_mtb_results = Input::get('xpert_mtb_results');
			$result->rif_resistant_status = Input::get('rif_resistant_status');
			$result->test_date = Input::get('test_date');
			$result->test_by = Input::get('test_by');
			try{
				$result->save();
				return Redirect::route('tb.index')
				->with('message', 'Successfully updated esults information:!');

			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}
		}
	}

	public function download(){
		$test_date_fro = Input::get('test_date_fro');
		$test_date_to = Input::get('test_date_to');
		if(!empty($test_date_fro) and !empty($test_date_to)){
			$this->csv_download($test_date_fro, $test_date_to);
		}else{
			return View::make('tb.download');
		}
	}

	private function csv_download($fro, $to){
		$patients = TB::leftjoin('tb_results as pr', 'pr.patient_id', '=', 'tb_tables.id')
		->select('tb_tables.*','pr.xpert_mtb_results','pr.rif_resistant_status', 'pr.test_date', 'pr.test_by')
		->from('tb_tables')
		->where('pr.test_date','>=',$fro)
		->where('pr.test_date','<=',$to)
		->get();
		header('Content-Type: text/csv; charset=utf-8');
		header("Content-Disposition: attachment; filename=TB-Genexpert-Data_$fro"."_$to.csv");
		$output = fopen('php://output', 'w');
		$headers = array(
		'PatinetName',
		'Gender',
		'Age',
		'Patient Type',
		'Patient Contact',
		'Next Of Kin Contact',
		'HIV Status',
		'Sputum Smear Results',
		'Chest Xray Status',
		'Referring Health Unit',
		'GeneXpert Site',
		'Xpert MTB Results',
		'RIF Resistance Status',
		'Test Date',
		'Tested BY'
			);

		fputcsv($output, $headers);
		foreach ($patients as $patient) {
			$row=array(
			$patient->patient_name,
			$patient->gender,
			$patient->age,
			$patient->patient_type,
			$patient->patient_contact,
			$patient->next_of_kin,
			$patient->hiv_status,
			$patient->sputum_smear_results,
			$patient->chest_xray_status,
			$patient->ref_facility,
			$patient->genexpert_site,
			$patient->xpert_mtb_results,
			$patient->rif_resistant_status,
			$patient->test_date,
			$patient->test_by
			);
			fputcsv($output, $row);
		}
		fclose($output);

	}

}
