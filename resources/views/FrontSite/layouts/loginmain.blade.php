<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>CDU Learning Game</title>
        
        <link href="{!! asset('bootstrap/dist/css/bootstrap.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('font-awesome-4.7.0/css/font-awesome.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/select2.min.css') !!}" rel="stylesheet" type="text/css" />
        
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="{!! asset('css/left-menu.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/style.css') !!}" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="{!! asset('jquery/dist/jquery.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('bootstrap/dist/js/bootstrap.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/select2.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/app.js') !!}"></script>
    </head>
    <body>
        @include('FrontSite.layouts.navbar')
        
            <div class="intro-header">
                @yield('content')
            </div>
        <nav class="navbar navbar-default navbar-fixed-bottom topnav" role="navigation">
                <footer>
                        <div class="row">
                            <div class="col-lg-12">

                                <center><p class="copyright text-muted small">Copyright © CDU 2017.</p></center>
                            </div>
                        </div>
                </footer>
        </nav>
    </body>
    
</html>
