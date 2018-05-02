@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
		<li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		<li><a href="{{ URL::route('poc.index') }}">EID Patient list</a></li>
		<!-- <li><a href="{{ URL::route('bbincidence.bbfacilityreport') }}">Facility Report</a></li> -->
		<li class="active">Patient Results</li>
	</ol>
</div>
<div class="panel panel-primary">
	<div class="panel-heading ">
		Facility:: {{ \Config::get('constants.FACILITY_NAME') }} || DISTRICT:: {{ \Config::get('constants.DISTRICT_NAME') }}
	</div>
	<div class="panel-body">

		<!-- if there are creation errors, they will show here -->
		@if($errors->all())
		<div class="alert alert-danger">
			{{ HTML::ul($errors->all()) }}
		</div>
		@endif
		
        
        {{ Form::model($result, array('route' => array('poc.updateresult', $result->id), 'method' => 'PUT',
			'id' => 'form-edit-poc-result')) }}
		<div class="form-group actions-row" style="text-align:right;">
		</div>

			<div class="panel-heading "><strong>Patient Results</strong></div>
			<div class="panel-body">

				<div class="form-group">
					{{ Form::label('infant_name', 'Infant Name:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->infant_name }}

				</div>

				<div class="form-group">
					{{ Form::label('sample_id', 'Sample ID:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->sample_id }}

				</div>


				<div class="form-group">
					{{ Form::label('results', 'Results:', array('class' =>'col-sm-2 required ')) }}
					<div class="radio-inline">{{ Form::radio('results', 'Positive', false) }} <span class="input-tag">Positive</span></div>
					<div class="radio-inline">{{ Form::radio("results", 'Negative', false) }} <span class="input-tag">Negative</span></div>
					<div class="radio-inline">{{ Form::radio("results", 'Error', false) }} <span class="input-tag">Error</span></div>
				</div>
				
				<div class="form-group">
					{{ Form::label('error_code', 'Error Code:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('error_code', Input::old('error_code'), array('class' => 'form-control  col-sm-4', 'placeholder' => 'In case of error, enter error code')) }}

				</div>
				
				<div class="form-group">
					{{ Form::label('test_date', 'Test Date:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('test_date', Input::old('test_date'), array('class' => 'form-control standard-datepicker  col-sm-4')) }}
				</div>
				
				<div class="form-group">
					{{ Form::label('reviewed_by', 'Results reviewed and dispatched by:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('reviewed_by', Input::old('reviewed_by'), array('class' => 'form-control  col-sm-4')) }}

				</div>
                <div class="form-group">
					{{ Form::label('review_date', 'Reviewed and Dispatched on:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('review_date', Input::old('review_date'), array('class' => 'form-control standard-datepicker  col-sm-4')) }}
				</div>
				<div class="form-group">
					{{ Form::label('testing_device', 'Testing Device:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('testing_device', \Config::get('constants.TESTING_DEVICE'), array('class' => 'form-control  col-sm-4','readonly' => 'readonly')) }}

				</div>
				

			<div class="form-group actions-row">
				{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE RESULTS',
				['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
			</div>
			{{ Form::close() }}
			<script>
			$(".standard-datepicker-nofuture").datepicker({
				maxDate: 0
			});
		</script>

		</div>

		@stop
