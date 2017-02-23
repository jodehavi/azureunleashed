@extends('layout/template')

@section('content')
 <h1>Credit Cards</h1>
 <a href="{{url('/cards/create')}}" class="btn btn-success">Add a card</a>
 <hr>
 <table class="table table-striped table-bordered table-hover">
     <thead>
     <tr class="bg-info">
         <th>Card Number</th>
         <th>Billing Address</th>
         <th>Exp. Date</th>
         <th colspan="2">Actions</th>
     </tr>
     </thead>
     <tbody>
     @foreach ($cards as $card)
         <tr>
             <td>{{ $card->cardno }}</td>
             <td>{{ $card->billingaddress }}</td>
             <td>{{ $card->expdate }}</td>
             <td><a href="{{route('cards.edit',$card->id)}}" class="btn btn-warning">Update</a></td>
             <td>
             {!! Form::open(['method' => 'DELETE', 'route'=>['cards.destroy', $card->id]]) !!}
             {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
             {!! Form::close() !!}
             </td>
         </tr>
     @endforeach

     </tbody>

 </table>
@endsection