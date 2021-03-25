<!DOCTYPE html>
<html lang="en">
<head>
    @include('backend.layouts.head')
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            @include('backend.layouts.sidebar_menu')
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            @include('backend.layouts.top_nav')
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            @yield('main')
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Rentacs tours - Alphaboost
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>


@include('backend.layouts.footer')
</body>
</html>
