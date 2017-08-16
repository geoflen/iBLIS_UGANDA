@extends("layout")
@section("content")
<div class='container-fluid'>

  <span style="font-size:20px">Sample Tracker</span>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-10">
        <div class="row">
          <div class="col-md-10">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="sub_panel" style="left: -220px;">
            <div class="side_inner ps-ready ps-container" style="height: 620px;">
              <ul>
                <li>
                  <a href="{{ URL::route('sampletracker.create')}}">
                    <span class="glyphicon glyphicon-tag"></span>Dispatch</a>
                  </li>
                  <li>
                    <a href="{{ URL::route('sampletracker.home') }}">
                      <span class="glyphicon glyphicon-tag"></span>Summary</a>
                    </li>
                    <li>
                      <a href="#">
                        <span class="glyphicon glyphicon-tag"></span>Notifications</a>
                      </li>

                    </div>
                  </div>

                </div>

              </div>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
@endsection
