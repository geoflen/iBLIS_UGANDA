@extends("layout")
@section("content")
<style>
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}
</style>
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
	{{trans('messages.hb-list-worksheets')}}
	<div class="panel-btn">
		<a class="btn btn-sm btn-info" href="{{ URL::route('hep.createworksheet') }}">
			<span class="glyphicon glyphicon-plus-sign"></span>
			{{trans('messages.hb-new-worksheet')}}
		</a>
	</div>
	</div>
	<div class="panel-body">
    <div class="table-responsive">
		<table class="table table-striped search-table small-font">
			<thead>
			<tr>
				<th>{{trans('messages.hep-form-worksheet-refnumber')}}</th>
				<th>{{trans('messages.hep-form-worksheet-machine')}}</th>
				<th>{{trans('messages.hep-form-worksheet-sampletype')}}</th>
				<th>{{trans('messages.hep-form-worksheet-datecreated')}}</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
			</thead>
			<tbody>
			@foreach($worksheets as $key => $worksheet)
					<td><a class="" href="{{ URL::route('hep.show', array($worksheet->id)) }}" >{{ $worksheet->refnumber }}</a></td>
					<td>{{getLookupValueDescription('MACHINE_TYPES', $worksheet->machinetype)}}</td>
                     <td>{{getLookupValueDescription('SAMPLE_TYPES', $worksheet->sampletype)}}</td>
					 <td>{{$worksheet->created_at}}</td>
                     <td>{{getLookupValueDescription('WORKSHEET_STATUS', $worksheet->status)}}</td>
					 <td>
						<div class="btn-group">
							<button type="button" class="btn btn-xs btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								Options 
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								@if($worksheet->status == 0)
								<li><a href="{{URL::route('hep.worksheetsamples', ['worksheetid' => $worksheet->id])}}">Assign Samples</a></li>
								@endif
								@if($worksheet->status == 1 || $worksheet->status == 2)
								<li>
									<a href="{{ URL::route('hep.viewworksheet', array('worksheetid' => $worksheet->id)) }}">
								
										{{ trans('messages.hep-btn-view') }}
									</a>
								</li>
								<li>
									<a target ="_blank" href="{{ URL::route('hep.printworksheet', array('worksheetid' => $worksheet->id)) }}">
								
										{{ trans('messages.hep-btn-print') }}
									</a>
								</li>
								@endif
							</ul>
						</div>
						
						
						
                        
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