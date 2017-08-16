@extends("layout")
@section("content")
<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		{{trans('New Dispatch')}}
	</div>
	<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
		@if($errors->all())
		<div class="alert alert-danger">
			{{ HTML::ul($errors->all()) }}
		</div>
		@endif

		{{ Form::open(array('url' => 'sampletracker', 'id' => 'form-receive-sampletrack')) }}
		<div class="form-group">
			{{ Form::label('barcode', trans('Barcode'), array('class'=>'required')) }}
			{{ Form::text('barcode', Input::old('barcode'),array('class' => 'form-control')) }}
		</div>
		<div class="form-group">
			{{ Form::label('hub', trans('Hub'), array('class'=>'required')) }}
			{{ Form::text('hub', Input::old('hub'),array('class' => 'form-control')) }}
		</div>
		<div class="form-group">
			{{ Form::label('district', trans('District'), array('class'=>'required')) }}
			{{ Form::text('district', Input::old('district'),array('class' => 'form-control')) }}
		</div>
		<div class="form-group">
			{{ Form::label('qtyrecvd', trans('Quantity Received'), array('class'=>'required')) }}
			{{ Form::text('district', Input::old('district'),array('class' => 'form-control')) }}
		</div>
		<div class="form-group">
			{{ Form::label('received_date', trans('Date Received'), array('class' => 'required')) }}
			{{ Form::text('received_date',Input::old('received_date') ,array('class' => 'form-control standard-datepicker col-sm-4')) }}
		</div>
		<div class="form-group">
			{{ Form::label('received_by', trans('Received By'), array('class'=>'required')) }}
			{{ Form::text('receiveed_by', Input::old('received_by'),array('class' => 'form-control')) }}
		</div>
		<div class="form-group actions-row">
			{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.trans('messages.save'),
			['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
		</div>

		{{ Form::close() }}
	</div>
</div>
@stop
