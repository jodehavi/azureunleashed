<?php

namespace App\Http\Controllers;

use App\CreditCard;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;

use Request;

class CardsController extends Controller
{
     /**
    * Display a listing of the resource.
    *
    * @return Response
    */
   public function index()
   {
     
       //$user = $user;
        $user = Request::user();
        $cards = $user->cards;
       return view('cards.index', compact('cards'));
    
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

    public function edit($id)
   {
      //
      $card=CreditCard::find($id);
      return view('cards.edit',compact('card'));
   }

     public function update($id)
   {
      //
       $cardUpdate=Request::all();
       $card=CreditCard::find($id);
       $card->update($cardUpdate);
       return redirect('cards');
   }
   /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    * @return Response
    */
    
   public function destroy($id)
   {
      //
      CreditCard::find($id)->delete();
      return redirect('cards');
   }
   
   /**
    * Store a newly created resource in storage.
    *
    * @return Response
    */
   public function store(Request $request)
   {
      //
        $data=Request::all();

         $user = Request::user();

         $user->cards()->save(new CreditCard($data));

        return redirect('cards');
      
        
   }

}
