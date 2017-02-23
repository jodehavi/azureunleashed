<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Order extends Model
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'total'
    ];

    public function orderDetails()
    {
        return $this->hasMany('App\OrderDetail');
    }

     public function user()
    {
        return $this->belongsTo('App\User');
    }
}
