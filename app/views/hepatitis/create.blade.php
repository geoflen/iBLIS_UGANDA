@extends("layout")
@section("content")
<style>
	form-group > label {
		width: 75px;
	}
	.form-group .form-control {
		width: 100%;
	}
	.section{
		border:1px solid #666;
		padding-top:10px;
	}
	h2{
		font-size: 15px;
		font-weight:bold;
	}
	form .container, .form-group > label{
		width:100%;
	}
	.input-group > .form-control {
    position: relative;
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    width: 1%;
    margin-bottom: 0;
}
	.input-group {
		position: relative;
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-wrap: wrap;
		flex-wrap: wrap;
		-webkit-box-align: stretch;
		-ms-flex-align: stretch;
		align-items: stretch;
		width: 100%;
	}
	.form-control {
    display: block;
    width: 100%;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
        border-top-right-radius: 0.25rem;
        border-bottom-right-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}


.form-group .form-control{
	z-index:0;
}
.input-group-text {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: .375rem .75rem;
    margin-bottom: 0;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    text-align: center;
    white-space: nowrap;
    background-color: #e9ecef;
    border: 1px solid #ced4da;
    border-radius: .25rem;
        border-top-left-radius: 0.25rem;
        border-bottom-left-radius: 0.25rem;
}
.input-group-append {
    margin-left: -1px;
}
#basic-addon2{
	padding-top: 10px;
	padding-bottom: 7px;
	padding-left: 15px;
	padding-right: 15px;
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
.form-group.hbeagresult > label{
	width: 124px;
}
.form-group.hbsagresult > label{
	width: 120px;
}
.form-group.asltorpltgreaterthantwo > label{
	width: 131px;
}
.long-label.form-group > label{
	width: 100%;
}

