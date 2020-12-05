<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class Sancion extends Notification
{
    use Queueable;
    public $fromUser;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->fromUser = $user;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    public function routeNotificationForMail()
    {
        return $this->tx_email;
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $subject = sprintf('%s: You\'ve got a new message from %s!', config('app.name'), $this->fromUser->name);
        $greeting = sprintf('Hello %s!', $notifiable->name);

        $url = url('/notificacion/'.$this->invoice->id);
 
        return (new MailMessage)
                    ->from('test@example.com', 'Example') //
                    ->subject($subject)
                    ->greeting($greeting)
                    ->salutation('Yours Faithfully')
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', $url)
                    ->line('Thank you for using our application!');
    
        //use Illuminate\Support\Facades\Notification;
        //Notification::send($toUser, new NewMessage($fromUser));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            'invoice_id' => $this->invoice->id,
        'amount' => $this->invoice->amount,
        ];
    }
}
