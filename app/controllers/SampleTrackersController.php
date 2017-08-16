<?php

use Illuminate\Database\QueryException;

class SampleTrackersController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /sampletrackers
	 *
	 * @return Response
	 */
	public function index()
	{
//	$search = Input::get('search');

	$sampletracker = SampleTracker::all();

		return View::make('sampletracker.index', compact('stracker'))->with('sampletracker', $sampletracker)->withInput(Input::all());
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /sampletrackers/create
	 *
	 * @return Response
	 */
	public function create()
	{
		return View::make('sampletracker.create');
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /sampletrackers
	 *
	 * @return Response
	 */
	public function store()
	{
		$rules = array(
			'barcode' => 'required|unique:sampletracker,barcode',
			'hub'			=> 'required',
			'district'       => 'required',
			'dispatch_date' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {

			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			// store
			$sampletracker = new SampleTracker;
			$sampletracker->barcode = Input::get('barcode');
			$sampletracker->hub =Input::get('hub');
			$sampletracker->district = Input::get('district');
			$sampletracker->dispatch_date = Input::get('dispatch_date');
			$sampletracker->dispatched_by = Auth::user()->name;

			try{
				$sampletracker->save();
			// $url = Session::get('sampletracker');
			// return Redirect::to($url)->with('message', 'Successfully dispatched!');
			 return Redirect::to('sampletracker');

			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}

			// redirect
		}
	}

	/**
	 * Display the specified resource.
	 * GET /sampletrackers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 * GET /sampletrackers/{id}/edit
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 * PUT /sampletrackers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 * DELETE /sampletrackers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	 public function destroy($id){

	           // delete
	           $sampletracker = SampleTracker::find($id);
	           $sampletracker->delete();

	           // redirect
	           Session::flash('message', 'Successfully deleted!');
	           Session::flash('alert-type', 'success');
	           return Redirect::to('sampletracker');
	 }

	 public function home()
	 {
		// return Redirect::to('sampletracker.home');
		$sampletracker = SampleTracker::all();
		//return View::make('sampletracker.index', compact('stracker'))->with('sampletracker', $sampletracker)->withInput(Input::all());
		 return View::make('sampletracker.strackhme', compact('stracker'))->with('sampletracker', $sampletracker)->withInput(Input::all());
		 //return view('sampletracker/home');
	 }

}
