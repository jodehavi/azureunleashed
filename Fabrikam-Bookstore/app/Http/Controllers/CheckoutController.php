<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\OrderDetail;
use App\Order;

use \Cart as Cart;

class CheckoutController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   public function index(Request $request)
    {
        $user = $request->user();
        $data = array(
                    'username'  => $user->name,
                    'cards' => $user->cards
                );
        return view('checkout', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   public function checkout(Request $request)
    {
        $data=$request->all();

        $user = $request->user();

        $orderDetails = array();

        foreach (Cart::content() as $item){
            $orderDetails[] = new OrderDetail([
                'bookid' => $item->id,
                'lineitemprice' => $item->subtotal
            ]);
        }

        $order = new Order([
            'total' => Cart::total()
        ]);

        $user->orders()->save($order)->orderDetails()->saveMany($orderDetails);
        Cart::destroy();
        return view('complete');
    }

}
