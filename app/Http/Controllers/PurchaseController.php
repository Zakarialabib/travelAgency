<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Purchase;
use App\PurchaseDetails;
use App\User;
use App\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use nilsenj\Toastr\Facades\Toastr;


class PurchaseController extends Controller
{
    public function list()
    {
        $purchases = Purchase::query()
            ->with('supplier')
            ->orderBy('created_at', 'desc')
            ->get();

        return view('pages.backend.purchase.purchase_list', [
            'purchases' => $purchases
        ]);
    }

    public function createView(Request $request)
    {
        $purchases = Purchase::all();
        $suppliers = Supplier::all();
        $users = User::all();
          
        return view('pages.backend.purchase.purchase_create', [
            'purchases' => $purchases,
            'suppliers' => $suppliers,
            'users' => $users,
        ]);
    }

    public function create(Request $request)
    {
        try {

            $data = $this->validate($request, [
                "reference_no" => "",
                "user_id" => "",
                "supplier_id" =>"",
                "name" => "",
                "qty" => "",
                "price" => "",
                "total" => "",
                "tax" => "",
                "tax_amount" => "",
                "sub_total" => "", 
                "status" => "", 
                "total_amount" => "",
                "payment_status" => "",
                "paid_by" => "",
                "paid_amount" => "",
                "payment_note" => "",
                "note" => "",
                "note" => "",
                "staff_note" => ""
            ]);

            $document = $request->document;
            if ($document) {
                $v = Validator::make(
                    [
                        'extension' => strtolower($request->document->getClientOriginalExtension()),
                    ],
                    [
                        'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                    ]
                );
                if ($v->fails())
                    return redirect()->back()->withErrors($v->errors());

                $documentName = $document->getClientOriginalName();
                $documentPath = $document->storeAs('purchases/documents', $data['reference_no'] . '-' . $documentName, 'public_upload');
                $data['document'] = $data['reference_no'] . '-' . $documentName;
            }

            $purchaseDetails = [];
            foreach ($data['name'] as $key => $name) {
                if($name) {
                    array_push($purchaseDetails, new PurchaseDetails([
                        'name' => $data['name'][$key],
                        'qty' => $data['qty'][$key], 
                        'price' => $data['price'][$key],
                        'total' => $data['total'][$key],
                    ]));
                }
            }

            $purchase = Purchase::create([
                'reference_no' => $data['reference_no'],
                'user_id' => $data['user_id'],
                'supplier_id' => $data['supplier_id'],
                'total_qty' => count($purchaseDetails),
                'tax' => $data['tax'],
                'total_tax' => $data['tax_amount'],
                'total_cost' => $data['sub_total'],
                'grand_total' => $data['total_amount'],
                'status' => $data['status'],
                'payment_status' => $data['payment_status'],  // need to define payment status
                'document' => $data['document'] ?? null,
                'paid_amount' => $data['paid_amount'],
                'paid_by' => $data['paid_by'],
                'payment_note' => $data['payment_note'],
                'note' => $data['note'],
                'staff_note' => $data['staff_note'],
            ]);

            if($purchase) {

                $purchase->details()->saveMany($purchaseDetails);

                Toastr::success("Purchase created successfully");

            } else {
                Toastr::error("Unable to create new Purchase");
            }
    
            return redirect(route('purchase_list'))->with('success', 'Purchase created successfully');

        } catch (\QueryException $e) {
            Toastr::error("Unable to update new Purchase");
            return back()->with('error', 'Unable to create new Purchase');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $purchase = Purchase::find($id);
        $suppliers = Supplier::all();
        $users = User::all();


        return view('pages.backend.purchase.purchase_edit',compact('purchase', 'users', 'suppliers'));
    }


    public function update(Request $request, $id)
    {
        try {

            $data = $request->validate([
                "reference_no" => "",
                "user_id" => "",
                "supplier_id" =>"",
                "name" => "",
                "qty" => "",
                "price" => "",
                "total" => "",
                "tax" => "",
                "tax_amount" => "",
                "sub_total" => "", 
                "status" => "", 
                "total_amount" => "",
                "payment_status" => "",
                "paid_by" => "",
                "paid_amount" => "",
                "note" => "",
                "payment_note" => "",
                "staff_note" => ""
            ]);

            $purchase = Purchase::find($id);

            if($purchase) {

                // handle document if exists
                $document = $request->document;
                if ($document) {
                    $v = Validator::make(
                        [
                            'extension' => strtolower($document->getClientOriginalExtension()),
                        ],
                        [
                            'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                        ]
                    );
                    if ($v->fails())
                        return redirect()->back()->withErrors($v->errors());

                    $documentName = $document->getClientOriginalName();
                    //$document->move('', $documentName);
                    $documentPath = $document->storeAs('purchases/documents', $data['reference_no'] . '-' . $documentName, 'public_upload');
                    $data['document'] = $data['reference_no'] . '-' . $documentName;
                } else {
                    // if we dont get document with the request
                    $data['document'] = $purchase->document;
                }

                // build details array from input
                $purchaseDetails = [];
                foreach ($data['name'] as $key => $name) {
                    if($name) {
                        array_push($purchaseDetails, new PurchaseDetails([
                            'name' => $data['name'][$key],
                            'qty' => $data['qty'][$key], 
                            'price' => $data['price'][$key],
                            'total' => $data['total'][$key],
                        ]));
                    }
                }

                //delete old purchase details
                $purchase->details()->delete();
                // insert new purchase details
                $purchase->details()->saveMany($purchaseDetails);

                $purchase->update([
                    'reference_no' => $data['reference_no'],
                    'user_id' => $data['user_id'],
                    'supplier_id' => $data['supplier_id'],
                    'total_qty' => $purchase->details()->count(),
                    'tax' => $data['tax'],
                    'total_tax' => $data['tax_amount'],
                    'total_price' => $data['sub_total'],
                    'grand_total' => $data['total_amount'],
                    'status' => $data['status'],
                    'payment_status' => $data['payment_status'],
                    'document' => $data['document'] ?? null,
                    'paid_amount' => $data['paid_amount'],
                    'paid_by' => $data['paid_by'],
                    'payment_note' => $data['payment_note'],
                    'note' => $data['note'],
                    'staff_note' => $data['staff_note'],
                ]);
                Toastr::success("Purchase updated successfully");
            } else {
                Toastr::error("Unable to update new Purchase");
            }

            return redirect(route('purchase_list'))->with('success', 'Update Purchase success!');

        } catch (\QueryException $e) {
            Toastr::error("Unable to update new Purchase");
            return back()->with('error', 'Unable to update new Purchase');;
        }
        
    }

    public function deletePurchaseFile(Request $request)
    {
        $purchase_id = $request->purchase;
        
        $purchase = Purchase::find($purchase_id);

        $status =  Storage::disk('public_upload')->delete('purchases/documents/'.$purchase->document);

        if($status)
            $purchase->update(['document' => null]);

        return ['status' => $status];
    }

    public function destroy($id)
    {
        Purchase::destroy($id);
        return back()->with('success', 'Purchase Deleted with success!');
    }

    public function genInvoice($id)
    {
        $purchases = Purchase::find($id);
        $purchasedetails = PurchaseDetails::where('purchase_id', $id)->get();
        $users = User::all();
        $suppliers = Supplier::find($purchases->supplier_id);

        return view('pages.backend.purchase.invoice', compact('purchases', 'users', 'suppliers','purchasedetails'));
    }


    public function genQuotation($id)
    {
        $purchases = Purchase::find($id);
        $purchasedetails = PurchaseDetails::where('purchase_id', $id)->get();
        $users = User::all();
        $suppliers = Supplier::find($purchases->supplier_id);

        return view('pages.backend.purchase.quotation', compact('purchases', 'users', 'suppliers','purchasedetails'));
    }


}