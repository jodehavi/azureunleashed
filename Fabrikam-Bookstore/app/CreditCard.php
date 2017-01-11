<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class CreditCard extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'cardnumber', 'billingaddress', 'expiration',
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
