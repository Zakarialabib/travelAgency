<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    const STATUS_DUE = 0;
    const STATUS_PAID = 1;
    const STATUS_PENDING = 2;
    const STATUS_PARTIAL = 3;

    const MEDIUM_CASH = 0;
    const MEDIUM_CHECK = 1;
    const MEDIUM_DEPOSIT = 2;
}