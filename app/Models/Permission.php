<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Permission extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';
    protected $table = 'permissions';
    protected $guarded = [
        'id'
    ];

    protected static function booted()
    {
        static::creating(function ($model) {
            $model->created_at = now();
//            $model->created_by = Auth::user()->id;
            $model->updated_at = now();
//            $model->updated_by = Auth::user()->id;
        });

        static::updating(function ($model) {
            $model->updated_at = now();
//            $model->updated_by = Auth::user()->id;
        });
    }
}
