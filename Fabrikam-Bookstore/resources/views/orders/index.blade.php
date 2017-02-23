@extends('layout/template')

@section('content')
 <h1>Order History</h1>
 
 <hr>
 <table class="table table-striped table-bordered table-hover">
     <thead>
     <tr class="bg-info">
         <th>Order Number</th>
         <th>Total</th>
         <th>Created Date</th>
     </tr>
     </thead>
     <tbody>
     @foreach ($orders as $order)
         <tr>
             <td>{{ $order->orderid}}</td>
             <td>{{ $order->total }}</td>
             <td>{{ $order->created_at }}</td>
           </tr>
     @endforeach

     </tbody>

 </table>
@endsection