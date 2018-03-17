@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	  <li class="active">{{ Lang::choice('messages.patient',2) }}</li>
	</ol>
</div>


@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		{{trans('messages.list-hbpatients')}}
		@if(Auth::user()->can('create_hb_patient'))
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('hep.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				{{trans('messages.new-patient')}}
			</a>
		</div>
		@endif
	</div>
	<div class="panel-body">
    <div class="table-responsive">
		<table class="table table-striped search-table small-font">
			<thead>
				<tr>
					<th>{{trans('messages.hep-form-patient')}}</th>
                    <th>{{trans('messages.hep-form-patientid')}}</th>
                    <th>{{trans('messages.hep-form-otherid')}}</th>
                    <th>{{trans('messages.hep-form-locatorid')}}</th>
                    <th>{{trans('messages.hep-form-facility')}}</th>
					<th>{{trans('messages.hep-form-district')}}</th>
                    <th>Status</th>
                    <th>Actions</th>
				</tr>
			</thead>
			<tbody>
			@foreach($patients as $key => $patient)
					<td>{{ $patient->patientname }}</td>
                    <td><a class="" href="{{ URL::route('hep.show', array($patient->id)) }}" >{{ $patient->patientid }}</a></td>
                    <td>{{ $patient->otherid }}</td>
                    <td>{{ $patient->locatorid }}</td>
                    <td>{{ $patient->facility->name }}</td>
                     <td>{{ $patient->district->name }}</td>
                     <td>{{getLookupValueDescription('HB_FORM_STATUS', $patient->status)}}</td>
					<td>
						@if(Auth::user()->can('patient_approve') && $patient->status == 0)
						<a class="btn btn-sm btn-info" 
							href="{{ URL::route('hep.approve', array('patient_id' => $patient->id,'status' => 1)) }}">
							<span class="glyphicon glyphicon-ok"></span>
							{{ trans('messages.hep-btn-approve') }}
						</a>
						
						<!-- show the patient (uses the show method found at GET /patient/{id} -->
						<a class="btn btn-sm btn-danger" href="{{ URL::route('hep.approve', array($patient->id, 'status' => 2)) }}" >
							<span class="glyphicon glyphicon-remove"></span>
							{{trans('messages.heb-btn-reject')}}
						</a>
						@endif
                        @if(Auth::user()->can('patient-create'))
                        <a class="btn btn-sm btn-info" 
							href="{{ URL::route('hep.update', array('patient_id' => $patient->id)) }}">
							<span class="glyphicon glyphicon-edit"></span>
							{{ trans('messages.hep-btn-edit') }}
						</a>
                        @endif
					</td>
				</tr>
			@endforeach
			</tbody>
		</table>
        </tbody>
		<?php //echo $patients->links(); 
		//Session::put('SOURCE_URL', URL::full());?>
	</div>
</div>
@stop