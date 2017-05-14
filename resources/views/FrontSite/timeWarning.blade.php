@extends('FrontSite.layouts.main')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="intro-message" style="padding-top: 8%;">
                <h1 style="text-align: center">You are logged for Charles Darwin University Learning Game</h1>

                <hr class="intro-divider">
                <h3 style="font-style: italic; text-align: center">You can't play game right now</h3>
                
                    <div class="col-xs-3 col-xs-offset-5">
                        <h5 style="font-style: italic; text-align: left">Playing times are</h5>
                        @foreach($times as $time)
                        <h5 style="font-style: italic; text-align: left">{{$time['from']}} - {{$time['to']}}</h5>
                        @endforeach
                    </div>
            </div>
            
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jstimezonedetect/1.0.4/jstz.min.js'></script>
    <script>
      $(document).ready(function(e){
          var timeZone = jstz.determine().name();
          var oldtimeZne = '{{Auth::user()->timezone}}';
          if(oldtimeZne != timeZone){
              $.ajax({
                url:'set-time-zone',
                type:'post',
                data:{
                    timezone:timeZone
                },
                success:function(response){
                    location.reload();
                }
            });
          }
      })
    </script>

</div>
@endsection