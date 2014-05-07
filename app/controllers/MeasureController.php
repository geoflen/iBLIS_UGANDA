<?php

use Illuminate\Support\MessageBag;
use Illuminate\Database\QueryException;

/**
 * Contains measure resources  
 * Measures are standard units and ranges of test results
 */
class MeasureController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		// List all the active measures
			$measures = Measure::paginate(Config::get('kblis.page-items'));

		// Load the view and pass the measures
		return View::make('measure.index')->with('measures', $measures);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//Create measure
		return View::make('measure.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
		$rules = array(
			'name'       => 'required'
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::to('measure/create')
				->withErrors($validator)
				->withInput(Input::except('password'));
		} else {
			// store
			$measure = new Measure;
			$measure->name = Input::get('name');
			$measure->type_id = Input::get('type');
			$measure->unit = Input::get('unit');
			$measure->description = Input::get('description');

			try{
				$measure->save();
			}catch(QueryException $e){
				$errors = new MessageBag(array(
                	"Ensure that the measure number is unique."
                ));
				return Redirect::to('measure/create')->withErrors($errors);
			}
			$val['agemin'] = Input::get('agemin');
			$val['agemax'] = Input::get('agemax');
			$val['gender'] = Input::get('gender');
			$val['rangemin'] = Input::get('rangemin');
			$val['rangemax'] = Input::get('rangemax');

			for ($i=0; $i < count($val['agemin']); $i++) { 
				$measurerange = new MeasureRange;
			 	$measurerange->measure_id = $measure->id;
			 	$measurerange->age_min = $val['agemin'][$i];
				$measurerange->age_max = $val['agemax'][$i];
				$measurerange->sex = $val['gender'][$i];
				$measurerange->range_lower = $val['rangemin'][$i];
				$measurerange->range_upper = $val['rangemax'][$i];
				$measurerange->save();
			 }
				Session::flash('message', 'Successfully created measure!');
				return Redirect::to('measure');
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
		//Show a measure
		$measure = Measure::find($id);

		//Show the view and pass the $measure to it
		return View::make('measure.show')->with('measure', $measure);
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//Get the measure
		$measure = Measure::find($id);

		//Open the Edit View and pass to it the $measure
		return View::make('measure.edit')->with('measure', $measure);
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
		$rules = array(
			'name'       => 'required'
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::to('measure/' . $id . '/edit')
				->withErrors($validator)
				->withInput(Input::except('password'));
		} else {
			// Update
			$measure = new Measure;
			$measure->name = Input::get('name');
			$measure->measure_range = Input::get('measure_range');
			$measure->unit = Input::get('unit');
			$measure->description = Input::get('description');
			$measure->save();

			// redirect
			Session::flash('message', 'The measure details were successfully updated!');
			return Redirect::to('measure');
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
		//
	}

	/**
	 * Remove the specified resource from storage (soft delete).
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function delete($id)
	{
		//Soft delete the measure
		$measure = Measure::find($id);

		$measure->delete();

		// redirect
		Session::flash('message', 'The measure was successfully deleted!');
		return Redirect::to('measure');
	}

}