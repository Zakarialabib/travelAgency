<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

            <li class="nav-item">
                <a href="{{url('/')}}">
                    <i class="la la-plane"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('Book Flight')}}</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{url('/')}}">
                    <i class="la la-hotel"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('Book Hotel')}}</span>
                </a>
            </li>

            <li class=" navigation-header">
                <span data-i18n="nav.category.layouts">{{__('Menu')}}</span>
                <i class="la la-ellipsis-h la la-minus" data-toggle="tooltip" data-placement="right" data-original-title="Layouts"></i>
            </li>

            <li class="@yield('activeDashboard') nav-item">
                <a href="{{url('/dashboard')}}">
                    <i class="la la-dashboard"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('Dashboard')}}</span>
                </a>
            </li>

            <li class="@yield('activeBookings') nav-item"><a href="#"><i class="la la-history"></i><span class="menu-title" data-i18n="nav.templates.main">{{__('Manage Bookings')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="#" data-i18n="nav.templates.vert.main">Flight</a>
                        <ul class="menu-content">
                            <li><a class="menu-item" href="{{url('/bookings/flight/user')}}">My Bookings</a>
                            </li>
                            @role('admin')
                            <li><a class="menu-item" href="{{url('/bookings/flight/agent')}}">Agent</a>
                            </li>
                            <li><a class="menu-item" href="{{url('/bookings/flight/customer')}}">Customer</a>
                            </li>
                            @endrole
                        </ul>
                    </li>

                    <li>
                        <a class="menu-item" href="#" data-i18n="nav.templates.horz.main">Hotel</a>
                        <ul class="menu-content">
                            <li><a class="menu-item" href="{{url('/bookings/hotel/user')}}">My Bookings</a>
                            </li>
                            @role('admin')
                            <li><a class="menu-item" href="{{url('/bookings/hotel/agent')}}">Agent</a>
                            </li>
                            <li><a class="menu-item" href="{{url('/bookings/hotel/customer')}}">Customer</a>
                            </li>
                            @endrole
                        </ul>
                    </li>

                    <li><a class="menu-item" href="#" data-i18n="nav.templates.horz.main">Packages</a>
                        <ul class="menu-content">
                            <li><a class="menu-item" href="{{url('/bookings/package/user')}}" data-i18n="nav.templates.horz.classic">My Bookings</a>
                            </li>
                            @role('admin')
                            <li><a class="menu-item" href="{{route('booking_list')}}" data-i18n="nav.templates.horz.top_icon">{{__('Booking list')}}</a>
                            </li>
                        {{--      <li><a class="menu-item" href="{{url('/bookings/package/agent')}}" data-i18n="nav.templates.horz.top_icon">Agent</a>
                            </li>
                            <li><a class="menu-item" href="{{url('/bookings/package/customer')}}" data-i18n="nav.templates.horz.top_icon">Customer</a>
                            </li>--}}

                            @endrole
                        </ul>
                    </li>
                </ul>
            </li>


            @role('admin')
            <li class="@yield('activePlace') nav-item"><a href="#"><i class="la la-users"></i><span class="menu-title" data-i18n="nav.templates.main">{{__('Places')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('place_list')}}" data-i18n="nav.templates.horz.main">{{__('Place List')}}</a></li>
                    <li><a class="menu-item" href="{{route('place_type_list')}}" data-i18n="nav.templates.vert.main">{{__('Activity Type')}}</a></li>
                    <li><a class="menu-item" href="{{route('category_list', \App\Category::TYPE_PLACE)}}" data-i18n="nav.templates.vert.main">{{__('Activity List')}}</a></li>
                    <li><a class="menu-item" href="{{route('amenities_list')}}" data-i18n="nav.templates.horz.main">{{__('Amenities List')}}</a></li>
                    <li><a class="menu-item" href="{{route('city_list')}}" data-i18n="nav.templates.horz.main">{{__('Cities List')}}</a></li>
                    <li><a class="menu-item" href="{{route('country_list')}}" data-i18n="nav.templates.horz.main">{{__('Countries List')}}</a></li>
                </ul>
            </li>

            <li class="@yield('activePost') nav-item"><a href="#"><i class="la la-bank"></i><span class="menu-title" data-i18n="nav.templates.main">{{__('Manage Pages')}} </span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('post_list_blog')}}" data-i18n="nav.templates.vert.main">{{__('All Posts')}}</a></li>
                    <li><a class="menu-item" href="{{route('category_list', \App\Category::TYPE_POST)}}" data-i18n="nav.templates.horz.main">{{__('Categories List')}}</a></li>
                    <li><a class="menu-item" href="{{route('post_list_page')}}" data-i18n="nav.templates.horz.main">{{__('Pages')}}</a></li>
                </ul>
            </li>

            <li class="@yield('activeCommercial') nav-item"><a href="#"><i class="la la-home"></i><span class="menu-title" data-i18n="nav.templates.main">{{__('Administration')}}</span></a>
                <ul class="menu-content">
           <li><a class="menu-item" href="#" data-i18n="nav.templates.vert.main">{{__('Suppliers')}}</a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('supplier_create_view')}}" data-i18n="nav.templates.vert.main">{{__('Create New')}}</a></li>
                    <li><a class="menu-item" href="{{route('supplier_list')}}" data-i18n="nav.templates.horz.main">{{__('Suppliers List')}}</a></li>
                </ul>
            </li>
           <li><a class="menu-item" href="#" data-i18n="nav.templates.vert.main">{{__('Customers')}}</a>
                <ul class="menu-content">
                  <li><a class="menu-item" href="{{route('customer_create_view')}}" data-i18n="nav.templates.vert.main">{{__('Create New')}}</a></li>
                  <li><a class="menu-item" href="{{route('customer_list')}}" data-i18n="nav.templates.horz.main">{{__('Customers List')}}</a></li>
               </ul>
           </li>
                  <li><a class="menu-item" href="#" data-i18n="nav.templates.vert.main">{{__('Sales')}}</a>
                     <ul class="menu-content">
                       <li><a class="menu-item" href="{{route('sale_create_view')}}" data-i18n="nav.templates.vert.main">{{__('Create New')}}</a></li>
                       <li><a class="menu-item" href="{{route('sale_list')}}" data-i18n="nav.templates.horz.main">{{__('Sale List')}}</a></li>
                     </ul>
                  </li>
                 <li><a class="menu-item" href="#" data-i18n="nav.templates.vert.main">{{__('Purchase')}}</a>
                    <ul class="menu-content">
                      <li><a class="menu-item" href="{{route('purchase_create_view')}}" data-i18n="nav.templates.vert.main">{{__('Create New')}}</a></li>
                      <li><a class="menu-item" href="{{route('purchase_list')}}" data-i18n="nav.templates.horz.main">{{__('Purchase List')}}</a></li>
                   </ul>
                </li>
                
             </ul>
           </li>
            @endrole
         
          {{--
            @role('admin')
            <li class="nav-item @yield('activeTransaction')"><a href="#"><i class="la la-money"></i><span class="menu-title" data-i18n="nav.navbars.main">{{__('Transactions')}}</span></a>
                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="{{url('/transactions/online-payment')}}" data-i18n="nav.navbars.nav_dark">{{__('Online')}}</a>
                    </li>
                    <li>
                        <a class="menu-item" href="{{url('/transactions/bank-payment')}}" data-i18n="nav.navbars.nav_semi">{{__('Offline(Bank)')}}</a>
                    </li>

                </ul>
            </li>
            @endrole

            <li class="nav-item @yield('activeTransaction')"><a href="#"><i class="la la-money"></i><span class="menu-title" data-i18n="nav.navbars.main">{{__('My Transactions')}}</span></a>
                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="{{url('/transactions/user/online-payment')}}" data-i18n="nav.navbars.nav_dark">{{__('Online')}}</a>
                    </li>
                    <li>
                        <a class="menu-item" href="{{url('/transactions/user/bank-payment')}}" data-i18n="nav.navbars.nav_semi">{{__('Offline(Bank)')}}</a>
                    </li>

                </ul>
            </li> --}}

           {{--  @role('admin')
            <li class="@yield('activeTravelPackage') nav-item"><a href="#"><i class="la la-suitcase"></i><span class="menu-title" data-i18n="nav.vertical_nav.main">{{__('Manage Packages')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{url('backend/travel-packages')}}" data-i18n="nav.vertical_nav.vertical_nav_fixed">{{__('Packages List')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('backend/travel-packages/create')}}" data-i18n="nav.vertical_nav.vertical_nav_fixed">{{__('Create New')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('backend/travel-packages/categories')}}" data-i18n="nav.vertical_nav.vertical_nav_fixed">{{__('Manage Categories')}}</a>
                    </li>
                </ul>
            </li>
            @endrole--}}

            {{--        <li class="@yield('activeMyWallet') nav-item">
                <a href="{{url('settings/wallets/user-wallet')}}">
                    <i class="la la-google-wallet"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('My Wallet')}}</span>
                </a>
            </li> --}}

          

         
            <li class="nav-item @yield('activeSettings')"><a href="#"><i class="la la-cogs"></i><span class="menu-title" data-i18n="nav.page_layouts.main">{{__('Settings')}}</span></a>
              
                <ul class="menu-content">
                    <li class="menu-item"><a href="{{route('profile')}}" data-i18n="nav.page_layouts.1_columns">{{__('Manage Profile')}}</a>
                    </li>
                   @role('admin')    
                    <li><a href="{{route('settings')}}"> {{__('Home Settings')}}</a></li>
                    <li><a class="menu-item" href="{{url('settings/menu')}}" data-i18n="nav.page_layouts.1_column">{{__('Menu Settings')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/vats')}}" data-i18n="nav.page_layouts.1_column">{{__('Vats')}}</a>
                    </li>
                   {{--    <li><a class="menu-item" href="{{url('settings/markups')}}" data-i18n="nav.page_layouts.2_columns">{{__('Markups')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/markdown')}}" data-i18n="nav.page_layouts.2_columns">{{__('Markdowns')}}</a>
                    </li>
                  <li><a class="menu-item" href="{{route('banks')}}" data-i18n="nav.page_layouts.2_columns">{{__('Banks')}}</a>
                    </li>--}}
                    <li><a class="menu-item" href="{{url('settings/users')}}" data-i18n="nav.page_layouts.2_columns">{{__('Users Management')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/subscribers')}}" data-i18n="nav.page_layouts.2_columns">{{__('Email Subscribers')}}</a>
                    </li>
                    {{--   <li><a class="menu-item" href="{{url('/settings/visa-application-requests')}}" data-i18n="nav.page_layouts.2_columns">{{__('Visa Applications')}}</a>
                    </li> --}}
                    <li><a href="{{url('settings/language')}}"> {{__('Language')}}</a></li>
                    <li ><a href="{{ route('clear-translations') }}">{{__('Clear translations')}}</a></li>
                   {{--   <li><a href="{{url('translations')}}"> {{__('Translations')}}</a></li>
                   <li><a href="{{url('settings/wallets')}}" class="menu-item">{{__('Wallets Management')}}</a></li>
                    </li> --}}
                  @endrole
                </ul>
            </li>
      <li class="nav-item">
                <a href="{{ route('clear-cache') }}">
                    <i class="la la-sign-out"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('Clear Cache')}}</span>
                </a>
            </li>
               
            <li class="nav-item">
                <a href="{{url('/logout')}}">
                    <i class="la la-sign-out"></i>
                    <span class="menu-title" data-i18n="nav.dash.main">{{__('Log Out')}}</span>
                </a>
            </li>

        </ul>
    </div>
</div>