@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
		<li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		<li><a href="{{ URL::route('poc.index') }}">TB-Genexpert Patient Data</a></li>
		<!-- <li><a href="{{ URL::route('bbincidence.bbfacilityreport') }}">Facility Report</a></li> -->
		<li class="active">New Patient </li>
	</ol>
</div>
<div class="panel panel-default">
	<div class="panel-heading ">
		<h5 style="text-align:right; color:red;">Form Serial Number: 7647 <h5>


		</div>
		<div class="panel-body">

			<!-- if there are creation errors, they will show here -->
			@if($errors->all())
			<div class="alert alert-danger">
				{{ HTML::ul($errors->all()) }}
			</div>
			@endif
			{{ Form::open(array('url' => 'tb', 'id' => 'form-create-tb', 'autocomplete' => 'on')) }}
			<div class="form-group actions-row" style="text-align:right;">
			</div>
			<div class="panel panel-primary">

				<div class="panel-heading "><strong>1. Facility Information </strong></div>
				<div class="panel-body">
					<div class="form-group">
						<div class="panel-body">
							<table class="table table-bordered table-hover table-condensed">
								<tbody>
									<tr>
										<td>Facility Code:  {{ \Config::get('constants.FACILITY_CODE') }}</td>
										<th>Facility Name:  {{ \Config::get('constants.FACILITY_NAME') }}</th>
									</tr>

									<tr>
										<td>District Name:  {{ \Config::get('constants.DISTRICT_NAME') }}</td>
										<td class="hidden">
										</tr>

									</tbody>


								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-primary">

					<div class="panel-heading "><strong>2.Requesting Officer</strong></div>
					<div class="panel-body">
						<div class="form-group">
							<div class="panel-body">
								<table class="table table-bordered table-hover table-condensed">
									<tbody>
										<tr>
											<td><div class="form-group">
												{{ Form::label('officer_surname', 'Surname:',array('class' =>'col-sm-2')) }}
												{{ Form::text('officer_surname', Input::old('officer_surname'), array('class' => 'form-control col-sm-4')) }}
											</div>
										</td>
										<td>
											<div class="form-group">
												{{ Form::label('othername', 'Other names:',array('class' =>'col-sm-2')) }}
												{{ Form::text('officer_othername', Input::old('officer_othername'), array('class' => 'form-control col-sm-4')) }}
											</div>
										</td>
										<td>
											<div class="form-group">
												{{ Form::label('cadre', 'Cadre:',array('class' =>'col-sm-2')) }}
												{{ Form::text('cadre', Input::old('cadre'), array('class' => 'form-control col-sm-4')) }}
											</div>
										</td>
									</tr>
									<tr>
										<td><div class="form-group">
											{{ Form::label('officer_contact', 'Telephone:',array('class' =>'col-sm-2')) }}
											{{ Form::text('officer_contact', Input::old('officer_contact'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('officer_email', 'Email address:',array('class' =>'col-sm-2')) }}
											{{ Form::email('officer_email', Input::old('officer_email'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>

										<div class="form-group">
											{{ Form::label('request_date', 'Date of request:',array('class' =>'col-sm-2')) }}
											{{ Form::text('request_date', Input::old('request_date'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}
										</div>
										<div class="form-group">
											{{ Form::label('request_time', 'Time of request:',array('class' =>'col-sm-2')) }}
											{{ Form::email('request_time', Input::old('request_time'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-primary">
				<div class="panel-heading "><strong>3. Patient / Client Information</strong></div>
				<div class="panel-body">
					<div class="form-group">
						<div class="panel-body">
							<table class="table table-bordered table-hover table-condensed">
								<tbody>
									<tr>
										<td><div class="form-group">
											{{ Form::label('surname', 'Surname:',array('class' =>'col-sm-2')) }}
											{{ Form::text('surname', Input::old('surname'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('othername', 'Other names:',array('class' =>'col-sm-2')) }}
											{{ Form::text('othername', Input::old('othername'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('lab_id', 'Lab ID:',array('class' =>'col-sm-2')) }}
											{{ Form::text('lab_id', Input::old('lab_id'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td class="hidden">
									</tr>
									<tr>
										<td><div class="form-group">
											{{ Form::label('nin', 'Patient National Identification Number (NIN):',array('class' =>'col-sm-2')) }}
											{{ Form::text('nin', Input::old('nin'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('opd_ipd', 'Patient Number (OPD / IPD):',array('class' =>'col-sm-2')) }}
											{{ Form::text('opd_ipd', Input::old('opd_ipd'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>

										<div class="form-group">
											{{ Form::label('date_of_birth', 'Date of birth:',array('class' =>'col-sm-2')) }}
											{{ Form::text('date_of_birth', Input::old('date_of_birth'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}
										</div>
									</td>

									<td>
										<div class="form-group">
											{{ Form::label('age', 'Age:',array('class' =>'col-sm-2')) }}
											{{ Form::text('age', Input::old('age'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
								</tr>

								<tr>
									<td>
										Sex:<div class="form-group">
											<div class="radio-inline">{{ Form::radio("sex", 'male', false) }} <span class="input-tag">Male</span></div><br>
											<div class="radio-inline">{{ Form::radio("sex", 'female', false) }} <span class="input-tag">Female</span></div><br>
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('occupation', 'Occupation:',array('class' =>'col-sm-2')) }}
											{{ Form::text('occupation', Input::old('occupation'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
									<td>
										<div class="form-group">
											{{ Form::label('contact', 'Telephone Number(s):',array('class' =>'col-sm-2')) }}
											{{ Form::text('contact', Input::old('contact'), array('class' => 'form-control col-sm-4')) }}

										</div>
									</td>

									<td>
										<div class="form-group">
											{{ Form::label('email', 'Email',array('class' =>'col-sm-2')) }}
											{{ Form::text('email', Input::old('email'), array('class' => 'form-control col-sm-4')) }}
										</div>
									</td>
								</tr>

								<tbody>
								</table>
							</div>
						</div>
					</div>
				</div>


				<div class="panel panel-primary">
					<div class="panel-heading "><strong>4. Clincal Information <i>(Tick major clinical signs and symptoms that apply)</i></strong></div>
					<div class="panel-body">
						<table class="table table-bordered table-hover table-condensed">
							<tbody>
								<tr>
									<td>Hospitalized for more than 2days (48 hours)?
										<br>
										<div class="radio-inline">{{ Form::radio("hospitalized", 'yes', false) }} <span class="input-tag">Yes</span></div><br>
										<div class="radio-inline">{{ Form::radio("hospitalized", 'no', false) }} <span class="input-tag">No</span></div><br>
									</td>
									<td class="hidden">

									</tr>
									<tr>
										<td>
											Patient transferred from another health facility? Y/N <br>
											<div class="radio-inline">{{ Form::radio("another_facility", 'yes', false) }} <span class="input-tag">Yes</span></div><br>
											<div class="radio-inline">{{ Form::radio("another_facility", 'no', false) }} <span class="input-tag">No</span></div><br>
											<td class="hidden">
											</td>

											<td>If YES, Name facility that has referred patient<br>
												<div class="form-group">
													{{ Form::text('referring_facility', Input::old('referring_facility'), array('class' => 'form-control col-sm-4')) }}
												</div>
												<td class="hidden">
												</td>
											</tr>
											<tr>
												<td>
													Has the patient been on antibiotics during current infection?
													<br>
													<div class="radio-inline">{{ Form::radio("antiobiotics", 'yes', false) }} <span class="input-tag">Yes</span></div><br>
													<div class="radio-inline">{{ Form::radio("antiobiotics", 'no', false) }} <span class="input-tag">No</span></div><br>

													<td>If YES, specify antibiotics administered to patient <br>
														<div class="form-group">
															{{ Form::text('antiobiotics', Input::old('antiobiotics'), array('class' => 'form-control col-sm-4')) }}
														</div>
													</td>
													<td>
														<div class="form-group">
															{{ Form::label('antibiotics_duration', 'Duration on antibiotics:',array('class' =>'col-sm-2')) }}
															{{ Form::text('antibiotics_duration', Input::old('antibiotics_duration'), array('class' => 'form-control col-sm-4', 'placeholder' => 'Days')) }}
														</div>
													</td>
												</tr>

												<tr>
													<td><h5><i>Provisional Diagnosis/disease suspected(Diagnosis notes should reflect the reason for requisition of lab test(s)</i> </h5>
														<input type="text" name='provisional_diagnosis' placeholder='Provisional Diagnosis/disease suspected(Diagnosis notes should reflect the reason for requisition of lab test(s)' class="form-control"/>
													</td>
													<td class="hidden">
														<td>
															<td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="panel panel-primary">
												<div class="panel-heading "><strong>5. Specimen Information</strong></div>
												<div class="panel-body">
													<div class="form-group">
														<table class="table table-bordered table-hover table-condensed">
															<thead>
																<tr>
																	<th>Tick the type of specimen</th>
																</tr>
															</thead>
															<tbody>
																<td>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Sputum', false) }} <span class="input-tag">Sputum</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Gastric Aspirate', false) }} <span class="input-tag">Gastric Aspirate</span></div> <br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Bronchoalveolar lavage', false) }} <span class="input-tag">Bronchoalveolar lavage</span></div> <br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Tracheal Aspirate', false) }} <span class="input-tag">Tracheal Aspirate</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Mid Stream Urine', false) }} <span class="input-tag">Mid Stream Urine</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Catheter urine', false) }} <span class="input-tag">Catheter urine</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Supra-pubic', false) }} <span class="input-tag">Supra-pubic</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Lymphnode Aspirate', false) }} <span class="input-tag">Lymphnode Aspirate</span></div><br>
																</td>

																<td>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'CSF', false) }} <span class="input-tag">CSF</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Blood', false) }} <span class="input-tag">Blood</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Bone Marrow', false) }} <span class="input-tag">Bone Marrow</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Synovial Fluid', false) }} <span class="input-tag">Synovial Fluid</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Pleural Fluid', false) }} <span class="input-tag">Pleural Fluid</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Pericardial Fluid', false) }} <span class="input-tag">Pericardial Fluid</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Ascitic Fluid', false) }} <span class="input-tag">Ascitic Fluid</span></div><br>
																</td>

																<td>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Pus Aspirate', false) }} <span class="input-tag">Pus Aspirate</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Stool', false) }} <span class="input-tag">Stool</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Rectal Swab', false) }} <span class="input-tag">Rectal Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Urethral Swab', false) }} <span class="input-tag">Urethral Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Cervical Swab', false) }} <span class="input-tag">Cervical Swab</span></div><br>
																</td>

																<td>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Nasal Swab', false) }} <span class="input-tag">Nasal Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Eye Swab', false) }} <span class="input-tag">Eye Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Throat Swab', false) }} <span class="input-tag">Throat Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Ear Swab', false) }} <span class="input-tag">Ear Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'High Vaginal Swab', false) }} <span class="input-tag">High Vaginal Swab</span></div><br>

																</td>

																<td>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Vitreous Swab', false) }} <span class="input-tag">Vetreous Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Conjuntival Swab', false) }} <span class="input-tag">Conjuntival Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Conrnial Swab', false) }} <span class="input-tag">Cornial Swab</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Biopsy Tissue', false) }} <span class="input-tag">Biopsy Tissue</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Skin Snip / Nail / Hair', false) }} <span class="input-tag">Skin Snip / Nail /Hair</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Beverages', false) }} <span class="input-tag">Beverages</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Food', false) }} <span class="input-tag">Food</span></div><br>
																	<div class="radio-inline">{{ Form::radio("specimentype", 'Water', false) }} <span class="input-tag">Water</span></div><br>
																</td>

																<td>
																	<div class="form-group">
																		{{ Form::label('specimentype', 'Other (specify):',array('class' =>'col-sm-2')) }}
																		{{ Form::text('specimentype', Input::old('specimentype'), array('class' => 'form-control col-sm-4')) }}
																	</div>
																</td>
															</tbody>
														</table>

														<div class="form-group">
															{{ Form::label('collected_by', 'Specimen Collected By:',array('class' =>'col-sm-2')) }}
															{{ Form::text('Collected_by', Input::old('Collected_by'), array('class' => 'form-control col-sm-4')) }}

															{{ Form::label('collection_date', 'Date Of Collection:',array('class' =>'col-sm-2')) }}
															{{ Form::text('collection_date', Input::old('collection_date'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}


															{{ Form::label('collection_time', 'Time Of Collection:',array('class' =>'col-sm-2')) }}
															{{ Form::text('collection_time', Input::old('collection_time'), array('class' => 'form-control col-sm-4')) }}
														</div>
														<div class="form-group">
															{{ Form::label('dispatch_date', 'Date of dispatch to testing lab:',array('class' =>'col-sm-2')) }}
															{{ Form::text('dispatch_date', Input::old('dispatch_date'), array('class' => 'form-control standard-datepicker standard-datepicker-nofuture col-sm-4', 'placeholder' => 'DD-MM-YYYY')) }}

															{{ Form::label('dispatch_time', 'Time of dispatch to testing lab:',array('class' =>'col-sm-2')) }}
															{{ Form::text('dispatch_time', Input::old('dispatch_time'), array('class' => 'form-control col-sm-4')) }}
														</div>
													</div>

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
