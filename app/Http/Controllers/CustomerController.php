<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Customer;
use Illuminate\Http\Request;
use nilsenj\Toastr\Facades\Toastr;


class CustomerController extends Controller
{

    public function list()
    {
        $customers = Customer::query()
            ->orderBy('id', 'desc')
            ->get();

        return view('pages.backend.customer.customer_list', [
            'customers' => $customers
        ]);
    }

    public function create(Request $request)
    {
        $customers = Customer::all();
          
        return view('pages.backend.customer.customer_create', [
            'customers' => $customers,
        ]);
    }

    public function store(Request $request)
    {
        $customers = Customer::all();

        $data = $this->validate($request, [
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'address' => '',
            "tax_no" => '', 
            "city" => '',
            "postal_code" => '',
            "country" => '',
        ]);

        $customers = new Customer();
        $customers->fill($data);
        $customers->save();

        if($customers){
            Toastr::success('New customer successfully');
        }
        else{
            Toastr::error('Unable to create new customer');
        }
  
        return view('pages.backend.customer.customer_create', [
            'customers' => $customers,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customer = Customer::find($id);
          
        return view('pages.backend.customer.customer_edit',compact('customer'));
    }


    public function update(Request $request, $id)
    {
        
        $request->validate([
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'address' => '',
            "tax_no" => '', 
            "city" => '',
            "postal_code" => '',
            "country" => '',
            ]);
            
            $customer = Customer::find($id);
            $input = $request->all();
            $customer->update($input);

            if($customer){
                Toastr::success('Customer updated successfully');
            }
            else{
                Toastr::error('Unable to updated customer infos');
            }
    
           return redirect()->route('customer_list');    
    
}

    public function destroy($id)
    {
        Customer::destroy($id);
        return back()->with('success', 'Customer Deleted with success!');
    }

}