<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use \Cart as Cart;

class CheckoutController extends Controller
{

    public function __construct()
    {
        //$this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   public function index(Request $request)
    {
        $user = $request->user();
        
        return view('checkout', ['username' => $user->name]);
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   public function checkout(Request $request)
    {
        Cart::add($request->id, $request->name, 1, $request->price)->associate('App\Book');
        return redirect('cart')->withSuccessMessage('Item was added to your cart!');
    }

}
