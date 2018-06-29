@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
		<li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		<li><a href="{{ URL::route('tb.index') }}">TB-Genexpert Patient Data</a></li>
		<!-- <li><a href="{{ URL::route('bbincidence.bbfacilityreport') }}">Facility Report</a></li> -->
		<li class="active">New Patient </li>
	</ol>
</div>
<div class="panel panel-default">
	<div class="panel-heading ">
		<h4>Gen Xpert Request & Report Form - HMIS Form 3b <h4>


		</div>
		<div class="panel-body">

			<!-- if there are creation errors, they will show here -->
			@if($errors->all())
			<div class="alert alert-danger">
				{{ HTML::ul($errors->all()) }}
			</div>
			@endif
				<!-- {{ Form::open(array('url' => 'tb/update_results/'.$patient->id, 'id' => 'form-edit-tb', 'autocomplete' => 'off')) }} -->
				{{ Form::model($patient, array('route' => array('tb.update', $patient->id), 'method' => 'PUT','id' => 'form-edit-tb')) }}
			<div class="form-group actions-row" style="text-align:right;">
			</div>
			<div class="panel panel-primary">

				<div class="panel-heading "><strong>1. Facility Information </strong></div>
				<div class="panel-body">
					<div class="form-group">
						<div class="panel-body">

							<div class="form-group">
								{{ Form::label('ref_facility', 'Referring Health Unit:',array('class' =>'col-sm-2')) }}
								{{ Form::text('ref_facility', Input::old('ref_facility'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('district_id', 'District:', array('class' => 'col-sm-2')) }}
								{{ Form::select('district_id', array(null => 'select district...')+$district,$patient->district_id, array('class' => 'form-control', 'id' => 'district_id')) }}
								<br>

								{{ Form::label('region', 'Region:', array('class' => 'col-sm-2')) }}
								{{ Form::select('region', array(null => 'select region...')+$region, $patient->region, array('class' => 'form-control', 'id' => 'district_id')) }}
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading "><strong>2. Patient / Client Information</strong></div>
					<div class="panel-body">

						<div class="panel-body">

							<div class="form-group">
								{{ Form::label('patient_name', 'Patient Name:',array('class' =>'col-sm-2')) }}
								{{ Form::text('patient_name', Input::old('patient_name'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('age', 'Age:',array('class' =>'col-sm-2')) }}
								{{ Form::text('age', Input::old('age'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('gender', 'Gender:', array('class' =>'col-sm-2 required ')) }}
								<div class="radio-inline">{{ Form::radio('gender', 'Male', false) }} <span class="input-tag">Male</span></div>
								<div class="radio-inline">{{ Form::radio("gender", 'Female', false) }} <span class="input-tag">Female</span></div>
							</div>

							<div class="form-group">
								{{ Form::label('patient_nin', 'Patient NIN:',array('class' =>'col-sm-2')) }}
								{{ Form::text('patient_nin', Input::old('patient_nin'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('subcounty', 'Sub County:',array('class' =>'col-sm-2')) }}
								{{ Form::text('subcounty', Input::old('subcounty'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('village', 'LC1 / Village:',array('class' =>'col-sm-2')) }}
								{{ Form::text('village', Input::old('village'), array('class' => 'form-control col-sm-4')) }}
							</div>

							<div class="form-group">
								{{ Form::label('patient_contact', 'Patient Phone Number(s):',array('class' =>'col-sm-2')) }}
								{{ Form::text('patient_contact', Input::old('patient_contact'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('next_of_kin', 'Next Of Kin Contact:',array('class' =>'col-sm-2')) }}
								{{ Form::text('next_of_kin', Input::old('next_of_kin'), array('class' => 'form-control col-sm-4')) }}
							</div>

							<div class="form-group">
								{{ Form::label('sputum_collection_date', 'Date Sputum Collected:',array('class' =>'col-sm-2')) }}
								{{ Form::text('sputum_collection_date', Input::old('sputum_collection_date'),array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}

								{{ Form::label('sputum_collection_time', 'Time Sputum Collected:',array('class' =>'col-sm-2')) }}
								{{ Form::text('sputum_collection_time', Input::old('sputum_collection_time'), array('class' => 'form-control col-sm-4')) }}
							</div>

							<div class="form-group">
								{{ Form::label('collected_by', 'Sample Collected By:',array('class' =>'col-sm-2')) }}
								{{ Form::text('collected_by', Input::old('collected_by'),array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('collection_officer_contact', 'Phone Contact:',array('class' =>'col-sm-2')) }}
								{{ Form::text('collection_officer_contact', Input::old('collection_officer_contact'), array('class' => 'form-control col-sm-4')) }}
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading "><strong>3. To be filled by Requesting Health Facility</i></strong></div>
					<div class="panel-body">
						<div class="form-group">
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>TYPE OF PATIENT</th>
										<th>HIV STATUS</th>
										<th>SPUTUM SMEAR RESULTS</th>
										<th>CHEST X-RAY STATUS</th>
									</tr>
								</thead>
								<tbody>
									<td>
										<div class="radio-inline">{{ Form::radio("patient_type", 'HIV Positive', false) }} <span class="input-tag">HIV Positive</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'children (0-14 years)', false) }} <span class="input-tag">Children (0-14years)</span></div> <br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Diabetic', false) }} <span class="input-tag">Diabetic</span></div> <br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Contact of DR TB', false) }} <span class="input-tag">Contact of DR TB</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Smear POS at 2months', false) }} <span class="input-tag">Smear Pos at 2months</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Treatment failure', false) }} <span class="input-tag">Treatment Failure</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Relapse', false) }} <span class="input-tag">Relapse</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Lost to follow up', false) }} <span class="input-tag">Lost to follow up</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Health worker', false) }} <span class="input-tag">Health Worker</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Pregnant /  Lactating Mother', false) }} <span class="input-tag">Pregnant / Lactating Mother</span></div><br>
										<div class="radio-inline">{{ Form::radio("patient_type", 'Prisoners & Refugees', false) }} <span class="input-tag">Prisoner & Refugees</span></div><br><br>
										<div class="text-inline">{{ Form::radio("patient_type", 'Other', false) }} <span class="input-tag">Other</span></div><br><br>
