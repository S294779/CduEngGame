@extends('FrontSite.layouts.main')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="intro-message" style="padding-top: 8%;">
                <h1 style="text-align: center">You are logged for Charles Darwin University Learning Game</h1>

                <hr class="intro-divider">
                <h3 style="font-style: italic; text-align: center">You are not involved in any group. Please Select Group below.</h3>
                <form action="{{url('/home')}}" method="post">
                    {{csrf_field()}}
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-2 col-sm-offset-5">
                                <label class="control-label">Group</label>
                                <select class="form-control select2-seach" name="group">
                                    @foreach($groupModels as $groupModel)
                                    <option value="{{$groupModel->id}}">{{$groupModel->group_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </form>
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