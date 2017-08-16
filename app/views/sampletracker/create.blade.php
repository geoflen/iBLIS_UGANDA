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

			{{ Form::open(array('url' => 'sampletracker', 'id' => 'form-create-sampletracker')) }}
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
		        <!-- <div class="form-group">
						{{ Form::label('dispatch_date', trans('Dispatch Date'), array('class' => 'required')) }}
						{{ Form::text('dispatch_date',Input::old('dispatch_date') ,array('class' => 'form-control standard-datepicker col-sm-4')) }}
        </div> -->
        <div class="form-group">
					{{ Form::label('dispatched_by', trans('Dispatched By'), array('class'=>'required')) }}
					{{ Form::text('dispatched_by',  Auth::user()->name,array('class' => 'form-control')) }}
				</div>
			<div class="form-group actions-row">
				{{ Form::button('<span class="glyphicon glyphicon-upload"></span> '.trans('Dispatch'),
					['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
			</div>

			{{ Form::close() }}
		</div>
	</div>
@stop
