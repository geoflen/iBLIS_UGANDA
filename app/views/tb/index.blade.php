@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
		<li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
		<li class="active">{{ Lang::choice('messages.patient',2) }}</li>
	</ol>
</div>

<div class="panel panel-default">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-book"></span> <br>
		TB-Genexpert Patient Data
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('tb.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				{{trans('messages.new-patient')}}
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-striped table-bordered table-hover table-condensed search-table">
			<thead>
				<tr>
					<th>#</th>
					<th>Referring Health Unit</th>
					<th>District</th>
					<th>Region</th>
					<th>Patient Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Contact</th>
					<th>XPERT MTB Results</th>
					<th>RIF Resistance Status</th>
					<th>Tested By</th>
					<th>Gene Xpert Site</th>
					<th>Test Date</th>
					<th>{{trans('messages.actions')}}</th>
				</tr>
			</thead>

			<tbody>
				<?php $row=1; ?>
				@foreach($patients as $key => $patient)
				<tr  @if(Session::has('activepatient'))
				{{(Session::get('activepatient') == $patient->id)?"class='info'":""}}
				@endif

				<tr>
					<td class="text-center">{{ $row }}</td>
					<td>{{ $patient->ref_facility }}</td>
					<td>{{ $patient->district }}</td>
					<td>{{ $region[$patient->region]  }}</td>
					<td>{{ $patient->patient_name }}</td>
					<td>{{ $patient->gender }}</td>
					<td class="text-center">{{ $patient->age}}</td>
					<td>{{ $patient->patient_contact}}</td>
					<td>{{$patient->xpert_mtb_results}}</td>
					<td>{{$patient->rif_resistant_status}}</td>
					<td>{{$patient->test_by}}</td>
					<td>{{ $patient->genexpert_site}}</td>
					<td>{{$patient->test_date}}</td>
					<td>

						@if(Auth::user()->can('request_test') and empty($patient->xpert_mtb_results))
						<a class="btn btn-sm btn-warning" href="{{ URL::route('tb.enter_results', array($patient->id)) }}"
							<span class="glyphicon glyphicon-edit"></span>
							Enter Results
						</a>
						@endif

						@if(($patient->xpert_mtb_results) || ($patient->rif_resistant_status) != '')
						<!-- show the patient (uses the show method found at GET /patient/{id} -->
						<a class="btn btn-sm btn-success" href="{{ URL::route('tb.show', array($patient->id)) }}" >
							<span class="glyphicon glyphicon-eye-open"></span>
							{{trans('messages.view')}}
						</a>

						<a class="btn btn-sm btn-info" href="{{ URL::route('tb.edit_results', array($patient->id)) }}"
							<span class="glyphicon glyphicon-edit"></span>
							Edit Results
						</a>
						@else
						<!-- edit this patient (uses the edit method found at GET /patient/{id}/edit -->
						<a class="btn btn-sm btn-info" href="{{ URL::route('tb.edit', array($patient->id)) }}" >
							<span class="glyphicon glyphicon-edit"></span>
							{{trans('messages.edit')}}
						</a>
						</a>
@endif
					</td>
				</tr>
				<?php $row++; ?>
				@endforeach
			</tbody>
		</table>

	</div>
</div>
@stop
