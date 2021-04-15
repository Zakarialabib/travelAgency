<!DOCTYPE html>
<html lang="en">
<head>
    <title>Responsive Bootstrap Invoice Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="icon" type="image/png" href="{{asset('backend/app-assets/images/logo/logo.png')}}" />
    <title>{{setting('app_name')}}</title>
    <meta name="description" content="">
    <meta name="robots" content="all,follow">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'><link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Override some Bootstrap CDN styles - normally you should apply these through your Bootstrap variables / sass -->
    <style>
        body { font-family: "Roboto", serif; font-size: 0.8rem; font-weight: 400; line-height: 1.4; color: #000000; }
        h1, h2, h4, h5 { font-weight: 700; color: #000000; }
        h1 { font-size: 2rem; }
        h2 { font-size: 1.6rem; }
        h4 { font-size: 1.2rem; }
        h5 { font-size: 1rem; }
        .table { color: #000; }
        .table td, .table th { border-top: 1px solid #000; }
        .table thead th { vertical-align: bottom; border-bottom: 2px solid #000; }

        @page {
            margin-top: 2.5cm;
            margin-bottom: 2.5cm;
        }

        @page :first {
            margin-top: 0;
            margin-bottom: 2.5cm;
        }
    </style>

</head>
<body>
<div style='height:20px;'></div>
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
<div class="container-fluid pt-2 pt-md-4 px-md-5">

    <!-- Invoice heading -->

    <table class="table table-borderless">
        <tbody>
        <tr>
            <td class="border-0">
                <div class="row">
                    <div class="col-md text-center text-md-left mb-3 mb-md-0">
                    <img src="{{asset('backend/app-assets/images/logo/logo.png')}}" width="120px" height="100px" style="margin:10px 0">
                        <br>
                        <h3 class="name">
                            Rentacs Tours
                        </h3>
                        <div>13, Rue El Kassar, 1er Etage Maarif </div>
                        <div>20100 Casablanca, Maroc</div>
                        <div>{{__('Phone Number')}}: {{setting('home_phone')}}</div>
                        <div>{{__('Email')}}: {{setting('home_email')}}</div>
                    </div>

                    <div class="col text-center text-md-right">

                        <!-- Dont' display Bill To on mobile -->
                        <span class="d-none d-md-block">
                            <h1>Billed To</h1>
                        </span>

                        <h4 class="to"> {{$customers->name}}</h4>
                        <div class="address">{{$customers->company_name}}</div>
                        <div class="address"> {{$customers->address}}</div>
                        <div class="address"> {{$customers->city}}, {{$customers->postal_code}}</div>
                        <div class="email">{{__('Phone Number')}}: {{$customers->phone_number}}</div>
                    
                        <div class="date">{{$sales->created_at->toDateString()}}</div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- Invoice items table -->

    <table class="table">
        <thead>
        <tr>
            <th>Summary</th>
            <th class="text-right">Price</th>
        </tr>
        </thead>
        <tbody>
        <?php  $total_product_tax = 0; $i=1; ?>
             @foreach($saledetails as $saledetail)
        <tr>
            <td>
                <h5 class="mb-1">{{$detail->name}}</h5>
                quantité: {{$saledetail->qty}}
            </td>
            <td class="font-weight-bold align-middle text-right text-nowrap">{{number_format((float)$saledetail->total, 2, '.', '')}}</td>
        </tr>
        @endforeach

       
        <tr>
            <td colspan="2" class="text-right border-0 pt-4"><h5>Total TTC: {{number_format((float)$sales->grand_total, 2, '.', '')}}</h5></td>
        </tr>
    </table>

    <!-- Thank you note -->

    <h5 class="text-center pt-2">
        Rentacs Tours
    </h5>

</div>
<script type="text/javascript">
    function auto_print() {     
        window.print()
    }
    setTimeout(auto_print, 1000);

</script>
</body>