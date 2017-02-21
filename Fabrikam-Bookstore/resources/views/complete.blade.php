@extends('layout/template')

@section('content')
    <div class="container">
        <h1>Order completed. Thank you.</h1>
        <a href="{{ url('/books') }}" class="btn btn-primary btn-lg">Continue Shopping</a>
@endsection