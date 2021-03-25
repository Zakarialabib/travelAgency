<?php

namespace App\Conversation;

use Validator;
use BotMan\BotMan\Messages\Outgoing\Question;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Conversations\Conversation;
use BotMan\BotMan\Messages\Attachments\Image;
use BotMan\BotMan\Messages\Outgoing\OutgoingMessage;
use App\Booking;

class OnboardingConversation extends Conversation
{
   /**
     * Start the conversation.
     *
     * @return mixed
     */
    public function run()
    {
       $this->askBuy();
      
    }

    public function askBuy(){
        $question = Question::create('Want to travel ? ')
        ->callbackId('select_service')
        ->addButtons([
            Button::create('Yes')->value('yes'),
            Button::create('No')->value('no'),
        ]);
        $this->ask($question, function (Answer $answer) {

            if(in_array($answer->getText(),['yes','Yes','YES'])){
                $this->bot->userStorage()->save([
                    'size' => $answer->getText(),
                ]);
                /**
                 * ask pizza type
                 */ 
                $ask =  $this->askPizzaType();

                }elseif(in_array($answer->getText(),['no','No','NO'])){
                   $this->trackBooking();
                }
                else{
                    $this->say('Please select the Option by click on it.');
                    return $this->repeat();
                }
        });
    }

    public function askPizzaType()
    {
        $question = Question::create('Which kind of travel do you want ?')
                ->callbackId('select_service')
                ->addButtons([
                    Button::create('Veg Pizza')->value('Veg'),
                    Button::create('Non Veg Pizza')->value('Non Veg'),
                ]);

        $this->ask($question, function (Answer $answer) {  
            
            switch($answer->getValue()){

                case "Veg":
                case "VEG":
                case "Veg Pizza":
                case "veg":
                    $question = Question::create('Pick One ?')
                    ->callbackId('select_service')
                    ->addButtons([  
                        Button::create('Margherita')->value('Margherita'),
                        Button::create('Double Cheese Margherita')->value('Double Cheese Margherita'),
                        Button::create('Farm House')->value('Farm House'),
                        Button::create('Mexican')->value('Mexican'),
                    ]);
                    $this->bot->userStorage()->save([
                        'type' => $answer->getText(),
                    ]);
                      /**
                     * ask pizza type
                     */ 
                    $this->askPizzaName($question);
                    break;
                case "Non Veg":
                case "Non Veg Pizza":
                case "nonveg":
                case "non veg":
                case "non":
                    $question = Question::create('Pick One ?')
                    ->callbackId('select_service')
                    ->addButtons([
                        Button::create('Indi Chicken Tikka')->value('Indi Chicken Tikka'),
                        Button::create('PEPPER BARBECUE & ONION')->value('PEPPER BARBECUE & ONION'),
                        Button::create('CHICKEN FIESTA')->value('CHICKEN FIESTA'),
                        Button::create('Mexican')->value('Mexican'),
                    ]);
                    $this->bot->userStorage()->save([
                        'type' => $answer->getText(),
                    ]);
                    $this->askPizzaName($question);
                    break;
                default:
                    $this->say('Please select the Option by click on it.');
                    $this->repeat();
                
            }
        });
    }

    public function askPizzaName($question)
    {
        $this->ask($question, function (Answer $answer) {
            if ($answer->isInteractiveMessageReply()) {
                $this->bot->userStorage()->save([
                    'pizza_name' => $answer->getText(),
                ]);
                $this->askPizzaSize();
            }else{
                $this->say('Please select the Pizza from the list by click on it.');
               return $this->repeat();
           }
      });

    }
    public function askPizzaSize()
    { 
        $question = Question::create('How large ?')
            ->callbackId('select_service')
            ->addButtons([
                Button::create('Regular')->value('regular'),
                Button::create('Medium')->value('medium'),
                Button::create('Large')->value('large'),
            ]);

        $this->ask($question, function (Answer $answer) {
        switch($answer->getValue()){
            case "Regular":
            case "regular":
            case "medium":
            case "Medium":
            case "Large":
            case "large":
                $this->bot->userStorage()->save([
                    'size' => $answer->getText(),
                ]);
                $this->askQuantity(); 
                break;
            default:
                $this->say('Please select the Option by click on it.');
                $this->repeat();
            }
        });
    }

    public function askQuantity()
    { 
        $question = Question::create('How Many ?')
        ->callbackId('select_service')
        ->addButtons([
            Button::create('1')->value('1'),
            Button::create('2')->value('2'),
            Button::create('3')->value('3'),
            Button::create('4')->value('4'),
            Button::create('5')->value('5'),
            Button::create('6')->value('6'),
            Button::create('7')->value('7'),
        ]);
        $this->ask($question, function (Answer $answer) {
            switch($answer->getValue()){
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    $this->bot->userStorage()->save([
                        'quantity' => $answer->getText(),
                    ]);
                    $this->askDetails();
                    break;
                default:
                    $this->say('Please select the Option by click on it.');
                    $this->repeat();
                }
        });
    }

    public function askDetails(){
        $this->say('Got it. Let me just take your info to place your booking 😊');
        $this->ask('First up, What is your name?', function (Answer $answer) {
            $this->bot->userStorage()->save([
                'name' => $answer->getText(),
            ]);
            $this->ask('Finally the delivery address ?', function (Answer $answer) {
                                    
                $this->bot->userStorage()->save([
                'address' => $answer->getText(),
            ]); 
                $question = Question::create('When do you want it ?')
                    ->callbackId('select_time')
                    ->addButtons([
                        Button::create('in an hour')->value(1),
                        Button::create('in two hour')->value(2),
                        Button::create('in three hour')->value(3)
                    ]);
                $this->ask($question, function (Answer $answer) {
                    switch($answer->getValue()){
                        case "in an hour":
                        case "in 1 hour":
                        case 1 : 
                        case "in two hour":
                        case "in 2 hour":
                        case 2 : 
                        case "in three hour":
                        case "in 3 hour":
                        case 3 : 
                            $this->bot->userStorage()->save([
                                'date' => now()->addHour($answer->getValue())->format('H:i:s')
                            ]);

                          
                            
                                $this->bot->startConversation(new BookingConversation());
                                $this->say('Thank You 😊');

                                $question = Question::create(' Want to Track Booking ? ')
                                ->callbackId('select_service')
                                ->addButtons([
                                    Button::create('Yes')->value('yes'),
                                    Button::create('No')->value('no'),
                                ]);
                                
                                $this->ask($question, function (Answer $answer) {
                                    switch($answer->getText()){
                                        case 'Yes':
                                        case 'yes':
                                            $this->trackBooking();
                                            break;
                                        case 'No':
                                        case 'no':
                                            $this->askBuy();
                                        break;
                                        default:
                                            $this->askBuy();
                                    }
                                });
                              
                                    
                               
                            break;
                        default:
                            $this->say('Please select the Option by click on it.');
                            $this->repeat();
                        }

                    });
            });
        });

    }

    public function trackBooking(){

        $this->ask('Enter your Booking ID to track your next travel ?', function (Answer $answer) {
            $this->bot->userStorage()->save([
                'BookingID' => $answer->getText(),
            ]);
            $user = $this->bot->userStorage()->find();
            $booking = Booking::find($user->get('BookingID'));
            if(empty($Booking)){
                $this->say('Booking Not Found With this ID');
                $this->askBuy();
            }else{
                $this->say('Hi'.$booking->name.', You will begin your journey in "'. $booking->date.'" <br><br>');
            }
        });
    }
}