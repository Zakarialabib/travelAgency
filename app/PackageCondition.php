<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PackageCondition extends Model
{
    protected $guarded = [];
    
    public function package()
    {
        return $this->belongsTo(Package::class, 'package_id', 'id');
    }
}