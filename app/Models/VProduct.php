<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VProduct extends Model
{
    use HasFactory;
    protected $table = 'v_products';
    public $timestamps = false;
    protected $primaryKey = "barcode";
    protected $keyType = "string";
}
