@extends('layout.template')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Add a new card</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/cards') }}">
                        {{ csrf_field() }}


                        <div class="form-group{{ $errors->has('cardno') ? ' has-error' : '' }}">
                            <label for="cardno" class="col-md-4 control-label">Card Number</label>

                            <div class="col-md-6">
                                <input id="cardno" type="text" class="form-control" name="cardno" value="{{ old('cardno') }}" required>

                                @if ($errors->has('cardno'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('cardno') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('billingaddress') ? ' has-error' : '' }}">
                            <label for="billingaddress" class="col-md-4 control-label">Billing Address</label>

                            <div class="col-md-6">
                                <input id="billingaddress" type="text" class="form-control" name="billingaddress" value="{{ old('billingaddress') }}" required>

                                @if ($errors->has('cardno'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('billingaddress') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('expdate') ? ' has-error' : '' }}">
                            <label for="expdate" class="col-md-4 control-label">Exp. Date</label>

                            <div class="col-md-6">
                                <input id="expdate" type="text" class="form-control" name="expdate" value="{{ old('expdate') }}" required>

                                @if ($errors->has('cardno'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('expdate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                            {{ Form::hidden('redirect', 'cards') }}
                        
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
