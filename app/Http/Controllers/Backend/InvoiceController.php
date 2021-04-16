<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Invoice;
use App\Purchase;
use App\Returns;
use App\Sale;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\Mail;

class InvoiceController extends Controller
{
    public function create($type, $id)
    {
        $templates = [
            new InvoiceTemplate(1, 'Template 1', 'https://templates.invoicehome.com/invoice-template-us-neat-750px.png', 'invoice-1'),
            new InvoiceTemplate(2, 'Template 2', 'https://trulysmall.com/wp-content/uploads/2020/12/green-invoice-template.png', 'invoice-2'),
            new InvoiceTemplate(3, 'Template 3', 'https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png', 'invoice-3'),
            new InvoiceTemplate(4, 'Template 4', 'https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png', 'invoice-4'),
        ];
        return view('pages.backend.invoice.models', compact('type', 'id', 'templates'));
    }

    public function sendEmail(Request $request, $id)
    {
        $data = $request->validate([
            'recepient' => 'required',
            'subject' =>'required',
            'msg' => 'required',
            'template_id' => '',
            'type' => '',
        ]);

        switch ($data['type']) {
            case Invoice::SALE_TYPE :
                $entity = Sale::find($id);
                $beneficiary = $entity->customer;
                break;
            case Invoice::PURCHASE_TYPE:
                $entity = Purchase::find($id);
                $beneficiary = $entity->supplier;
                break;

            case Invoice::RETURN_TYPE:
                $entity = Returns::find($id);
                $beneficiary = $entity->customer;
                break;
            
            default:
                $entity = Sale::find($id);
                $beneficiary = $entity->customer;
                break;
        }

        $pdf = PDF::loadView('pages.backend.invoice.invoice-' . $data['template_id'], [
            'entity' => $entity,
            'beneficiary' => $beneficiary,
            'type' => $data['type'],
        ]);

        Mail::send('pages.backend.invoice.invoice-' . $data['template_id'], [
            'entity' => $entity,
            'beneficiary' => $beneficiary,
            'type' => $data['type'],
        ] , function($message) use($data, $pdf) {
            $message->to($data['recepient'], 'rentacs Tours')
                    ->subject($data["subject"])
                    ->attachData($pdf->output(), "rapport.pdf");
        });

        return back();
    }

    public function action($action, $type, $id, $template) {
        switch ($type) {
            case Invoice::SALE_TYPE :
                $entity = Sale::find($id);
                $beneficiary = $entity->customer;
                break;

            case Invoice::PURCHASE_TYPE:
                $entity = Purchase::find($id);
                $beneficiary = $entity->supplier;
                break;

            case Invoice::RETURN_TYPE:
                $entity = Returns::find($id);
                $beneficiary = $entity->customer;
                break;
            
            default:
                $entity = Sale::find($id);
                $beneficiary = $entity->customer;
                break;
        }

        switch ($action) {
            case Invoice::PREVIEW_ACTION:
                return view('pages.backend.invoice.invoice-' . $template, compact('entity', 'beneficiary', 'type'));
            
            case Invoice::DOWNLOAD_ACTION:
                $pdf = PDF::loadView('pages.backend.invoice.invoice-' . $template, [
                    'entity' => $entity,
                    'beneficiary' => $beneficiary,
                    'type' => $type,
                ]);
                return $pdf->download('facture.pdf');
            
            default:
                return view('pages.backend.invoice.invoice-' . $template, compact('entity', 'beneficiary', 'type'));
                break;
        }

    }
}

class InvoiceTemplate {

    public $id;
    public $name;
    public $image;
    public $file;

    function __construct($id, $name, $image, $file)
    {
        $this->id = $id;
        $this->name = $name;
        $this->image = $image;
        $this->file = $file;
    }
}
