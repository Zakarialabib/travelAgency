<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="icon" type="image/png" href="{{asset('backend/app-assets/images/logo/logo.png')}}" />
    <title>{{setting('app_name')}}</title>
    <meta name="description" content="">
    <meta name="robots" content="all,follow">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
</head>
<body>
    <div class="container">
    <div class="toolbar hidden-print">
        <div class="text-right">
        <a  href="{{ url()->previous() }}" class="btn btn-info">
        <i class="fa fa-arrow-circle-o-left"></i>
        <span>Back</span>
    </a>            
    <button class="btn btn-info"  onclick="auto_print()">{{__('Print')}}</button>
        </div>
        <hr>
    </div>
            <div class="card-header">
                Invoice
                <strong>{{$sales->created_at->toDateString()}}</strong>
                <span class="float-right"> <strong>{{__('reference')}} :</strong>{{$sales->reference_no}}</span>

            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-sm-6">
                        <h6 class="mb-3">From:</h6>
                        <h3 class="name">
                            Rentacs Tours
                        </h3>
                        <div>13, Rue El Kassar, 1er Etage Maarif </div>
                        <div>20100 Casablanca, Maroc</div>
                        <div>{{__('Phone Number')}}: {{setting('home_phone')}}</div>
                        <div>{{__('Email')}}: {{setting('home_email')}}</div>
                    </div>

                    <div class="col-sm-6">
                        <h6 class="mb-3">To:</h6>
                        <h5 class="to"> {{$customers->name}}</h5>
                        <div class="address">{{$customers->company_name}}</div>
                        <div class="address"> {{$customers->address}}</div>
                        <div class="address"> {{$customers->city}}, {{$customers->postal_code}}</div>
                        <div class="email">{{__('Phone Number')}}: {{$customers->phone_number}}</div>
                    </div>
                </div>

                <div class="table-responsive-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="center">#</th>
                                <th>Item</th>
                                <th>Description</th>

                                <th class="right">Unit Cost</th>
                                <th class="center">Qty</th>
                                <th class="right">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php  $total_product_tax = 0; $i=1; ?>
                         @foreach($saledetails as $saledetail)
                            <tr>
                                <td class="center">0{{$i++}}</td>
                                <td class="left strong">{{$saledetail->name}}</td>
                                <td class="left">{{number_format((float) ($saledetail->total / $saledetail->qty), 2, '.', '')}}</td>

                                <td class="right">{{$saledetail->qty}}</td>
                                <td class="center">{{number_format((float)$sales->tax, 2, '.', '')}}</td>
                                <td class="right">{{number_format((float)$saledetail->total, 2, '.', '')}}</td>
                            </tr>
                         @endforeach         
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-5">

                    </div>

                    <div class="col-lg-4 col-sm-5 ml-auto">
                        <table class="table table-clear">
                            <tbody>
                                <tr>
                                    <td class="left">
                                        <strong>Subtotal</strong>
                                    </td>
                                    <td class="right">{{number_format((float)$sales->tax, 2, '.', '')}}</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong>Discount (20%)</strong>
                                    </td>
                                    <td class="right">{{number_format((float)$sales->tax, 2, '.', '')}}</td>
                                </tr>
 
                                <tr>
                                    <td class="left">
                                        <strong>Total TTC</strong>
                                    </td>
                                    <td class="right">
                                        <strong>{{number_format((float)$sales->grand_total, 2, '.', '')}}</strong>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
<script type="text/javascript">
    function auto_print() {     
        window.print()
    }
    setTimeout(auto_print, 1000);

</script>
</body>
</html>