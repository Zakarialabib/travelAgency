<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Invoice;

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

    public function preview($type, $id, $template) {

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
