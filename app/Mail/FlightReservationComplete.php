<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class FlightReservationComplete extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $response;

    public $booking;

    public $profile;

    public function __construct($response, $booking, $profile)
    {
        $this->response = $response;
        $this->booking  = $booking;
        $this->profile  = $profile;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Reservation Crée avec Succès')
            ->from('no-reply@TravelAgency.com',config('app.name'))
            ->markdown('emails.FlightReservationComplete');
    }
}