<!--
											{{ Form::label('patient_type', 'Other (specify):',array('class' =>'col-sm-2')) }}
											{{ Form::text('patient_type', Input::old('patient_type'), array('class' => 'form-control col-sm-4')) }} -->

									</td>

									<td>
										<div class="radio-inline">{{ Form::radio("hiv_status", 'Positive', false) }} <span class="input-tag">Positive</span></div><br>
										<div class="radio-inline">{{ Form::radio("hiv_status", 'Negative', false) }} <span class="input-tag">Negative</span></div><br>
										<div class="radio-inline">{{ Form::radio("hiv_status", 'Unknown', false) }} <span class="input-tag">Unknown</span></div><br>

									</td>

									<td>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Negative', false) }} <span class="input-tag">Negative</span></div><br>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Positive Scanty', false) }} <span class="input-tag">Positive Scanty</span></div><br>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Positive 1+', false) }} <span class="input-tag">Positive 1+</span></div><br>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Positive 2+', false) }} <span class="input-tag">Positive 2+</span></div><br>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Positive 3+', false) }} <span class="input-tag">Positive 3+</span></div><br>
										<div class="radio-inline">{{ Form::radio("sputum_smear_results", 'Unknown', false) }} <span class="input-tag">Unknown</span></div><br>
									</td>

									<td>
										<div class="radio-inline">{{ Form::radio("chest_xray_status", 'Unknown', false) }} <span class="input-tag">Unknown</span></div><br>
										<div class="radio-inline">{{ Form::radio("chest_xray_status", 'Abnormal', false) }} <span class="input-tag">Abnormal</span></div><br>
										<div class="radio-inline">{{ Form::radio("chest_xray_status", 'Normal', false) }} <span class="input-tag">Normal</span></div><br>
									</td>

								</tbody>
							</table>

							<div class="form-group">
								{{ Form::label('requested_by', 'Requesting Clincian:',array('class' =>'col-sm-2')) }}
								{{ Form::text('requested_by', Input::old('requested_by'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('request_date', 'Request Date:',array('class' =>'col-sm-2')) }}
								{{ Form::text('request_date', Input::old('request_date'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}


								{{ Form::label('requesting_officer_contact', 'Phone No.:',array('class' =>'col-sm-2')) }}
								{{ Form::text('requesting_officer_contact', Input::old('requesting_officer_contact'), array('class' => 'form-control col-sm-4')) }}
							</div>
							<div class="form-group">
								{{ Form::label('genexpert_site', 'Gene Xpert Site:',array('class' =>'col-sm-2')) }}
								{{ Form::text('genexpert_site', Input::old('genexpert_site'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('district', 'District:',array('class' =>'col-sm-2')) }}
								{{ Form::text('district', Input::old('district'), array('class' => 'form-control col-sm-4')) }}
							</div>

							<div class="form-group">
								{{ Form::label('received_by', 'Sample Received By:',array('class' =>'col-sm-2')) }}
								{{ Form::text('received_by', Input::old('received_by'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('date_received', 'Date:',array('class' =>'col-sm-2')) }}
								{{ Form::text('date_received', Input::old('date_received'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}

							</div>
						</div>
					</div>
				</div>
				<!-- <div class="panel panel-primary">
					<div class="panel-heading "><strong>4. To be filled by Testing Laboratory</i></strong></div>
					<div class="panel-body">
						<div class="form-group">
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									XPERT MTB / RIF RESULTS
									<tr>
										<th>XPERT MTB RESULTS</th>
										<th>RIF RESISTANCE STATUS</th>
									</tr>
								</thead>
								<tbody>
									<td>
										<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'MTB Not Detected', false) }} <span class="input-tag">MTB Not Detected</span></div><br>
										<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'MTB Detected', false) }} <span class="input-tag">MTB Detected</span></div> <br>
										<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'Invalid', false) }} <span class="input-tag">Invalid</span></div> <br>
										<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'Error', false) }} <span class="input-tag">Error</span></div><br>
										<div class="radio-inline">{{ Form::radio("xpert_mtb_results", 'No result', false) }} <span class="input-tag">No result</span></div><br>
									</td>

									<td>
										<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'Not Applicable', false) }} <span class="input-tag">Not Applicable</span></div><br>
										<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'Rif Resistance not detected', false) }} <span class="input-tag">Rif Resistance Not Detected</span></div><br>
										<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'Rif Resistance Detected', false) }} <span class="input-tag">Rif Resistance Detected</span></div><br>
										<div class="radio-inline">{{ Form::radio("rif_resistant_status", 'Indeterminate', false) }} <span class="input-tag">Indeterminate</span></div><br>
									</td>
								</tbody>
							</table>

							<div class="form-group">
								{{ Form::label('tested_by', 'Name Of Lab Personnel:',array('class' =>'col-sm-2')) }}
								{{ Form::text('tested_by', Input::old('tested_by'), array('class' => 'form-control col-sm-4')) }}

								{{ Form::label('test_date', 'Date Tested:',array('class' =>'col-sm-2')) }}
								{{ Form::text('test_date', Input::old('test_date'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}

							</div> -->


							<div class="form-group actions-row" style="text-align:right;">
								{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE',
								['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
							</div>


							{{ Form::close() }}
							<script>
								$(".standard-datepicker-nofuture").datepicker({
									maxDate: new Date(),
									dateFormat: "yy-mm-dd",
									changeMonth: true,
									changeYear: true,
								});
							</script>

						</div>
						<div>
						</div>
					</div>
					@stop
