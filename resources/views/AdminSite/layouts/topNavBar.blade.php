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
      <a class="navbar-brand topnav" href="{{ url('/admin') }}">CDU Learning Game</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav navbar-right">
        @if(null !== Auth::guard('admin')->user())
         <li><a href="{{ url('/admin/home') }}">{{Auth::guard('admin')->user()->name}}</a></li>
         <li>
                <form action="{{ url('/admin/logout') }}" method="post">
                    {{ csrf_field() }}
                    <button class="btn btn-link" type="submit">Logout</button>
                </form>
        </li>
        @endif
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

