<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Admin\notify;
use App\Emailsetting;
use App\User;
use App\Setting;
use App\Language;
use App\Newsletter;
use Illuminate\Http\Request;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;

class NewsletterController extends Controller
{

    public function newsletter(Request $request){
        
        $newsletters = Newsletter::orderBy('id', 'DESC')->get();

        return view('backend.newsletter.index', compact('newsletters'));
    }

    // Add newsletter Category
    public function add(){
        return view('backend.newsletter.add');
    }

    // Store newsletter Category
    public function store(Request $request){
        

        $request->validate([
            'email' => 'required|max:150',
        ]);

        Newsletter::create($request->all());

        $notification = array(
            'messege' => 'Newsletter Added successfully!',
            'alert' => 'success'
        );
        return redirect()->back()->with('notification', $notification);
    }

    // newsletter Category Delete
    public function delete($id){

        $newsletter = Newsletter::find($id);
        $newsletter->delete();

        return back();
    }

    // newsletter Category Edit
    public function edit($id){

        $newsletter = Newsletter::find($id);
        return view('backend.newsletter.edit', compact('newsletter'));

    }

    // Update newsletter Category
    public function update(Request $request, $id){

        $id = $request->id;
         $request->validate([
            'email' => 'required|max:150',
        ]);

        $newsletter = Newsletter::find($id);
        $newsletter->update($request->all());

        $notification = array(
            'messege' => 'Newsletter Updated successfully!',
            'alert' => 'success'
        );
        return redirect(route('admin.newsletter'))->with('notification', $notification);
    }


    public function mailsubscriber() {
        return view('backend.newsletter.mail');
      }

  
  
    public function subscsendmail(Request $request) {
        $request->validate([
          'subject' => 'required',
          'content_message' => 'required'
        ]);
  
        $sub = $request->subject;
        $msg = $request->content_message;
        $users = Newsletter::all();
        foreach ($users as $user){
            Mail::send('backend.newsletter.test', ['subject'=>$sub, 'content'=>$msg, 'user'=>$user],
             function($message) use ($user){
                $message->to($user->email)->from('zlabib@alphaboost.ma','zakaria labib')->
                subject('welcome');
             });
        }
        $notification = array(
            'messege' => 'Newsletter Updated successfully!',
            'alert' => 'success'
        );
        return redirect(route('admin.newsletter'))->with('notification', $notification);
      }


}