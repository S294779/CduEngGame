<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="{!! asset('bootstrap/dist/css/bootstrap.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/style.css') !!}" rel="stylesheet" type="text/css" />

        <!-- Styles -->
        
    </head>
    <body>
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
        <li><a href="#">About</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
        <div class="intro-header">
            <div class="container">

                <!-- Home -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-message">
                            <h1>Welcome to Charles Darwin University Learning Game</h1>

                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <li>
                                    <a href="{{url('/login')}}" class="btn btn-lg btn-success btn-block"><i class=""></i> <span class="network-name">Log In</span></a>
                                </li>
                                <li>
                                    <a href="{{url('/register')}}" class="bbtn btn-lg btn-primary btn-block"><i class="w"></i> <span class="network-name">Register</span></a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- /home -->


            </div>
        </div>
    </body>
</html>
