@extends('FrontSite.layouts.main')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="margin-top: 40px">
            <div class="panel panel-default">
                <div class="panel-heading"></div>

                <div class="panel-body">
                    <h3 class="text-danger">Token has been expired. Please try another one</h3>
                    <a href="{{url('/password/reset')}}">Click for new token</a>
                </div>
            </div>
        </div>
    </div>
</div>  
@endsection