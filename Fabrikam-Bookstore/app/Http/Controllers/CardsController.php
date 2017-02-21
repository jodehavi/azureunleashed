<?php

namespace App\Http\Controllers;

use App\CreditCard;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class CardsController extends Controller
{
     /**
    * Display a listing of the resource.
    *
    * @return Response
    */
   public function index()
   {
    
       return view('cards');
    
   }
   /**
    * Show the form for creating a new resource.
    *
    * @return Response
    */
   public function create()
   {
      //
      return view('cards.create');
   }
   /**
    * Store a newly created resource in storage.
    *
    * @return Response
    */
   public function store(Request $request)
   {
      //
        $data=$request->all();

         $user = $request->user();

         $user->cards()->save(new CreditCard($data));

      return redirect('checkout');
      
        
   }

}
