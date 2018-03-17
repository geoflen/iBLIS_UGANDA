<html>
<head>

    <style>
        hr,.footer, #side_nav, .navbar.navbar-fixed-top,.breadcrumb, .panel-primary > .panel-heading{
            display:none;
        }
        .panel{
            border: none;
        }
        .col-md-12 .panel-primary {
            border-color: #fff;
        }
        
        #main_wrapper{
            margin-top: -30px;
        }
        #panel-body{
            font-size: 10px;
        }
        #main_wrapper .panel {
            -webkit-box-shadow: 0 0 0 rgba(0,0,0,.05);
            box-shadow: 0 0 0 rgba(0,0,0,.05);
        }
    </style>
</head>
   <body>
    @extends("layout")

<script>
   
    window.onload = function () {
        window.print();
    }
  </script>
@section("content")

    <div style="padding-left:27px;">
         <a style="display:none;" href="#" id ="print-button" onclick="window.print()"> Print this</a>
    </div>
    <div class="panel panel-primary">
       
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
@stop
    </body>
</html>