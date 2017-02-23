@extends('layout.template')
@section('content')
    <h1>Update Card</h1>
    {!! Form::model($card,['method' => 'PATCH','route'=>['cards.update',$card->id]]) !!}
    <div class="form-group">
        {!! Form::label('cardno', 'Card Number:') !!}
        {!! Form::text('cardno',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('billingaddress', 'Billingaddress:') !!}
        {!! Form::text('billingaddress',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('expdate', 'Exp. Date:') !!}
        {!! Form::text('expdate',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::submit('Update', ['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
@stop