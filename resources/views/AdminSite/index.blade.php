@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')
<style>
    .box{
        height: 140px;
    }
    .box>.text-inner{
        height: 110px;
        padding: 12px;
        color: #fff;
    }
    .text-inner>h1{
        font-weight: 800
    }
    .icon{
        transition: all .3s linear;
        position: absolute;
        top: 10px;
        right: 25px;
        z-index: 0;
        font-size: 90px;
        color: rgba(0,0,0,0.15);
    }
    .box>.footer{
        display: block;
        text-align: center;
        text-decoration: none;
        margin-bottom: 0px;
        padding: 5px 0px 5px 0px;
        background: rgba(0, 0, 0, 0.15);
        color: #fff;
    }
</style>
<div class="col-md-12" style="background: #f7f7f7; padding-bottom: 15px">
    <h1 style="text-align: center">Welcome Admin</h1>
    <div class="row">
        <div class="col-md-4" >
            <div class="box" style="background: #00ffb8">
                <div class="text-inner">
                    <h1>{{count($groups)}}</h1>
                    <p>Groups</p>
                </div>
                <div class="icon">
                    <i class="fa fa-users"></i>
                </div>

                <a href="{{url('admin/group/index')}}" class="footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-4" >
            <div class="box" style="background: #ff5959">
                <div class="text-inner">
                    <h1>{{count($students)}}</h1>
                    <p>Students</p>
                </div>
                <div class="icon">
                    <i class="fa fa-male"></i>
                    <i class="fa fa-female"></i>
                </div>

                <a href="{{url('admin/student/index')}}" class="footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-4" >
            <div class="box" style="background: #ffcc59">
                <div class="text-inner">
                    <h1>{{count($questions)}}</h1>
                    <p>Questions</p>
                </div>
                <div class="icon">
                    <i class="fa fa-file-text-o"></i>
                </div>

                <a href="{{url('admin/question/index')}}" class="footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </div>
</div>
<script>
    $('.box').mouseover(function (e) {
        $(this).find('.icon').css({
            'font-size': '100px'
        });
    })
    $('.box').mouseout(function (e) {
        $(this).find('.icon').css({
            'font-size': '90px'
        });
    })
</script>
@endsection