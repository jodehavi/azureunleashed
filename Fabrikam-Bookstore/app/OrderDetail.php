<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use Notifiable;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $fillable = [
        'bookid', 'lineitemprice'
    ];

    public function order()
    {
        return $this->belongsTo('App\Order');
    }

    protected $table = 'orderdetails';
}
