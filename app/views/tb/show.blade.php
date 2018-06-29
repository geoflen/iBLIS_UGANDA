@extends("layout")
@section("content")
<div>
  <ol class="breadcrumb">
    <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
    <li><a href="{{ URL::route('tb.index') }}">{{ Lang::choice('messages.patient',2) }}</a></li>
    <li class="active">{{ trans('messages.patient-details') }}</li>
  </ol>
</div>
<div class="panel panel-primary">
  <div class="panel-heading">
    <span class="glyphicon glyphicon-user"></span> <br>
    Full Patient Details
    <div class="panel-btn">
      <a class="btn btn-sm btn-info" href="{{ URL::route('tb.edit', array($patient->id)) }}">
        <span class="glyphicon glyphicon-edit"></span>
        {{ trans('messages.edit') }}
      </a>
      @if(Auth::user()->can('request_test'))
      <a class="btn btn-sm btn-info"
      href="#">
      <span class="glyphicon glyphicon-print"></span>
      Print Result
    </a>
    @endif
  </div>
</div>
<div class="panel-body">
  <div class="display-details">
    <h3 class="view"><strong>Patient Data:</strong></h3>
    <div class="panel-body" style="width:50%">
      <div class="form-group">
        <p class="view-striped"><strong>Patient's Name:</strong>{{ $patient->patient_name}}</p>
        <p class="view-striped"><strong>Patient's Age:</strong>{{ $patient->age}}</p>

        <p class="view-striped"><strong>Patient's Mobile No:</strong>{{ $patient->patient_contact}}</p>
        <p class="view-striped"><strong>Patient NIN:</strong>{{ $patient->patient_nin}}</p>
        <p class="view-striped"><strong>Next Of Kin Contact:</strong>{{ $patient->next_of_kin}}</p>
        <p class="view"><strong>Type Of Patient:</strong> {{$patient->patient_type}}
        <p class="view"><strong>HIV Status</strong> {{$patient->hiv_status}}
        <p class="view"><strong>Sputum Smear Results:</strong> {{$patient->sputum_smear_results}}
        <p class="view-striped"><strong>Chest Xray Status:</strong>{{ $patient->chest_xray_status}}</p>
        <table class="table table-bordered table-hover table-condensed">
          <thead>
            <tr>
              <th style="color:blue">XPERT MTB RESULTS</th>
              <th style="color:blue" >RIF RESISTANCE STATUS</th>
            </tr>

          </thead>
          <tbody>
            @if($patient->xpert_mtb_results == 'MTB detected')
            <td style="color:red">
              {{$patient->xpert_mtb_results}}
            </td>
            @else
            <td style="color:green">
              {{$patient->xpert_mtb_results}}
            </td>
            @endif

            <td>
              {{$patient->rif_resistant_status}}
            </td>

          </tbody>
        </table>
        <p class="view-striped"><strong>Requesting Clincian:</strong>{{ $patient->requested_by}}</p>
        <p class="view-striped"><strong>Phone No.:</strong>{{ $patient->requesting_officer_contact}}</p>
        <p class="view-striped"><strong>Request Date: </strong> {{ $patient->request_date}} </p>
              </div>
            </div>
          </div>
          @stop
