<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>CDU Learning Game</title>

        <!-- Fonts -->
        <link href="{!! asset('bootstrap/dist/css/bootstrap.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/style.css') !!}" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="{!! asset('jquery/dist/jquery.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('bootstrap/dist/js/bootstrap.min.js') !!}"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.ui.min.js"></script>
        <script type="text/javascript" src="{!! asset('js/modal.animate.js') !!}"></script>

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
                        <li>
                            <a href="#" data-toggle="modal" data-target="#about">About</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="intro-header">
            <div class="container">

                <!-- Home -->

                <div class="row">
                
                    <div class="col-lg-12">
                        <img src="{{URL::asset('/img/logo.png')}}" alt="profile Pic" height="200" width="250">
                    </div>
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
        <div id="about" class="modal" data-easein="bounceIn" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4>Team Members</h4>
                        <p>Bishal shrestha</p>
                        <p>Anil khadka</p>
                        <p>Sobit ranjit</p>
                        <p>Pujan Subedi</p>
                        
                        <hr>
                        <h4>Client</h4>
                        <p>Luis Herrera Diaz</p>
                        <hr>
                        <h4>Supervisor</h4>
                        <p>Mr sami azam</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </div>
        </div>

         @include('FrontSite.layouts.footer')

    </body>
</html>



        