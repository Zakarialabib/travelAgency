<?php

namespace App\Http\Conversations;
use App\Booking;
use Exception;
use BotMan\BotMan\Messages\Conversations\Conversation;

class BookingConversation extends Conversation
{
    public function confirmBooking()
    {
        try{
        $user = $this->bot->userStorage()->find();
        /**
         * save order in DB
         */
        $order = new Order;
        $orderId=  mt_rand(1000000000, 9999999999);    
        $order->id =  $orderId;
        $order->user_name = $user->get('name');
        $order->address = $user->get('address');
        $order->pizza_type = $user->get('pizza_type');
        $order->pizza_name = $user->get('pizza_name');
        $order->size = $user->get('size');
        $order->quantity = $user->get('quantity');
        $order->delivery_time = $user->get('delivery_time');
        $order->created_at = now();
        $order->updated_at = now();
        $ordered = $order->save();

        
        if($ordered){
            $message = '------------------------------------------------ <br>';
            $message .= 'Name : '.$user->get('name').'<br>';
            $message .= 'Order Id : '.$orderId.'<br>';
            $message .= 'address : '.$user->get('address').'<br>';
            $message .= 'Pizza name : '.$user->get('pizza_type').'-'.$user->get('pizza_name').'<br>';
            $message .= 'Size : '.$user->get('size').'<br>';
            $message .= 'Quantity : '.$user->get('quantity').'<br>';
        
            $message .= '------------------------------------------------';

            $this->say('Great. Your booking has been confirmed. Here is your booking details. <br><br><br><br>'.$message.'<br><br> You can track your order by the order ID');
         }else{
            $this->say('Something wrong in creating order!');
         }
        }catch(Exception $e){
            $this->say('Something wrong in creating order!');

        }
}

    /**
     * Start the conversation.
     *
     * @return mixed0
     */
    public function run()
    {
        $this->confirmBooking();
    }
}