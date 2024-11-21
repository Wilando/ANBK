<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;


class MisiPemda extends Model
{
  use HasFactory;

  protected $primaryKey = "id_misi";
  protected $table = "master_misi_pemda";
  protected $guarded = [
    "id_misi"
  ];

  protected static function booted()
  {
    static::creating(function ($model) {
      $model->created_at = now();
      $model->created_by = Auth::user()->id;
      $model->updated_at = now();
      $model->updated_by = Auth::user()->id;
    });

    static::updating(function ($model) {
      $model->updated_at = now();
      $model->updated_by = Auth::user()->id;
    });
  }

  // relations

  public function ikuRpjmd()
  {
    return $this->hasMany(IkuRpjmd::class, "id_misi", "id_misi");
  }

  public function scopeView()
  {
    // return DB::table("v_misi_pemda");
    return DB::table($this->table);
  }
}
