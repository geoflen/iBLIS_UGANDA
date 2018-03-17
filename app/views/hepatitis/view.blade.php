@extends("layout")
@section("content")
<style>
	.display-details{
	}
	.section{
		border:1px solid #666;
	}
	h2, h3{
		font-size: 15px;
		font-weight:bold;
	}
	h3{
		margin-left:6px;
	}
	.container{
		width:100%;
	}
	p.view-striped {
		background-color: #fff;
		margin-top: 5px;
	}
	.view-striped.border-top-none{
		border-bottom:1px solid #DDDDDD;
		border-top:none;
	}
	.p-label{
		font-weight:bold;
	}
</style>
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
          <li><a href="{{ URL::route('hep.index') }}">{{ Lang::choice('messages.patient',2) }}</a></li>
          <li class="active">{{ trans('messages.patient-details') }}</li>
        </ol>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-user"></span>
            {{ trans('messages.patient-details') }}
            <div class="panel-btn">
                <a class="btn btn-sm btn-info" href="{{ URL::route('hep.edit', array($patient->id)) }}">
                    <span class="glyphicon glyphicon-edit"></span>
                    {{ trans('messages.edit') }}
                </a>
                @if(Auth::user()->can('request_test'))
                <a class="btn btn-sm btn-info" 
                    href="{{ URL::route('unhls_test.create', array('patient_id' => $patient->id)) }}">
                    <span class="glyphicon glyphicon-edit"></span>
                    {{ trans('messages.new-test') }}
                </a>
                @endif
            </div>
        </div>
        <div class="panel-body">
        <h2>{{Lang::choice('messages.hp-section-heading-facility',1)}}</h2>
            <div class="container section">
            	<div class="row">
                    <div class="col-md-4 display-details">
                        <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-facility') }}:</span>
                            <span class="value">{{ $patient->facility->name }}</span></p>
                    </div>
                    <div class="col-md-4 display-details">
                        <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hub') }}:</span>
                            <span class="value">{{ $patient->hub->name }}</span></p>
                    </div>
                    <div class="col-md-4 display-details">
                        <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-district') }}:</span>
                            <span class="value">{{ $patient->district->name }}</span></p>
                    </div>
                </div>                
            </div>
            <h2>{{Lang::choice('messages.hep-heading-patient-details',1)}}</h2>
            <div class="container section">
            	
                <div class="row">
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-patient') }}:</span>
                            <span class="value">{{ $patient->patientname }}</span></p>
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-locatorid') }}:</span>
                            <span class="value">{{ $patient->locatorid }}</span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-patientid') }}:</span>
                            <span class="value">{{ $patient->patientid }}</span></p>
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-sex') }}:</span>
                            <span class="value">{{ $patient->sex }}</span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-age') }}:</span>
                            <span class="value">{{ $patient->age }} years</span></p>
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-telephonenumber') }}:</span>
                            <span class="value">{{ $patient->telephonenumber }}</span></p>
                    </div>
                </div>
            </div>
            
            <h2>{{Lang::choice('messages.hep-title-deasese-status',1)}}</h2>
            <div class="container section">
            	<div class="row">
                	<div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbsagresult') }}:</span>
                            <span class="value">{{ getLookupValueDescription('POSITIVE_NEGATIVE', $patient->hbsagresult) }} </span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbeagresult') }}:</span>
                            <span class="value">{{ getLookupValueDescription('POSITIVE_NEGATIVE', $patient->hbeagresult) }} </span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbdiagonosisdate') }}:</span>
                            <span class="value">{{ getPageDateFormat($patient->hbdiagonosisdate) }} </span></p>
                    </div>
                </div>
            </div>
            <h2>{{Lang::choice('messages.hep-title-deasese-preliminary-findings',1)}}</h2>
            <div class="container section">
            	<div class="row">
                	<div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbaltvalue') }}:</span>
                            <span class="value">{{ $patient->hbaltvalue }} </span></p>
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-asltorpltgreaterthantwo') }}:</span>
                            <span class="value">{{ getLookupValueDescription('YES_NO',$patient->asltorpltgreaterthantwo) }} </span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbastvalue') }}:</span>
                            <span class="value">{{ $patient->hbastvalue }} </span></p>
                            
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-fetalprotainvalue') }}:</span>
                            <span class="value">{{ $patient->fetalprotainvalue }} </span></p>
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbplateletcount') }}:</span>
                            <span class="value">{{ $patient->hbplateletcount }} </span></p>
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-otherhbpreliminaryfindings') }}:</span>
                            <span class="value">{{ $patient->otherhbpreliminaryfindings }} </span></p>
                    </div>
                </div>
            </div>
            <h2>{{Lang::choice('messages.hep-heading-Coinfections',1)}}</h2>
            <div class="container section">
            	<div class="row">
                	<div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-coinfectionhivhbsag') }}:</span>
                            <span class="value">{{ getLookupValueDescription('POSITIVE_NEGATIVE',$patient->coinfectionhivhbsag) }} </span></p>
                            
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-coinfectionhdvhbsag') }}:</span>
                            <span class="value">{{ getLookupValueDescription('POSITIVE_NEGATIVE',$patient->coinfectionhdvhbsag) }} </span></p>
                            
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-coinfectionhcvhbsag') }}:</span>
                            <span class="value">{{ getLookupValueDescription('POSITIVE_NEGATIVE',$patient->coinfectionhcvhbsag) }} </span></p>
                            
                    </div>
                    <div class="row">
                    	<div class="col-md-12 display-details">
                    	<p style="margin-left:14px; margin-right:14px;" class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-otherhbconinfections') }}:</span>
                            <span class="value">{{$patient->otherhbconinfections }} </span></p>
                            
                   		</div>
                    </div>
                </div>
            </div>
            <h2></h2>
             <div class="container section">
                <div class="row">
                	<div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-isonhptreatment') }}:</span>
                            <span class="value">{{ getLookupValueDescription('YES_NO',$patient->isonhptreatment) }} </span></p>
                            
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-isonhivtreatment') }}:</span>
                            <span class="value">{{ getLookupValueDescription('YES_NO',$patient->isonhivtreatment) }} </span></p>  
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbdrudtype') }}:</span>
                            <span class="value">{{ getLookupValueDescription('HB_DRUG_TYPES',$patient->hbdrudtype) }} </span></p> 
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hivdrugtype') }}:</span>
                            <span class="value">{{ getLookupValueDescription('HIV_DRUG_TYPES',$patient->hivdrugtype) }} </span></p> 
                    </div>
                    <div class="col-md-4 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbinitiationdate') }}:</span>
                            <span class="value">{{ getPageDateFormat($patient->hbinitiationdate) }} </span></p> 
                            <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hivinitiationdate') }}:</span>
                            <span class="value">{{ getPageDateFormat($patient->hivinitiationdate) }} </span></p> 
                    </div>
                   
                    <div class="container" style="padding-top:86px;"> <h3>{{Lang::choice('messages.hep-heading-indictionfovltestin',1)}}</h3>
                    <div class="row">
                    	<div class="col-md-5 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-lastroutineviralloaddate') }}:</span>
                            <span class="value">{{ date('d/m/Y',strtotime($patient->lastroutineviralloaddate))}} </span></p> 
                           <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-lastrepeatviralloaddate') }}:</span>
                            <span class="value">{{ date('d/m/Y',strtotime($patient->lastrepeatviralloaddate)) }} </span></p>
                    	</div>
                        <div class="col-md-3 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-hbalastroutineviralloadvalueltvalue') }}:</span>
                            <span class="value">{{ $patient->hbalastroutineviralloadvalueltvalue }} </span></p> 
                           <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-lastrepeatviralloadvalue') }}:</span>
                            <span class="value">{{ $patient->lastrepeatviralloadvalue }} </span></p>
                    	</div>
                        <div class="col-md-3 display-details">
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-lastroutineviralloadsampletype') }}:</span>
                            <span class="value">{{ $patient->lastroutineviralloadsampletype }} </span></p> 
                           <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-samplecollectiondate') }}:</span>
                            <span class="value">{{ date('d/m/Y',strtotime($patient->samplecollectiondate)) }} </span></p>
                    	</div>
                    </div>
                    </div>
                </div>
             </div>
            <h2></h2>
            <div class="container section">
            	<div class="row">
                	<div class="col-md-6 display-details">
                    <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-samplecollectiondate') }}:</span>
                            <span class="value">{{ getPageDateFormat($patient->samplecollectiondate) }} </span></p> 
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-labtechnitian') }}:</span>
                            <span class="value">{{ $patient->labtechnitian }} </span></p> 
                            
                    </div>
                    <div class="col-md-6 display-details">
                    <p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-sampletypecollected') }}:</span>
                            <span class="value">{{ getLookupValueDescription('SAMPLE_TYPES',$patient->sampletypecollected) }} </span></p> 
                    	<p class="view-striped border-top-none"><span class="p-label">{{ trans('messages.hep-form-samplereceptiondate') }}:</span>
                            <span class="value">{{ getPageDateFormat($patient->samplereceptiondate) }} </span></p> 
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

