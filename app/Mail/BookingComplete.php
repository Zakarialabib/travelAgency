<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class BookingComplete extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $response;

    public $booking;


    public function __construct($response, $booking)
    {
        $this->response = $response;
        $this->booking  = $booking;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Reservation Crée avec Succès')
            ->from('no-reply@rentacstours.com',config('app.name'))
            ->markdown('emails.BookingComplete');
    }
}
