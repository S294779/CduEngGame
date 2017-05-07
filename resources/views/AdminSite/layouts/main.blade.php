<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>CDU Learning Game admin</title>

        <link href="{!! asset('bootstrap/dist/css/bootstrap.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('font-awesome-4.7.0/css/font-awesome.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/select2.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/jquery.contextMenu.min.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/adminStyle.css') !!}" rel="stylesheet" type="text/css" />

        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="{!! asset('css/left-menu.css') !!}" rel="stylesheet" type="text/css" />
        <link href="{!! asset('css/scrollbar.css') !!}" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="{!! asset('jquery/dist/jquery.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('bootstrap/dist/js/bootstrap.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/leftMenu.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/select2.min.js') !!}"></script>

        <script type="text/javascript" src="{!! asset('js/jquery.inputmask.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/jquery.inputmask.extensions.js') !!}"></script>

        <script type="text/javascript" src="{!! asset('js/jquery.ui.position.min.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/jquery.contextMenu.min.js') !!}"></script>

        <script type="text/javascript" src="{!! asset('js/app.js') !!}"></script>
        <script type="text/javascript" src="{!! asset('js/formError.js') !!}"></script>
        <style>
            #main .intro-header {
                text-align: left;
                margin-top: 20px;
                padding: 0px 15px 0px 15px;
            }
            .breadcrumb {
                padding: 0;
                margin-bottom: 0;
                list-style: none;
                background-color: #f5f5f5;
                border-radius: 4px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        @include('AdminSite.layouts.topNavBar')
        <div id="mySidenav" class="sidenav" style="">
            @include('AdminSite.layouts.leftside')
        </div>
        <div id="main" style="margin-top: 50px">
            <script>
        var sideBar = document.getElementById('mySidenav');
        sideBar.style.width = localStorage.getItem('manage-mySidenav-width');
        var main = document.getElementById('main');
        main.style.marginLeft = localStorage.getItem('manage-main-margin-left');</script>




            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li>
                            <a class="btn btn-sm btn-success" id="sidebar-toggle-btn" ><span class="glyphicon glyphicon-list"></span></a>
                        </li>
                        @yield('breadcrumb')
                    </ul>

                </div>
            </div>    
            <div class="row" style="margin-bottom: 40px">
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
            </div>
        </div>
    </body>
    <script>
                $(document).ready(function() {
        $.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': '{{ csrf_token() }}'
        }
        });
                $('[data-method="post"]').on('click', function (e) {
        e.preventDefault();
                var result = confirm('Are you sure you want delete this item?')
                if (result) {

        $('<form action="' + $(this).attr('href') + '" method="post"><input type="hidden" name="_token" value="{{csrf_token()}}"></form>').appendTo('body').submit();
        }
        });
        });

    </script>
</html>