.sex.form-group > label{
	width: 42px;
}
.coinfections .form-group > label{
	width: 92px;
}
.onhbtreatment.form-group > label, .hbdrudtype.form-group > label{
	width: 100%;
}
.form-group.lastroutineviralloadsampletype > label{
	width:95px;
}
.form-group.reptype > label{
	width:159px;
}
input[type="radio"]{
	margin:0
}
</style>
<script type="text/javascript" src="{{ URL::asset('js/bootstrapValidator.min.js') }} "></script>
<script>
	$(document).ready(function() {
	$('#form-add-hep').bootstrapValidator({
            
            fields: {
                hubid: {
                    validators: {
                        notEmpty: {
                            message: 'select a hub'
                        }
                    }
                },
				facilityid: {
                    validators: {
                        notEmpty: {
                            message: 'select a facility'
                        }
                    }
                },
				districtid: {
                    validators: {
                        notEmpty: {
                            message: 'select a facility'
                        }
                    }
                },
				patientname: {
                    validators: {
                        notEmpty: {
                            message: 'enter the patient name'
                        }
                    }
                },
				locatorid: {
                    validators: {
                        notEmpty: {
                            message: 'enter the locator ID'
                        }
                    }
                },
				patientid: {
                    validators: {
                        notEmpty: {
                            message: 'enter the patient ID'
                        }
                    }
                },
				sex: {
                    validators: {
                        notEmpty: {
                            message: 'select the patient\'s sex'
                        }
                    }
                },
				age: {
                    validators: {
                        notEmpty: {
                            message: 'enter the patient\'s age'
                        }
                    }
                },
				telephonenumber: {
                    validators: {
                        notEmpty: {
                            message: 'enter the patient\'s tel number'
                        }
                    }
                },
				hbsagresult: {
                    validators: {
                        notEmpty: {
                            message: 'enter the HBsAg Results'
                        }
                    }
                },
				hbeagresult: {
                    validators: {
                        notEmpty: {
                            message: 'enter the HBeAg Results'
                        }
                    }
                },
				hbdiagonosisdate: {
                    validators: {
                        notEmpty: {
                            message: 'slect the diagnosis date'
                        }
                    }
                },
				hbaltvalue: {
                    validators: {
                        notEmpty: {
                            message: 'slect the Alt value'
                        },
						numeric:{
							message: 'enter a valid value'
						}
                    }
                },
				hbastvalue: {
                    validators: {
                        notEmpty: {
                            message: 'enter the AST value'
                        },
						numeric:{
							message: 'enter a valid value'
						}
                    }
                },
				hbplateletcount: {
                    validators: {
                        notEmpty: {
                            message: 'enter the Platelet count'
                        },
						numeric:{
							message: 'enter a valid number'
						}
                    }
                },
				asltorpltgreaterthantwo: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				coinfectionhivhbsag: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				coinfectionhdvhbsag: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				coinfectionhcvhbsag: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				isonhptreatment: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				isonhivtreatment: {
                    validators: {
                        notEmpty: {
                            message: 'Select yes or no'
                        }
                    }
                },
				samplecollectiondate: {
                    validators: {
                        notEmpty: {
                            message: 'Select date of sample collection'
                        }
                    }
                },
				labtechnitian: {
                    validators: {
                        notEmpty: {
                            message: 'Please enter the lab tec'
                        }
                    }
                },
				samplereceptiondate: {
                    validators: {
                        notEmpty: {
                            message: 'Please select the date of sample receipt'
                        }
                    }
                },
				sampletypecollected: {
                    validators: {
                        notEmpty: {
                            message: 'Select the type of sample collected'
                        }
                    }
                }
				
			//end of validators 
           }
       });
	   		
	$("select[name='hubid']").change(function(){
		
      var id = $(this).val();
      var token = $("input[name='_token']").val();
	  //alert(id);
      $.ajax({
          url: "<?php echo url('hep/facilitiesforhub'); ?>",
          method: 'POST',
          data: {hubid:id, _token:token},
          success: function(data) {
			  	console.log(data);
			  	$("select[name='facilityid'").html("").prepend("<option value=''>Select One</option>"); 
			    $("select[name='facilityid'").html('');
				$("select[name='facilityid'").html(data.options);
				
				$("select[name='districtid'").html(data.district_html_options);
				$("select[name='districtid'").val(data.districtid);
			  }
		  });
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

			{{ Form::open(array('route' => 'hep.store', 'id' => 'form-add-hep')) }}
				
                <div class="row">
                	<div class="col-md-6"><h2>{{Lang::choice('messages.hp-section-heading-facility',1)}}</h2></div>
                    <div class="col-md-6">
                    	<h2 style="color:#18A4E7;"><span>Other ID: </span><span style="font-weight:normal">{{$generated_otherid}}</span></h2>
                        {{Form::hidden('otherid',$generated_otherid)}}
                    </div>
                </div>
                 <div class="container section">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('name', Lang::choice('messages.hep-form-hub',2)) }}
                                 {{ Form::select('hubid', $hubsdropdown, null, ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('facility', Lang::choice('messages.hep-form-facility',1)) }}
                                {{ Form::select('facilityid', $emptydropdown, null, ['class' => 'form-control']) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('district', Lang::choice('messages.hep-form-district',1)) }}
                                {{ Form::select('districtid', $emptydropdown, null, ['class' => 'form-control', 'readonly' => 'true']) }}
                            </div>
                           </div>
                    </div>
                </div>
                <h2>{{Lang::choice('messages.hep-heading-patient-details',1)}}</h2>
                <div class="container section">
                    <div class="row">
                    	<div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('patientname', Lang::choice('messages.hep-form-patient',1)) }}
                                {{ Form::text('patientname', Input::old('patientname'), array('class' => 'form-control')) }}
                            </div>
                           </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('locatorid', Lang::choice('messages.hep-form-locatorid',1)) }}
                                {{ Form::text('locatorid', Input::old('locatorid'), array('class' => 'form-control')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('patientid', Lang::choice('messages.hep-form-patientid',1)) }}
                                {{ Form::text('patientid', Input::old('patientid'), array('class' => 'form-control')) }}
                            </div>
                           </div>
                    </div>
                    <div class="row">
                    	<div class="col-md-4">
                            <div class="form-group sex">
                                {{ Form::label('sex', Lang::choice('messages.hep-form-sex',1)) }}
                                {{generateRationInput($gender,'sex')}}
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                            	{{ Form::label('age', Lang::choice('messages.hep-form-age',1)) }}
                                {{ Form::text('age', Input::old('age'), array('class' => 'form-control')) }}
                                
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('telephonenumber', Lang::choice('messages.hep-form-telephonenumber',1)) }}
                                {{ Form::text('telephonenumber', Input::old('telephonenumber'), array('class' => 'form-control')) }}
                            </div>
                           </div>
                    </div>
                 </div>
                 <h2>{{Lang::choice('messages.hep-title-deasese-status',1)}}</h2>
                 <div class="container section">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group hbsagresult">
                                {{ Form::label('hbsagresult', Lang::choice('messages.hep-form-hbsagresult',1)) }}
                                 {{generateRationInput($positive_negative,'hbsagresult')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group hbeagresult">
                                {{ Form::label('hbeagresult', Lang::choice('messages.hep-form-hbeagresult',1)) }}
                                {{generateRationInput($positive_negative,'hbeagresult')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('hbdiagonosisdate', Lang::choice('messages.hep-form-hbdiagonosisdate',1)) }}
                                 {{ Form::text('hbdiagonosisdate', Input::old('hbdiagonosisdate'), array('class' => 'form-control standard-datepicker')) }}
                            </div>
                           </div>
                    </div>
                </div>
                <h2>{{Lang::choice('messages.hep-title-deasese-preliminary-findings',1)}}</h2>
                <div class="container section">
                    <div class="row">
                        <div class="col-md-4">                            
                            <div class="form-group">
                                {{ Form::label('hbaltvalue', Lang::choice('messages.hep-form-hbaltvalue',1)) }}
                                <div class="input-group mb-3">
                                  <!--<input class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2" type="text"> -->
                                  {{ Form::text('hbaltvalue', Input::old('hbaltvalue'), array('class' => 'form-control')) }}
                                  <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">&micro;l</span>
                                  </div>
                                </div>
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('hbastvalue', Lang::choice('messages.hep-form-hbastvalue',1)) }}
                                <div class="input-group mb-3">
                                  <!--<input class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2" type="text"> -->
                                  {{ Form::text('hbastvalue', Input::old('hbastvalue'), array('class' => 'form-control')) }}
                                  <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">&micro;l</span>
                                  </div>
                                </div>
                            </div>
                           </div>
                           <div class="col-md-4">
                            	<div class="form-group">
                                {{ Form::label('hbplateletcount', Lang::choice('messages.hep-form-hbplateletcount',1)) }}
                                <div class="input-group mb-3">
                                  <!--<input class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2" type="text"> -->
                                  {{ Form::text('hbplateletcount', Input::old('hbplateletcount'), array('class' => 'form-control')) }}
                                  <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">&micro;l</span>
                                  </div>
                                </div>
                            </div>
                           </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group asltorpltgreaterthantwo">
                                {{ Form::label('asltorpltgreaterthantwo', Lang::choice('messages.hep-form-asltorpltgreaterthantwo',1)) }}
                                 {{generateRationInput($yesno,'asltorpltgreaterthantwo')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('fetalprotainvalue', Lang::choice('messages.hep-form-fetalprotainvalue',1)) }}
                                 {{ Form::text('fetalprotainvalue', Input::old('fetalprotainvalue'), array('class' => 'form-control')) }}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('otherhbpreliminaryfindings', Lang::choice('messages.hep-form-otherhbpreliminaryfindings',1)) }}
                                 {{ Form::textarea('otherhbpreliminaryfindings', Input::old('otherhbpreliminaryfindings'), array('class' => 'form-control', 'rows' => 1)) }}
                            </div>
                           </div>
                    </div>
                </div>
                <h2>{{Lang::choice('messages.hep-heading-Coinfections',1)}}</h2>
                <div class="container section">
                    <div class="row coinfections">
                        <div class="col-md-4">
                            <div class="form-group asltorpltgreaterthantwo">
                                {{ Form::label('coinfectionhivhbsag', Lang::choice('messages.hep-form-coinfectionhivhbsag',1)) }}
                                 {{generateRationInput($yesno,'coinfectionhivhbsag')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('coinfectionhdvhbsag', Lang::choice('messages.hep-form-coinfectionhdvhbsag',1)) }}
                                {{generateRationInput($yesno,'coinfectionhdvhbsag')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('coinfectionhcvhbsag', Lang::choice('messages.hep-form-coinfectionhcvhbsag',1)) }}
                                 {{generateRationInput($yesno,'coinfectionhcvhbsag')}}
                            </div>
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group asltorpltgreaterthantwo">
                                {{ Form::label('otherhbconinfections', Lang::choice('messages.hep-form-otherhbconinfections',1)) }}
                                {{ Form::textarea('otherhbconinfections', Input::old('otherhbconinfections'), array('class' => 'form-control', 'rows' => 1)) }}
                            </div>
                           </div>
     
                           <div class="col-md-4">
                            
                           </div>
                    </div>
                    
                </div>
                <h2></h2>
                <div class="container section">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group onhbtreatment">
                                {{ Form::label('isonhptreatment', Lang::choice('messages.hep-form-isonhptreatment',1)) }}
                                 {{generateRationInput($yesno,'isonhptreatment')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group hbdrudtype">
                                {{ Form::label('hbdrudtype', Lang::choice('messages.hep-form-hbdrudtype',1)) }}
                                {{generateRationInput($hbdrugtypes,'hbdrudtype')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('hbinitiationdate', Lang::choice('messages.hep-form-hbinitiationdate',1)) }}
                                 {{ Form::text('hbinitiationdate', Input::old('hbinitiationdate'), array('class' => 'form-control standard-datepicker')) }}
                            </div>
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group onhbtreatment">
                                {{ Form::label('isonhivtreatment', Lang::choice('messages.hep-form-isonhivtreatment',1)) }}
                                {{generateRationInput($yesno,'isonhivtreatment')}}
                            </div>
                          </div>
                          
                          <div class="col-md-4">
                            <div class="form-group onhbtreatment">
                                {{ Form::label('hivdrugtype', Lang::choice('messages.hep-form-hivdrugtype',1)) }}
                                {{generateRationInput($hivdrugtypes,'hivdrugtype')}}
                            </div>
                          </div>
     
                           <div class="col-md-4">
                            	{{ Form::label('hivinitiationdate', Lang::choice('messages.hep-form-hivinitiationdate',1)) }}
                                 {{ Form::text('hivinitiationdate', Input::old('hivinitiationdate'), array('class' => 'form-control standard-datepicker hivinitiationdate')) }}
                           </div>
                    </div>
                    <h3>{{Lang::choice('messages.hep-heading-indictionfovltestin',1)}}</h3>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group long-label">
                                {{ Form::label('lastroutineviralloaddate', Lang::choice('messages.hep-form-lastroutineviralloaddate',1)) }}
                                {{ Form::text('lastroutineviralloaddate', Input::old('lastroutineviralloaddate'), array('class' => 'form-control standard-datepicker lastroutineviralloaddate')) }}
                            </div>
                          </div>
                          
                          <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('district', Lang::choice('messages.hep-form-hbalastroutineviralloadvalueltvalue',1)) }}
                                <div class="input-group mb-3">
                                  <!--<input class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2" type="text"> -->
                                  {{ Form::text('lastroutineviralloadvalue', Input::old('lastroutineviralloadvalue'), array('class' => 'form-control')) }}
                                  <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">&micro;l</span>
                                  </div>
                                </div>
                            </div>
                          </div>
     
                           <div class="col-md-4">
                           	<div class="form-group lastroutineviralloadsampletype">
                            	{{ Form::label('lastroutineviralloadsampletype', Lang::choice('messages.hep-form-lastroutineviralloadsampletype',1)) }}
                                {{generateRationInput($lastroutineviralloadsampletype,'lastroutineviralloadsampletype')}}
                           </div>
                           </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group long-label">
                                {{ Form::label('lastrepeatviralloaddate', Lang::choice('messages.hep-form-lastrepeatviralloaddate',1)) }}
                                {{ Form::text('lastrepeatviralloaddate', Input::old('lastroutineviralloaddate'), array('class' => 'form-control standard-datepicker lastrepeatviralloaddate')) }}
                            </div>
                          </div>
                          
                          <div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('lastrepeatviralloadvalue', Lang::choice('messages.hep-form-lastrepeatviralloadvalue',1)) }}
                                <div class="input-group mb-3">
                                  <!--<input class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2" type="text"> -->
                                  {{ Form::text('lastrepeatviralloadvalue', Input::old('lastrepeatviralloadvalue'), array('class' => 'form-control')) }}
                                  <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">&micro;l</span>
                                  </div>
                                </div>
                            </div>
                          </div>
     
                           <div class="col-md-4">
                           	<div class="form-group lastroutineviralloadsampletype">
                            	{{ Form::label('lastrepeatviralloadsampletype', Lang::choice('messages.hep-form-lastroutineviralloadsampletype',1)) }}
                                {{generateRationInput($lastroutineviralloadsampletype,'lastrepeatviralloadsampletype')}}
                           </div>
                           </div>
                    </div>
                    
                </div>
                <h2>Lab Section</h2>
                
                <div class="container section">
                    <div class="row">
                    	<div class="col-md-4">
                            <div class="form-group">
                                {{ Form::label('samplecollectiondate', Lang::choice('messages.hep-form-samplecollectiondate',1)) }}
                                {{ Form::text('samplecollectiondate', Input::old('samplecollectiondate'), array('class' => 'form-control standard-datepicker samplecollectiondate')) }}
                            </div>
                           </div>
                        <div class="col-md-4">
                            <div class="form-group reptype">
                                {{ Form::label('sampletypecollected', Lang::choice('messages.hep-form-sampletypecollected',1)) }}
                                {{generateRationInput($lastroutineviralloadsampletype,'sampletypecollected')}}
                            </div>
                           </div>
                           <div class="col-md-4">
                           </div>
                    </div>
                    <div class="row">
                    	<div class="col-md-4">
                            <div class="form-group">
                               {{ Form::label('labtechnitian', Lang::choice('messages.hep-form-labtechnitian',1)) }}
                                {{ Form::text('labtechnitian', Input::old('labtechnitian'), array('class' => 'form-control')) }}
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                            	{{ Form::label('samplereceptiondate', Lang::choice('messages.hep-form-samplereceptiondate',1)) }}
                                {{ Form::text('samplereceptiondate', Input::old('samplereceptiondate'), array('class' => 'form-control standard-datepicker samplereceptiondate')) }}
                                
                            </div>
                           </div>
                           <div class="col-md-4">
                            
                           </div>
                    </div>
                 </div>
                
                <div class="container" style="border:none; padding-top:20px;" align="center">
                    <div class="form-group actions-row" style="padding-left:0;">
                        {{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.save'), 
                            array('class' => 'btn btn-primary', 'type' => 'submit')) }}
                            
                    </div>
                </div>

			{{ Form::close() }}
		</div>
	</div>
@stop