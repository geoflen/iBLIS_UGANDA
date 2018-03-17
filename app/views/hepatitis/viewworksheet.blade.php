@extends("layout")

<script>
    $(document).ready(function(){
		$('.print-window').click(function() {
			window.print();
		});
    });

  </script>
@section("content")
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
		  <li><a target="_blank" href="{{ URL::route('hep.printworksheet',array('worksheetid' => $worksheet->id)) }}" class="print-window">print-window</a></li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-adjust"></span>
			{{trans('messages.hep-page-sub-title')}}
		</div>
		<div class="panel-body" id="panel-body">
		<!-- if there are creation errors, they will show here -->
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif

			<table class="table table-bordered">
        <tr > 
            <td align="center" style="font-size:10px;">1<br />
                Negative Contol</td>
            <td align="center" style="font-size:10px;">2<br />
                Low Positive Contol</td>
            <td align="center" style="font-size:10px;">3<br />
                High Positive Contol</td>
         <?php $counter = 3?>              
        @foreach($worksheet_patients as $patient)
            <td align="center" style="font-size:10px;">
                <span class="sm-label">{{$counter + 1}}<br />
                    Patient ID #</span>:
                {{$patient->patientid}}<br>
                <span class="sm-label">Other ID #</span>:
                {{$patient->otherid}}<br>
                <span class="sm-label">Locator ID #</span>:
                {{$patient->locatorid}}<br>
                <div class="barcode">
                {{$generator->getBarcode($patient->patientid, $generator::TYPE_CODE_128,1,60)}} 
                </div> 
            </td>                          
           <?php $counter++;
            if($counter % 6 == 0){?>
            </tr><tr > 
            <td align="center" style="font-size:10px;">
                <span class="sm-label">{{$counter + 1}}<br />Patient ID #</span>:
                {{$patient->patientid}}<br>
                <span class="sm-label">Other ID #</span>:
                {{$patient->otherid}}<br>
                <span class="sm-label">Locator ID #</span>:
                {{$patient->locatorid}}<br>
                <div class="barcode">
                {{$generator->getBarcode($patient->patientid, $generator::TYPE_CODE_128,1,60)}} 
                </div> 
            </td>  
           <?php } ?>
        @endforeach
    </tr>
        </tr>
    </table>
		</div>
	</div>
@stop