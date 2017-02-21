<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CreditCard extends Model
{
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $fillable = [
        'cardno', 'billingaddress', 'expdate',
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    protected $table = 'creditcards';
}
