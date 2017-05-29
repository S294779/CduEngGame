<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>CDU Learning Game</title>

        <link href="{!! asset('bootstrap/dist/css/bootstrap.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('font-awesome-4.7.0/css/font-awesome.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/ion.rangeSlider.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/checkbox.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/ion.rangeSlider.skinModern.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/select2.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/ChatBox.css') !!}" rel="stylesheet" type="text/css" />



        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="{!! asset('css/left-menu.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/style.css') !!}" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="{!! asset('jquery/dist/jquery.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('bootstrap/dist/js/bootstrap.min.js') !!}"></script>

        <script type="text/javascript" src="{!! asset('js/formError.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/jquery.runner-min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/jquery.slimscroll.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/jquery.visible.min.js') !!}"></script>


        <style>
            .form-error-message{
                color:#b14942;
            }
            .control-label{
                font-weight: bold;
            }
            #game-played-time{
                color: #06c70e;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        @include('FrontSite.layouts.navbar')
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2" style="margin-top: 18px;">
                    @if(Session::has('danger'))
                    <div class="alert-danger alert fade in" >
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        {{Session::get('danger')}}
                    </div>
                    @endif
                    @if(Session::has('success'))
                    <div class="alert-success alert fade in" >
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        {{Session::get('success')}}
                    </div>
                    @endif
                    @if(Session::has('warning'))
                    <div class="alert-warning alert fade in" >
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        {{Session::get('warning')}}
                    </div>
                    @endif
                    @if(Session::has('info'))
                    <div class="alert-info alert fade in" >
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        {{Session::get('info')}}
                    </div>
                    @endif
                </div>
            </div>
        </div>
        @yield('content')

        <!-- <footer>
            <div class="col-lg-12">
                <center><p class="copyright text-muted small">Copyright © CDU 2017.</p></center>
            </div>
        </footer> -->
        @include('FrontSite.layouts.footer')

    </body>
    <script type="text/javascript" src="{!! asset('js/select2.min.js') !!}"></script>
    <script type="text/javascript" src="{!! asset('js/ion.rangeSlider.min.js') !!}"></script>
    <script type="text/javascript" src="{!! asset('js/app.js') !!}"></script>
    <script>
        $.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
                cache: false
        });

    </script>
</html>
