<?php

class HepatitisController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$patients = HBPatient::orderBy('created_at', 'desc')->get();
		//$patients = BookBank::all();
		//$patients = HBPatient::orderBy('patientname', 'asc')->paginate(30);
		//Load the view and pass the patients
		return View::make('hepatitis.list')->with('patients',$patients);
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		$hubsdropdown = getAllHubs();
		
		$lt = new LookupType();
		$lt->name = 'GENDER';
		$gender =  $lt->getOptionValuesAndDescription();
		
		$lt->name = 'POSITIVE_NEGATIVE';
		$positive_negative = $lt->getOptionValuesAndDescription();
				
		$lt->name = 'YES_NO';
		$yesno = $lt->getOptionValuesAndDescription();
		
		$lt->name = 'HB_DRUG_TYPES';
		$hbdrugtypes = $lt->getOptionValuesAndDescription();
		
		$lt->name = 'HIV_DRUG_TYPES';
		$hivdrugtypes = $lt->getOptionValuesAndDescription(); 
		
		$lt->name = 'SAMPLE_TYPES';
		$lastroutineviralloadsampletype = $lt->getOptionValuesAndDescription(); 
				
		$emptydropdown = array('' => 'Select one');
		
		$generated_otherid = date('syimdH');
		
		return View::make('hepatitis.create')
				->with('hubsdropdown',$hubsdropdown)
				->with('emptydropdown',$emptydropdown)
				->with('gender', $gender)
				->with('positive_negative', $positive_negative)
				->with('yesno', $yesno)
				->with('hbdrugtypes',$hbdrugtypes)
				->with('hivdrugtypes',$hivdrugtypes)
				->with('lastroutineviralloadsampletype',$lastroutineviralloadsampletype)
				->with('generated_otherid',$generated_otherid);
	}

	public function createworksheet($machinetype){
		$ref_number = date('syimdH');
		$lt = new LookupType;
		$lt->name = 'SAMPLE_TYPES';
		$sampletypes = array_merge_maintain_keys(array('' => '-----'),$lt->getOptionValuesAndDescription()); 
		
		$lt->name = 'MACHINE_TYPES';
		$machinetypes = $lt->getOptionValuesAndDescription();
		
		$lt->name = 'YES_NO';
		$yesno = $lt->getOptionValuesAndDescription();
		
		return View::make('hepatitis.createworksheet')
				->with('ref_number', $ref_number)
				->with('machinetype',$machinetype)
				->with('machinetypes',$machinetypes)
				->with('sampletypes',$sampletypes)
				->with('yesno', $yesno);
	}
	public function worksheets(){
		$worksheets = HBWorksheet::orderBy('refnumber', 'asc')->get();
		//$patients = BookBank::all();
		//$patients = HBPatient::orderBy('patientname', 'asc')->paginate(30);
		//Load the view and pass the patients
		return View::make('hepatitis.worksheets')->with('worksheets',$worksheets);		
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$rules = array(
			'facilityid' => 'required',
			'hubid' => 'required',
			'districtid' => 'required',
			'locatorid' => 'required|unique:hb_patient',
			'otherid' => 'required|unique:hb_patient',
			'patientname' => 'required',
			'sex' => 'required',
		);
		$formvalues = Input::all();
		//print_r($formvalues);
		//exit;
		$validator = Validator::make($formvalues, $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			// store
			$patient = new HBPatient;
			$patient->facilityid = $formvalues['facilityid'];
			$patient->hubid = $formvalues['hubid'];
			$patient->districtid = $formvalues['districtid'];
			$patient->locatorid = $formvalues['locatorid'];
			$patient->otherid = $formvalues['otherid'];
			$patient->patientname = $formvalues['patientname'];
			$patient->patientid = $formvalues['patientid'];
			$patient->sex = $formvalues['sex'];
			$patient->age = $formvalues['age'];
			$patient->telephonenumber = $formvalues['telephonenumber'];
			$patient->hbeagresult = $formvalues['hbeagresult'];
			$patient->hbsagresult = $formvalues['hbsagresult'];
			$patient->hbdiagonosisdate = $formvalues['hbdiagonosisdate'];
			$patient->hbaltvalue = $formvalues['hbaltvalue'];
			$patient->hbastvalue = $formvalues['hbastvalue'];
			$patient->hbplateletcount = $formvalues['hbplateletcount'];
			$patient->asltorpltgreaterthantwo = $formvalues['asltorpltgreaterthantwo'];
			$patient->fetalprotainvalue = $formvalues['fetalprotainvalue'];
			$patient->otherhbpreliminaryfindings = $formvalues['otherhbpreliminaryfindings'];
			$patient->coinfectionhivhbsag = $formvalues['coinfectionhivhbsag'];
			$patient->coinfectionhdvhbsag = $formvalues['coinfectionhdvhbsag'];
			$patient->coinfectionhcvhbsag = $formvalues['coinfectionhcvhbsag'];
			$patient->otherhbconinfections = $formvalues['otherhbconinfections'];
			$patient->isonhptreatment = $formvalues['isonhptreatment'];
			$patient->hbinitiationdate = $formvalues['hbinitiationdate'];
			if(in_array('hbdrudtype', $formvalues)){
				$patient->hbdrudtype = $formvalues['hbdrudtype'];
			}
			$patient->hbdrudtype = $formvalues['hbdrudtype'];
			$patient->isonhivtreatment = $formvalues['isonhivtreatment'];
			$patient->hivinitiationdate = $formvalues['hivinitiationdate'];
			if(in_array('hivdrugtype', $formvalues)){
				$patient->hivdrugtype = $formvalues['hivdrugtype'];
			}
			$patient->lastroutineviralloaddate = $formvalues['lastroutineviralloaddate'];
			$patient->lastroutineviralloadsampletype = $formvalues['lastroutineviralloadsampletype'];
			$patient->lastroutineviralloadvalue = $formvalues['lastroutineviralloadvalue'];
			$patient->lastrepeatviralloaddate = $formvalues['lastrepeatviralloaddate'];
			$patient->lastrepeatviralloadvalue = $formvalues['lastrepeatviralloadvalue'];
			$patient->lastrepeatviralloadsampletype = $formvalues['lastrepeatviralloadsampletype'];			
			$patient->samplecollectiondate = $formvalues['samplecollectiondate'];
			$patient->sampletypecollected = $formvalues['sampletypecollected'];
			$patient->samplereceptiondate = $formvalues['samplereceptiondate'];
			$patient->labtechnitian = $formvalues['labtechnitian'];
			$patient->createdby = Auth::user()->id;
			$patient->status = 0;

			try{
				$patient->save();
				$url = 'hep';
			return Redirect::to($url)
			->with('message', 'Successfully created patient with Other ID:  '.$patient->otherid.'!');
			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}

			// redirect
		}
	
	}
	
	public function storeworksheet(){
		$rules = array(
			'refnumber' => 'required',
			'machinetype' => 'required',
			'sampletype' => 'required',
			'sampleprep' => 'required',
			'sampleprepexpirydate' => 'required',
			'control' => 'required',
			'controlexpirydate' => 'required',
			'calibrator' => 'required',
			'calibratorexpirydate' => 'required',
			'amplificationkit' => 'required',
			'amplificationkitexpirydate' => 'required',
			'assaydate' => 'required',
		);
		$formvalues = Input::all();
		//print_r($formvalues);
		//exit;
		$validator = Validator::make($formvalues, $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$worksheet = new HBWorksheet;
			$worksheet->refnumber = $formvalues['refnumber'];
			$worksheet->machinetype = $formvalues['machinetype'];
			$worksheet->sampletype = $formvalues['sampletype'];
			$worksheet->sampleprep = $formvalues['sampleprep'];
			$worksheet->sampleprepexpirydate = getMysqlDateFormat($formvalues['sampleprepexpirydate']);
			$worksheet->bulklysisbuffer = $formvalues['bulklysisbuffer'];
			$worksheet->bulklysisbufferexpirydate = getMysqlDateFormat($formvalues['bulklysisbufferexpirydate']);
			$worksheet->control = $formvalues['control'];
			$worksheet->controlexpirydate = getMysqlDateFormat($formvalues['controlexpirydate']);
			$worksheet->calibrator = $formvalues['calibrator'];
			$worksheet->calibratorexpirydate = getMysqlDateFormat($formvalues['calibratorexpirydate']);
			$worksheet->amplificationkit = $formvalues['amplificationkit'];
			$worksheet->amplificationkitexpirydate = getMysqlDateFormat($formvalues['amplificationkitexpirydate']);
			$worksheet->assaydate = getMysqlDateFormat($formvalues['assaydate']);
		try{
			$worksheet->save();
			return Redirect::to('hep/worksheetsamples/'.$worksheet->id)
			->with('message', 'Worksheet '.$worksheet->refnumber.'! created successfully');
			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}

			// redirect
		}
	}
	public function worksheetsamples($worksheetid){
		//$worksheet = HBWorksheet::find($worksheetid);
		//get all samples which have not yet been assigned worksheets - i.e status == 0
		$patients = HBPatient::where('status', '=', 0)->orderBy('patientname', 'asc')->get();
		//generate a 6 column array
		$index = 0;
		$row_counter=0;
		$patients_array = array();
		$no_of_records = count($patients);
		$modulus = $no_of_records % 6;
		$offset = $no_of_records - $modulus;
		$row_of_six_patients = array();
		foreach ($patients as $patient){
			
			array_push($row_of_six_patients,$patient);
			$row_counter++;
			
			//start another entry of six patients
			if($row_counter == 6){
				//insert into patients_array
				array_push($patients_array, $row_of_six_patients);
				//reset the row_counter to 0
				$row_counter = 0;				
				//reset row_of_six_patients to null
				$row_of_six_patients = array();	
				//add more patients now to 	
			}elseif($index > $offset){
				array_push($patients_array, $row_of_six_patients);				
			}
			$index++;
			
		}
		//$generator = new \Picqer\Barcode\BarcodeGeneratorSVG();
		$generator = new Picqer\Barcode\BarcodeGeneratorHTML();
		return View::make('hepatitis.assignsampletoworksheet')
				->with('patients_array', $patients_array)
				->with('generator',$generator)
				->with('worksheetid',$worksheetid);
		
	}
	public function storeworksheetsample(){
		$formvalues = Input::all();
		$worksheet = HBWorksheet::find($formvalues['worksheetid']);		
		foreach($formvalues['patients'] as $patientid){
			$hbworkheetpatient = new HBPatientWorksheet;
			$hbworkheetpatient->hbpatientid = $patientid;
			$hbworkheetpatient->worksheetid = $worksheet->id;
			$hbworkheetpatient->createdby = Auth::user()->id;
			$hbworkheetpatient->save();
			//update status of patient
			$hbpatient = HBPatient::find($patientid);
			$hbpatient->status = 1;
			$hbpatient->save();
		}
		$worksheet->status = 1;
		$worksheet->save();
		return Redirect::to('hep/viewworksheet/'.$worksheet->id);
	}
	public function viewworksheet($worksheetid){
		$worksheet = HBWorksheet::find($worksheetid);
		//TODO - do this in model using relationships
		$worksheet_patients = getPatientsforWorksheet($worksheetid);
		$generator = new Picqer\Barcode\BarcodeGeneratorHTML();
		return View::make('hepatitis.viewworksheet')
				->with('worksheet',$worksheet)
				->with('worksheet_patients',$worksheet_patients)
				->with('generator',$generator);
	}

	public function printworksheet($worksheetid){
		$worksheet = HBWorksheet::find($worksheetid);
		//TODO - do this in model using relationships
		$worksheet_patients = getPatientsforWorksheet($worksheetid);
		$generator = new Picqer\Barcode\BarcodeGeneratorSVG();
		

	$html = View::make('hepatitis.printworksheet')->with('worksheet',$worksheet)
				->with('worksheet_patients',$worksheet_patients)
				->with('generator',$generator);
	// $html = 'trytryty';
	// $pdf = new MYPDF;
	// $pdf->AddPage();
	// $pdf->SetFont('', '', 10);
	// $pdf->writeHTML($html, true, false, false, false, '');
	// return $pdf->output($worksheet->id.'.pdf');
	 return $html;

	}
	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$patient = HBPatient::find($id);
		return View::make('hepatitis.view')
				->with('patient', $patient);
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$facility = UNHLSFacility::find($id);
		$districts = District::orderBy('name','ASC')->lists('name', 'id');
		$levels = UNHLSFacilityLevel::lists('name', 'id');
		$owners = UNHLSFacilityOwnership::lists('name', 'id');

		return View::make('facility.edit')
				->with('facility', $facility)
				->with('districts', $districts)
				->with('owners', $owners)
				->with('levels', $levels);
	}

	
	public function approveoreject($patientid, $status){
		$patient = HBPatient::find($patientid);
		$patient->status = $status;
		
		if($status == 1){
			$message = 'form '.$patient->patientid.'successfully approved';
		}else{
			$message = 'form '.$patient->patientid.'successfully rejected';
		}
		try{
			$patient->save();
			return Redirect::to('hep')->with('message', $message );
		}catch(QueryException $e){
			Log::error($e);
			echo $e->getMessage();
		}
	}
	
	public function rejectform($id)
	{
		$patient = HBPatient::find($id);
		return View::make('hepatitis.rejectform')->with('patient', $patient);
	}

/**
     *
     * @return \Illuminate\Http\Response - bikes for a hub which do not have a rider
     */
    public function facilitiesForHub(){
		$hubid = Input::get('hubid');	
    	//if($request->ajax()){
			$facilities = Facility::where('parentid', $hubid)->lists("name","id");			
    		$html_options = getGenerateHtmlforAjaxSelect($facilities);
			$district = getDistrictforHub($hubid);
			$districtid = getDistrictIDforHub($hubid);
			$district_html_options = getGenerateHtmlforAjaxSelect($district);
    		return Response::json(['options'=>$html_options,'district_html_options' => $district_html_options, 'districtid'=>$districtid]);
    	//}

    }

}
