@extends('layout/template')

@section('content')
 <h1>Welcome to the online store</h1>
 @if (Auth::user() && Auth::user()->name =='TestUser')
    <a href="{{url('/books/create')}}" class="btn btn-success">Create Book</a>
 @endif
 <hr>
 <table class="table table-striped table-bordered table-hover">
     <thead>
     <tr class="bg-info">
         <th>Id</th>
         <th>ISBN</th>
         <th>Title</th>
         <th>Author</th>
         <th>Publisher</th>
         <th>Thumbs</th>
          <th>View</th>
          @if (Auth::user() && Auth::user()->name =='TestUser')   
            <th colspan="2">Actions</th>
        @endif
     </tr>
     </thead>
     <tbody>
     @foreach ($books as $book)
         <tr>
             <td>{{ $book->id }}</td>
             <td>{{ $book->isbn }}</td>
             <td>{{ $book->title }}</td>
             <td>{{ $book->author }}</td>
             <td>{{ $book->publisher }}</td>
             <td>
                
                    <img src="{{asset('img/'.$book->image.'.jpg')}}" height="35" width="30"></td>
                 <td>
                <a href="{{url('books',$book->id)}}" class="btn btn-primary">View</a></td>
             @if (Auth::user() && Auth::user()->name =='TestUser')       
            
             <td><a href="{{route('books.edit',$book->id)}}" class="btn btn-warning">Update</a></td>
             <td>
             {!! Form::open(['method' => 'DELETE', 'route'=>['books.destroy', $book->id]]) !!}
             {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
             {!! Form::close() !!}
             </td>
             @endif
         </tr>
     @endforeach

     </tbody>

 </table>
@endsection