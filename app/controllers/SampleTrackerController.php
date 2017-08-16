<?php

use Illuminate\Database\QueryException;

/**
 * Contains test resources
 *
 */
class SampleTrackerController extends \BaseController {

	/**
	 * Display a listing of Tests. Factors in filter parameters
	 * The search string may match: barcode, name of dispatching officer or destination
	 *
	 * @return Response
	 */
	public function index()
	{
		$search = Input::get('search');
		$datefrom = Input::get('datefrom');
		$dateto = Input::get('dateto');
		//
		if(Entrust::can('track_samples')){
			if($datefrom != ''){
			$sampletracker = SampleTracker::filterbydate($datefrom,$dateto)->orderBy('id','DESC')->paginate(Config::get('kblis.page-items'))->appends(Input::except('_token'));
			}
			else
			$sampletracker = SampleTracker::search($search)->orderBy('id','DESC')->paginate(Config::get('kblis.page-items'))->appends(Input::except('_token'));
		}
		else{

			if($datefrom != ''){
			$sampletracker = SampleTracker::filterbydate($datefrom,$dateto)->orderBy('id','DESC')->paginate(Config::get('kblis.page-items'))->appends(Input::except('_token'));
			}
			else
			$sampletracker = SampleTracker::search($search)->orderBy('id','DESC')->paginate(Config::get('kblis.page-items'))->appends(Input::except('_token'));
		}

		if (count($stracker) == 0) {
		 	Session::flash('message', trans('messages.no-match'));
		}
		// Load the view and pass the bbincidences
		$strackercount=count($stracker);
		$stracker = SampleTracker::all();
		return View::make('sampletracker.index', compact('stracker'));

}
public function show()
{
}
public function store()
{
	//
	$rules = array(
		'barcode' => 'required|unique',
		'hub'			=> 'required',
		'district'       => 'required',
		'dispatch_date' => 'required',
		'dispatched_by' => 'required' ,
	);
	$validator = Validator::make(Input::all(), $rules);

	if ($validator->fails()) {

		return Redirect::back()->withErrors($validator)->withInput(Input::all());
	} else {
		// store
		$stracker = new SampleTracker;
		$stracker->barcode = Input::get('barcode');
		$stracker->hub =Input::get('hub');
		$stracker->district = Input::get('district');
		$stracker->dispatch_date = Input::get('dispatch_date');
		$stracker->dispatched_by = Input::get('dispatched_by');

		try{
			$stracker->save();
		$url = Session::get('SOURCE_URL');
		return Redirect::to($url)
		->with('message', 'Successfully saved dispatch!');
		}catch(QueryException $e){
			Log::error($e);
			echo $e->getMessage();
		}

		// redirect
	}
}
}
