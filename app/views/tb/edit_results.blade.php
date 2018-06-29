@extends("layout")
@section("content")
<?php

$res_mtbnotdetected = $res_mtbdetected = $res_invalid = $res_error = $res_noresult = false;


if($result->xpert_mtb_results == 'MTB Not detected')
{
$res_mtbnotdetected = true;
}
elseif($result->xpert_mtb_results=='MTB detected')
{
	$res_mtbdetected = true;
}
elseif($result->xpert_mtb_results =='Error')
{
	$res_error = true;
}
elseif($result->xpert_mtb_results =='Invalid')
{
	$res_invalid = true;
}
elseif($result->xpert_mtb_results =='No result')
{
	$res_noresult = true;
}
?>

<?php
$res_notapplicable = $res_rifresistancedetected = $res_rifresistancenotdetected = $res_indeterminate = false;

if ($result->rif_resistant_status == 'Not Applicable')
{

$res_notapplicable = true;

}
elseif ($result->rif_resistant_status == 'Rif resistance detected') {
	$res_rifresistancedetected = true;
}
elseif ($result->rif_resistant_status == 'Rif resistance not detected') {
	$res_rifresistancenotdetected = true;
}
elseif ($result->rif_resistant_status ==  'Indeterminate') {
	 $res_indeterminate = true;
}
 ?>
 
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
		{{ Form::open(array('url' => 'tb/update_results/'.$patient->id, 'id' => 'form-edit-tbresults', 'autocomplete' => 'off')) }}
		<div class="form-group actions-row" style="text-align:right;">
		</div>

			<div class="panel-heading "><strong>XPERT MTB/RIF RESULTS</strong></div>
			<div class="panel-body">

				<div class="form-group">
					{{ Form::label('infant_name', 'Infant Name:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->patient_name }}

				</div>

				<div class="form-group">
					{{ Form::label('age', 'Age:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->age }}

				</div>
				<div class="panel-body" style="width:30%">
					<div class="form-group">
						<table class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th>XPERT MTB RESULTS</th>
									<th>RIF RESISTANCE STATUS</th>
								</tr>
							</thead>
							<tbody>
								<td>
					<div class="radio-inline">{{ Form::radio('xpert_mtb_results', 'mtb not detected', $res_mtbnotdetected) }} <span class="input-tag">MTB NOT DETECTED</span></div><br>
					<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'mtb detected', $res_mtbdetected) }} <span class="input-tag">MTB DETECTED</span></div><br>
					<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'invalid',  $res_invalid) }} <span class="input-tag">INVALID</span></div><br>
					<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'error', $res_error) }} <span class="input-tag">ERROR</span></div><br>
					<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'no result', $res_noresult ) }} <span class="input-tag">NO RESULT</span></div><br>

			</td>
			<td>
					<div class="radio-inline">{{ Form::radio('rif_resistant_status', 'not applicable', $res_notapplicable) }} <span class="input-tag">NOT APPLICABLE</span></div><br>
					<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'rif resistance not detected', $res_rifresistancenotdetected) }} <span class="input-tag">RIF RESISTANCE NOT DETECTED</span></div><br>
					<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'rif resistance detected', $res_rifresistancenotdetected) }} <span class="input-tag">RIF RESISTANCE DETECTED</span></div><br>
					<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'indeterminate', $res_indeterminate) }} <span class="input-tag">INDETERMINATE</span></div><br>
				</div>
			</td>
		</tbody>
	</table>
				<div class="form-group">
					{{ Form::label('test_by', 'Name of Lab Personnel:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('test_by', $result->test_by, array('class' => 'form-control  col-sm-4')) }}
				</div>

				<div class="form-group">
					{{ Form::label('test_date', 'Test Date:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('test_date', $result->test_date, array('class' => 'form-control standard-datepicker-nofuture  col-sm-4')) }}
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
