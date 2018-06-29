@extends("layout")
@section("content")
<div class="container col-md-9">
	<a class="link-tip" href="{{URL::route('poc.index')}}" data-toggle="tooltip" data-placement="right" title="CLICK TO ACCESS POC/EID">
		<div class="panel panel-default">
			<span class="glyphicon glyphicon-credit-card" style="color:black; font-size:80px"></span> <br><span class="nav_title">POC/EID</span>
		</div>
	</a>
</div>

<div class="container col-md-9">
	<a class="link-tip" href="{{URL::route('tb.index')}}" data-toggle="tooltip" data-placement="right" title="CLICK TO ACCESS TB-Genexpert">
		<div class="panel panel-default">
			<span class="ion-ios-cart" style="font-size:80px"></span> <br><span class="nav_title">TB-Genexpert</span>
		</div>
	</a>
</div>
@stop
