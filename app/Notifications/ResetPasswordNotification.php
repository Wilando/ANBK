<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Auth\Notifications\ResetPassword;

class ResetPasswordNotification extends Notification
{
    use Queueable;

    public $url;
    public $token;
    public $email;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
//    public function __construct(string $url, $token, $email)
//    {
//        $this->url = $url;
//        $this->token = $token;
//        $this->email = $email;
//    }

    public function __construct(string $token, $email)
    {
        $this->token = $token;
        $this->email = $email;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
//        if (static::$toMailCallback) {
//            return call_user_func(static::$toMailCallback, $notifiable, $this->token);
//        }

        return (new MailMessage)
            ->line('You are receiving this email because we received a password reset request for your account.')
//            ->action('Click to reset password', $this->url)
            ->action('Click to reset password', env("FRONTEND_URL").'/reset-password?token=' . $this->token.'&email='.$this->email)
            ->line('This password reset link will expire in 60 minutes.')
            ->line('If you did not request a password reset, no further action is required.')
            ->salutation('Best Regards');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
