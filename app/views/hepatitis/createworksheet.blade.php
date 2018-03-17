@extends("layout")
@section("content")
<style>
	
.form-group .form-control {
	width: 100%;
}

form .container, .form-group > label{
	width:100%;
}
form .container{
	padding-right: 570px;
}	
.form{
	font-size: 1.5rem;
}
.form-group > label{
	font-size:13px;
}
.form-control{
	font-size:13px;
}
.row + .row{
	margin-top:5px;
}
.row.no-space{
	margin-top: 0;
}
.includecalibrators input[type="radio"]{
	margin:0;
}
</style>
<script type="text/javascript" src="{{ URL::asset('js/bootstrapValidator.min.js') }} "></script>
<script>
	$(document).ready(function() {
	$('#hep-worksheet-form').bootstrapValidator({
            
            fields: {
                sampleprep: {
                    validators: {
                        notEmpty: {
                            message: 'enter the sample rep'
                        }
                    }
                },
				sampleprepexpirydate: {
                    validators: {
                        notEmpty: {
                            message: 'select a the sample prep expiry date'
                        }
                    }
                },
				control: {
                    validators: {
                        notEmpty: {
                            message: 'enter the control'
                        }
                    }
                },
				sampleprepexpirydate: {
                    validators: {
                        notEmpty: {
                            message: 'select the sample prep expiry date'
                        }
                    }
                },
				calibrator: {
                    validators: {
                        notEmpty: {
                            message: 'enter the calibrator'
                        }
                    }
                },
				calibratorexpirydate: {
                    validators: {
                        notEmpty: {
                            message: 'select the calibrator expiry date'
                        }
                    }
                },
				amplificationkit: {
                    validators: {
                        notEmpty: {
                            message: 'enter the amplification kit'
                        }
                    }
                },
				amplificationkitexpirydate: {
                    validators: {
                        notEmpty: {
                            message: 'select the sample amplification kit expiry date'
                        }
                    }
                },
				assaydate: {
                    validators: {
                        notEmpty: {
                            message: 'select the sample assay date'
                        }
                    }
                },
				includecalibrators: {
                    validators: {
                        notEmpty: {
                            message: 'select whether to include calibrators'
                        }
                    }
                }
				
			//end of validators 
           }
       });	
		
	});
	</script>
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
		  <li class="active"><a href="{{ URL::route('hep.index') }}">{{Lang::choice('messages.hb-submenu-patients',2)}}</a></li>
		  <li class="active">{{trans('messages.hb-submenu-add-patient')}}</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-adjust"></span>
			{{trans('messages.hep-form-title')}}
		</div>
		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif

			{{ Form::open(array('route' => 'hep.storeworksheet', 'id' => 'hep-worksheet-form')) }}
                <div class="container">
                    <div class="row no-space">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('name', Lang::choice('messages.hep-form-worksheet-refnumber',2)) }}
                                 {{ Form::text('refnumber', $ref_number, ['class' => 'form-control', 'readonly','true']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('machinetype', Lang::choice('messages.hep-form-worksheet-machine',1)) }}
                                {{ Form::select('machinetype', $machinetypes, $machinetype, ['class' => 'form-control','readonly'=>'true']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('sampletype', Lang::choice('messages.hep-form-worksheet-sampletype',1)) }}
                                {{ Form::select('sampletype', $sampletypes, null, ['class' => 'form-control']) }}
                            </div>
                           </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('sampleprep', Lang::choice('messages.hep-form-worksheet-sampleprep',1)) }}
                                 {{ Form::text('sampleprep', Input::old('sampleprep'), ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('sampleprepexpirydate', Lang::choice('messages.hep-form-worksheet-sampleprepexpirydate',1)) }}
                                {{ Form::text('sampleprepexpirydate', Input::old('hbdiagonosisdate'), array('class' => 'form-control standard-datepicker sampleprepexpirydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('bulklysisbuffer', Lang::choice('messages.hep-form-worksheet-bulklysisbuffer',1)) }}
                                 {{ Form::text('bulklysisbuffer', Input::old('bulklysisbuffer'), ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('bulklysisbufferexpirydate', Lang::choice('messages.hep-form-worksheet-bulklysisbufferexpirydate',1)) }}
                                {{ Form::text('bulklysisbufferexpirydate', Input::old('bulklysisbufferexpirydate'), array('class' => 'form-control standard-datepicker bulklysisbufferexpirydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('control', Lang::choice('messages.hep-form-worksheet-control',1)) }}
                                 {{ Form::text('control', Input::old('control'), ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('controlexpirydate', Lang::choice('messages.hep-form-worksheet-controlexpirydate',1)) }}
                                {{ Form::text('controlexpirydate', Input::old('controlexpirydate'), array('class' => 'form-control standard-datepicker controlexpirydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('calibrator', Lang::choice('messages.hep-form-worksheet-calibrator',1)) }}
                                 {{ Form::text('calibrator', Input::old('calibrator'), ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('calibratorexpirydate', Lang::choice('messages.hep-form-worksheet-calibratorexpirydate',1)) }}
                                {{ Form::text('calibratorexpirydate', Input::old('calibratorexpirydate'), array('class' => 'form-control standard-datepicker calibratorexpirydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4 includecalibrators">
                           	<div class="form-group">
                            {{ Form::label('includecalibrators',Lang::choice('messages.hep-form-worksheet-includecalibrators',1)) }}
                              {{ generateRationInput($yesno,'includecalibrators')}}
                              </div>
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('amplificationkit', Lang::choice('messages.hep-form-worksheet-amplificationkit',1)) }}
                                 {{ Form::text('amplificationkit', Input::old('amplificationkit'), ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('amplificationkitexpirydate', Lang::choice('messages.hep-form-worksheet-amplificationkitexpirydate',1)) }}
                                {{ Form::text('amplificationkitexpirydate', Input::old('amplificationkitexpirydate'), array('class' => 'form-control standard-datepicker amplificationkitexpirydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('assaydate', Lang::choice('messages.hep-form-worksheet-assaydate',1)) }}
                                {{ Form::text('assaydate', Input::old('assaydate'), array('class' => 'form-control standard-datepicker assaydate')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    
                </div>
                <div class="container" style="border:none; padding-top:20px;" align="center">
                    <div class="form-group actions-row" style="padding-left:0;">
                        {{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.hep-save-worksheet'), 
                            array('class' => 'btn btn-primary', 'type' => 'submit')) }}
                            
                    </div>
                </div>

			{{ Form::close() }}
		</div>
@stop