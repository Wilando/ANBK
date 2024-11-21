<?php

namespace App\Notifications;

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;

class VerifyEmailCustom extends VerifyEmail
{
    public function __construct()
    {
        //
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
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
//        $prefix = 'https://your-spa-url-here.com/verify-email?url=';
//        $prefix = env('FRONTEND_URL') . '/verify-email?url=';
//        $verificationUrl = $this->verificationUrl($notifiable);

//        return (new MailMessage)
//            ->line('The introduction to the notification.')
//            ->action('Notification Action', $prefix . urlencode($verificationUrl))
//            ->line('Thank you for using our application!');

        $verificationUrl = $this->verificationUrl($notifiable);
        $frontendURL = env('FRONTEND_URL') . "?email_verify_url=" . $verificationUrl;

        return (new MailMessage)
            ->subject('Verify Email Address')
            ->line('Click the button below to verify your email address.')
            ->action('Verify Email Address', $frontendURL);


//        return (new MailMessage)
//            ->subject('Verify Email Address')
//            ->line('Please click the button below to verify your email address.')
//            ->action('Verify Email Address', $this->verificationUrl($notifiable))
//            ->line('If you did not create an account, no further action is required.');
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
