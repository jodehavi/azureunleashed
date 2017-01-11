@extends('layout/template')

@section('content')

    <div class="container">
        <p><a href="{{ url('books') }}">Home</a> / Cart</p>
        <h1>Checkout</h1>

        <hr>
        {{ $username }}
         @if (sizeof(Cart::content()) > 0)

            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th class="column-spacer"></th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    @foreach (Cart::content() as $item)
                    <tr>
                        <td><a href="{{ url('books', [$item->model->id]) }}">{{ $item->name }}</a></td>
                        <td><a href="{{ url('books', [$item->model->id]) }}">{{ $item->qty }}</a></td>
                        <td>${{ $item->subtotal }}</td>
                        <td class=""></td>
                    </tr>

                    @endforeach
                    <tr>
                        
                        <td></td>
                        <td class="small-caps table-bg" style="text-align: right">Subtotal</td>
                        <td>${{ Cart::instance('default')->subtotal() }}</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        
                        <td></td>
                        <td class="small-caps table-bg" style="text-align: right">Tax</td>
                        <td>${{ Cart::instance('default')->tax() }}</td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr class="border-bottom">
                        
                        <td style="padding: 40px;"></td>
                        <td class="small-caps table-bg" style="text-align: right">Your Total</td>
                        <td class="table-bg">${{ Cart::total() }}</td>
                        <td class="column-spacer"></td>
                        <td></td>
                    </tr>

                </tbody>
            </table>

            <a href="{{ url('/books') }}" class="btn btn-primary btn-lg">Cancel</a> &nbsp;
            <a href="#" class="btn btn-success btn-lg">Purchase</a>
        @else

            <h3>You have no items in your shopping cart</h3>
            <a href="{{ url('/books') }}" class="btn btn-primary btn-lg">Continue Shopping</a>

        @endif
        
@endsection