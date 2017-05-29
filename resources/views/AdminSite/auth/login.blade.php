@extends('AdminSite.layouts.login')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/admin/login') }}">
                        {{ csrf_field() }}
                        <fieldset>
                            <h2 style="text-align: center">Please Sign In</h2>
                            <hr class="colorgraph">
                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <div class="col-md-12">
                                <input id="email" type="email" placeholder="Email Address" class="form-control input-lg" name="email" value="{{ old('email') }}">

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <div class="col-md-12">
                                <input id="password" placeholder="Password" type="password" class="form-control input-lg" name="password">

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

<!--                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember"> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>-->
                            <hr class="colorgraph">
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-lg btn-success btn-block">
                                    <i class="fa fa-btn fa-sign-in"></i> Login
                                </button>
                            </div>
<!--                            <a class="btn btn-link" href="{{ url('/password/reset') }}">Forgot Your Password?</a>-->
                        </div>
                        </fieldset>
                    </form>
        </div>   
    </div>
</div>
@endsection
