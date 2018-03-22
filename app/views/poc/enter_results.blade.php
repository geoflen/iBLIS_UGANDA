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
		Facility:: {{Auth::user()->facility->name}} || Level:: {{Auth::user()->facility->level->level}} || {{Auth::user()->facility->district->name}}
	</div>
	<div class="panel-body">

		<!-- if there are creation errors, they will show here -->
		@if($errors->all())
		<div class="alert alert-danger">
			{{ HTML::ul($errors->all()) }}
		</div>
		@endif
		{{ Form::open(array('url' => 'poc/save_results/'.$patient->id, 'id' => 'form-create-bbincidence', 'autocomplete' => 'off')) }}
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
					{{ Form::label('test_date', 'Test Date:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('test_date', Input::old('test_date'), array('class' => 'form-control standard-datepicker  col-sm-4')) }}
				</div>

			<div class="form-group actions-row">
				{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE RESULTS',
				['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
			</div>
			{{ Form::close() }}
			<script>
			$(".standard-datepicker-nofuture").datepicker({
				 maxDate: new Date(),
				 dateFormat: "yy-mm-dd"
			});
		</script>

		</div>

		@stop
