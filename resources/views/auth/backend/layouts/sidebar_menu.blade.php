<div class="left_col scroll-view">
    <div class="navbar nav_title border-0">
        <a href="{{route('admin_dashboard')}}" class="site_title"><i class="admin_logo"></i><span>ADMIN</span></a>
    </div>
    <div class="clearfix"></div>
    <!-- sidebar menu -->
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
        <div class="menu_section">
            <ul class="nav side-menu">
                <li><a href="{{route('admin_dashboard')}}"><i class="fa fa-home"></i> {{__('Dashboard')}}</a></li>

                <li id="menu_place">
                    <a><i class="fa fa-map-marker"></i> {{__('Place')}} <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="{{route('admin_place_list')}}"><i class="fa fa-map-marker"></i> {{__('All Places')}}</a></li>
                        <li><a href="{{route('admin_place_type_list')}}"><i class="fa fa-tags"></i> {{__('Activity Type')}}</a></li>
                        <li><a href="{{route('admin_category_list', \App\Category::TYPE_PLACE)}}"><i class="fa fa-list"></i> {{__('Activity')}}</a></li>
                        <li><a href="{{route('admin_amenities_list')}}"><i class="fa fa-wifi"></i> {{__('Amenities')}}</a></li>
                        <li><a href="{{route('admin_city_list')}}"><i class="fa fa-building"></i> {{__('Cities')}}</a></li>
                        <li><a href="{{route('admin_country_list')}}"><i class="fa fa-globe"></i> {{__('Countries')}}</a></li>
                    </ul>
                </li>

                <li id="menu_blog">
                    <a><i class="fa fa-newspaper-o"></i> {{__('Blog')}} <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="{{route('post_list_blog')}}">{{__('All Posts')}}</a></li>
                        <li><a href="{{route('admin_category_list', \App\Category::TYPE_POST)}}">{{__('Categories')}}</a></li>
                    </ul>
                </li>
                <li id="menu_pages"><a href="{{route('page_list_page')}}"><i class="fa fa-clone"></i>{{__('Pages')}}</a></li>
                <li id="menu_pages"><a href="{{route('booking_list')}}"><i class="fa fa-calendar"></i> {{__('Bookings')}}</a></li>
                <li id="menu_pages"><a href="{{route('admin_sale_list')}}"><i class="fa fa-calendar"></i> {{__('Sales')}}</a></li>
                <li id="menu_pages"><a href="{{route('admin_purchase_list')}}"><i class="fa fa-calendar"></i> {{__('Purchase')}}</a></li>

                <li><a href="{{route('admin_review_list')}}"><i class="fa fa-star-half-o"></i> {{__('Reviews')}}</a></li>
                <li id="">
                    <a><i class="fa fa-users"></i> {{__('Account Management')}} <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                <li><a href="{{route('admin_user_list')}}"> {{__('Users')}}</a></li>
                <li><a href="{{route('admin_customer_list')}}"> {{__('Customers')}}</a></li>
                <li><a href="{{route('admin_supplier_list')}}"> {{__('Suppliers')}}</a></li>
                </ul>
                </li>
                <li><a href="{{route('admin_testimonial_list')}}"><i class="fa fa-users"></i> {{__('Testimonials')}}</a></li>

                <li>
                    <a><i class="fa fa-cog"></i> {{__('Settings')}} <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="{{route('admin_settings')}}"><i class="fa fa-cogs"></i> {{__('General Settings')}}</a></li>
                        <li><a href="{{route('admin_settings_language')}}"><i class="fa fa-language"></i> {{__('Languages')}}</a></li>
                        <li><a href="{{url('admincp/translations/view/_json')}}"><i class="fa fa-file-text-o"></i> {{__('Translations')}}</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
    <!-- /sidebar menu -->

</div>
