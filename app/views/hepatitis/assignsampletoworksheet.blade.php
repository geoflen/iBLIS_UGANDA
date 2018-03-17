@extends("layout")
@section("content")

<script type="text/javascript" src="{{ URL::asset('js/bootstrapValidator.min.js') }} "></script>
<script>
	$(document).ready(function() {
	$('#form-assign-sample').bootstrapValidator({
            
            fields: {
                'patients[]': {
                    validators: {
                        notEmpty: {
                            message: 'select atleast one sample'
                        }
                    }
                }
				
			//end of validators 
           }
       });
	
	});
	</script>
    <style>
		form .col-md-2{
			text-align: center;
			border: solid 1px #D5D8DC;
			font-size: 10px;
		}
		form .row:first-child:not(:last-child){
			border-bottom:none;
		}
		form .row + form .row{
			margin-top:0;
		}
		form .sm-label {
			color: #808080;
		}
		form input.check{
			margin-bottom:5px;
			margin-left:90px;
		}
	</style>
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
		  <li class="active"><a href="{{ URL::route('hep.worksheets') }}">{{Lang::choice('messages.hb-submenu-worksheets',2)}}</a></li>
		  <li class="active">{{trans('messages.hb-worksheet-assign-sample')}}</li>
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

			{{ Form::open(array('route' => 'hep.storeworksheetsample', 'id' => 'form-assign-sample')) }}
                 
                @foreach($patients_array as $row)
                <div class="row">
                @foreach($row as $patient)
                	<div class="col-md-2">
                       <div style="padding-top:5px; text-align:center">
                            <span class="sm-label">Patient ID #</span>:
                            {{$patient->patientid}}<br>
                            <span class="sm-label">Other ID #</span>:
                            {{$patient->otherid}}<br>
                            <span class="sm-label">Locator ID #</span>:
                            {{$patient->locatorid}}<br>
                            <div style="font-size: 0; background-color: #FFFFFF; margin-left:36px;">
                            {{$generator->getBarcode($patient->patientid, $generator::TYPE_CODE_128,1,60)}}                            
                            </div>
                            {{Form::checkbox('patients[]',$patient->id, null, ['class' => 'check'])}}
                        </div>
                    </div>
                  @endforeach
                </div>
                @endforeach
                <div class="container" style="border:none; padding-top:20px;" align="center">
                    <div class="form-group actions-row" style="padding-left:0;">
                    	{{Form::hidden('worksheetid',$worksheetid)}}
                        {{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.save'), 
                            array('class' => 'btn btn-primary', 'type' => 'submit'))}}
                    </div>
                </div>

			{{ Form::close() }}
		</div>
	</div>
@stop