<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Supplier;
use App\User;
use Illuminate\Http\Request;
use nilsenj\Toastr\Facades\Toastr;

class SupplierController extends Controller
{
    public function list()
    {
        $suppliers = Supplier::query()
            ->orderBy('created_at', 'desc')
            ->get();

        return view('pages.backend.supplier.supplier_list', [
            'suppliers' => $suppliers
        ]);
    }

    
    public function create(Request $request)
    {
        $suppliers = Supplier::all();
          
        return view('pages.backend.supplier.supplier_create', [
            'suppliers' => $suppliers,
        ]);
    }

    public function store(Request $request)
    {
        $suppliers = Supplier::all();

        $data = $this->validate($request, [
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'company_name' => '',
            "tax_number" => '', 
            "address" => '',
            "city" => '',
            "postal_code" => '', 
            "country" => '',
        ]);

        $suppliers = new Supplier();
        $suppliers->fill($data);
        $suppliers->save();
  
        if($suppliers){
            Toastr::success('New supplier created successfully');
        }
        else{
            Toastr::error('Unable to create new supplier');
        }

        return view('pages.backend.supplier.supplier_create', [
            'suppliers' => $suppliers,
        ]);
    }

    public function edit($id)
    {
        $supplier = Supplier::find($id);
        return view('pages.backend.supplier.supplier_edit',compact('supplier'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'company_name' => '',
            "tax_number" => '', 
            "address" => '',
            "city" => '',
            "postal_code" => '', 
            "country" => '',
            ]);
            
            $supplier = Supplier::find($id);
            $input = $request->all();
            $supplier->update($input);

            if($supplier){
                Toastr::success('Supplier updated successfully');
            }
            else{
                Toastr::error('Unable to updated supplier infos');
            }
    
           return redirect()->route('supplier_list');    
}

    public function destroy($id)
    {
        Supplier::destroy($id);
        return back()->with('success', 'Supplier Deleted with success!');
    }
}
