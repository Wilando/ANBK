<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Notifications\ResetPasswordNotification;
use App\Notifications\VerifyEmailCustom;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// kalo pake verifikasi email
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Harishdurga\LaravelQuiz\Traits\QuizParticipant;

// kalo pake verifikasi email
// class User extends Authenticatable implements MustVerifyEmail
class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use Notifiable;
    use HasRoles;
    use QuizParticipant;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    //    protected $fillable = [
    //        'name',
    //        'username',
    //        'email',
    //        'password',
    //    ];

    protected $guarded = [
        'id',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'roles',
        'permissions',
        'email_verified_at',
        'avatar',
        'T_KUnker',
        'deleted_at',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function sendPasswordResetNotification($token)
    {
        //        $url = env("FRONTEND_URL").'/reset-password?token=' . $token;

        $this->notify(new ResetPasswordNotification($token, $this->email));
    }

    // kalo pake verifikasi email
    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmailCustom());
    }

    protected $appends = ['link_avatar'];

    public function getLinkAvatarAttribute()
    {
        //        $path = 'users/' . $this->avatar;
        if (empty($this->avatar)) {
            return asset('img/user.png');
        }
        $path = $this->avatar;
        $fileimage = Storage::disk('public')->path($this->avatar);
        if (file_exists($fileimage)) {
            return url('berkas/'.$path);
        }

        return null;
    }

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
//            $model->updated_by = Auth::user()->id ?? null;
        });
    }
}
