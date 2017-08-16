@extends("layout")
@section("content")
<div class='container-fluid'>
	<div class='row'>
		<div class='col-md-12'>
			{{ Form::open(array('route' => array('sampletracker.index'), 'class'=>'form-inline',
				'role'=>'form', 'method'=>'GET')) }}
				<div class="form-group">

				    {{ Form::label('search', "search", array('class' => 'sr-only')) }}
		            {{ Form::text('search', Input::get('search'), array('class' => 'form-control test-search')) }}
				</div>
				<div class="form-group">
					{{ Form::button("<span class='glyphicon glyphicon-search'></span> ".trans('messages.search'),
				        array('class' => 'btn btn-primary', 'type' => 'submit')) }}
				</div>
			{{ Form::close() }}
		</div>
	</div>
</div>
	<br>
@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		Dispatched barcodes:: ( {{ $count = SampleTracker::select(['id' ])->count()}} )
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('sampletracker.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				{{trans('Dispatch')}}
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>Barcode</th>
					<th>Date Received</th>
					<th>Location</th>
					<th>Received by</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			@foreach($sampletracker as $key => $sampletracker)
				<tr  @if(Session::has('activesampletracker'))
						{{(Session::get('activesampletracker') == $sampletracker->id)?"class='info'":""}}
					@endif

					<td></td>
					<td>{{ $sampletracker->id}}</td>
					<td>{{ $sampletracker->barcode}}</td>
					<td>{{ $sampletracker->received_date }}</td>
          <td class="text-left">Hub: {{ $sampletracker->hub}}<br>District: {{$sampletracker->district}}</td>
        	<td>{{ $sampletracker->received_by }}</td>
					<td></td>
					<td>
						<div class="btn-group">

						{{ Form::open(array('url' => 'sampletracker/' . $sampletracker->id, 'class' => 'pull-right form-delete')) }}
						{{ Form::hidden('_method', 'DELETE') }}
						{{Form::button('<span class="ion-trash-a"> </span>Delete', array('type' => 'submit', 'class' => 'btn btn-link', 'name' => 'delete_modal'))}}
						{{ Form::close() }}

						<a href="#" class="btn btn-link form-control-static pull-right"><span class="ion-edit"></span> Edit</a>

						<a class="btn btn-sm btn-success" href="#" >
							<span class="glyphicon glyphicon-eye-open"></span>
							{{trans('View')}}
						</a>
				</td>
				</tr>
			@endforeach
			</tbody>
		</table>
	</div>
</div>
@stop
