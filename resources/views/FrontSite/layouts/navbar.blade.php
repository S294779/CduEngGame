<nav class="navbar navbar-default navbar-fixed-top topnav">
  <div class="container topnav">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header navbar-header-custome">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand topnav" href="{{ url('/') }}">CDU Learning Game</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav navbar-right">
        @if (Route::has('login'))
                    @if (Auth::check())
                    <li><a href="#" id="game-played-time"></a></li>
                        <li><a href="">{{Auth::guard()->user()->name}}</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Setting</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="form-group" style="padding: 10px">
                                        <label class="control-label">Volume</label>
                                        <!--pending here for volume store in local storage-->
                                        <input id="valume-change" type="range" >
                                        <script>
                                            var elmt = document.getElementById('valume-change');
                                            elmt.setAttribute('value',localStorage.getItem('cdu-game-volume'));
                                        </script>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <form action="{{ url('/logout') }}" method="post">
                                {{ csrf_field() }}
                                <button style="margin-top: 8px;" class="btn btn-link" type="submit">Logout</button>
                            </form>
                        </li>
                        
                    @else
                        <li><a href="{{ url('/login') }}">Login</a></li>
                        <li><a href="{{ url('/register') }}">Register</a></li>
                    @endif
            @endif
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown button
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
  </div>
</div>