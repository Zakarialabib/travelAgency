<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    const SALE_TYPE = 1;
    const PURCHASE_TYPE = 2;
    const RETURN_TYPE = 3;
}
