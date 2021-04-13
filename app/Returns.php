<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Returns extends Model
{
    const STATUS_PENDING = 0;
    const STATUS_COMPLETE = 1;

    protected $table = 'returns';

    protected $fillable = [
        'user_id', 'reference_no', 
        "total_qty","tax", "total_tax", "total_cost", "grand_total",
        "status", "payment_status", "paid_amount", "paid_by",
         "document", "note", "staff_note", "payment_note", "is_locked"
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function details()
    {
        return $this->hasMany(ReturnDetails::class, 'return_id', 'id');
    }

}