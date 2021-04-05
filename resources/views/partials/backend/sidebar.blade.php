<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

            <li class="nav-item">
                <a href="{{url('/')}}">
                    <i class="la la-plane"></i>
                    <span class="menu-title" >{{__('Book Flight')}}</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{url('/')}}">
                    <i class="la la-hotel"></i>
                    <span class="menu-title" >{{__('Book Hotel')}}</span>
                </a>
            </li>

            <li class=" navigation-header">
                <span data-i18n="nav.category.layouts">{{__('Menu')}}</span>
                <i class="la la-ellipsis-h la la-minus" data-toggle="tooltip" data-placement="right" data-original-title="Layouts"></i>
            </li>

            <li class="@yield('activeDashboard') nav-item">
                <a href="{{url('/dashboard')}}">
                    <i class="la la-dashboard"></i>
                    <span class="menu-title" >{{__('Dashboard')}}</span>
                </a>
            </li>

            <li class="@yield('activeBookings') nav-item"><a href="#"><i class="la la-history"></i><span class="menu-title">{{__('Manage Bookings')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="#">Flight</a>
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
                        <a class="menu-item" href="#" >Hotel</a>
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

                    <li><a class="menu-item" href="#" >Packages</a>
                        <ul class="menu-content">
                            <li><a class="menu-item" href="{{url('/bookings/package/user')}}" >My Bookings</a>
                            </li>
                            @role('admin')
                            <li><a class="menu-item" href="{{route('booking_list')}}" >{{__('Booking list')}}</a>
                            </li>
                        {{--      <li><a class="menu-item" href="{{url('/bookings/package/agent')}}" >Agent</a>
                            </li>
                            <li><a class="menu-item" href="{{url('/bookings/package/customer')}}" >Customer</a>
                            </li>--}}

                            @endrole
                        </ul>
                    </li>
                </ul>
            </li>


            @role('admin')
            <li class="@yield('activePlace') nav-item"><a href="#"><i class="la la-users"></i><span class="menu-title" >{{__('Places')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('place_list')}}" >{{__('Place List')}}</a></li>
                    <li><a class="menu-item" href="{{route('place_type_list')}}">{{__('Activity Type')}}</a></li>
                    <li><a class="menu-item" href="{{route('category_list', \App\Category::TYPE_PLACE)}}">{{__('Activity List')}}</a></li>
                    <li><a class="menu-item" href="{{route('amenities_list')}}" >{{__('Amenities List')}}</a></li>
                    <li><a class="menu-item" href="{{route('city_list')}}" >{{__('Cities List')}}</a></li>
                    <li><a class="menu-item" href="{{route('country_list')}}" >{{__('Countries List')}}</a></li>
                </ul>
            </li>

            <li class="@yield('activePost') nav-item"><a href="#"><i class="la la-bank"></i><span class="menu-title" >{{__('Manage Pages')}} </span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('post_list_blog')}}">{{__('All Posts')}}</a></li>
                    <li><a class="menu-item" href="{{route('category_list', \App\Category::TYPE_POST)}}" >{{__('Categories List')}}</a></li>
                    <li><a class="menu-item" href="{{route('post_list_page')}}" >{{__('Pages')}}</a></li>
                </ul>
            </li>

            <li class="@yield('activeCommercial') nav-item"><a href="#"><i class="la la-home"></i><span class="menu-title" >{{__('Administration')}}</span></a>
                <ul class="menu-content">
           <li><a class="menu-item" href="#">{{__('Suppliers')}}</a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{route('supplier_create_view')}}">{{__('Create New')}}</a></li>
                    <li><a class="menu-item" href="{{route('supplier_list')}}" >{{__('Suppliers List')}}</a></li>
                </ul>
            </li>
           <li><a class="menu-item" href="#">{{__('Customers')}}</a>
                <ul class="menu-content">
                  <li><a class="menu-item" href="{{route('customer_create_view')}}">{{__('Create New')}}</a></li>
                  <li><a class="menu-item" href="{{route('customer_list')}}" >{{__('Customers List')}}</a></li>
               </ul>
           </li>
                  <li><a class="menu-item" href="#">{{__('Sales')}}</a>
                     <ul class="menu-content">
                       <li><a class="menu-item" href="{{route('sale_create_view')}}">{{__('Create New')}}</a></li>
                       <li><a class="menu-item" href="{{route('sale_list')}}" >{{__('Sale List')}}</a></li>
                     </ul>
                  </li>
                 <li><a class="menu-item" href="#">{{__('Purchase')}}</a>
                    <ul class="menu-content">
                      <li><a class="menu-item" href="{{route('purchase_create_view')}}">{{__('Create New')}}</a></li>
                      <li><a class="menu-item" href="{{route('purchase_list')}}" >{{__('Purchase List')}}</a></li>
                   </ul>
                </li>
                
             </ul>
           </li>
            @endrole
         
          {{--
            @role('admin')
            <li class="nav-item @yield('activeTransaction')"><a href="#"><i class="la la-money"></i><span class="menu-title" >{{__('Transactions')}}</span></a>
                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="{{url('/transactions/online-payment')}}" >{{__('Online')}}</a>
                    </li>
                    <li>
                        <a class="menu-item" href="{{url('/transactions/bank-payment')}}" >{{__('Offline(Bank)')}}</a>
                    </li>

                </ul>
            </li>
            @endrole

            <li class="nav-item @yield('activeTransaction')"><a href="#"><i class="la la-money"></i><span class="menu-title" >{{__('My Transactions')}}</span></a>
                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="{{url('/transactions/user/online-payment')}}" >{{__('Online')}}</a>
                    </li>
                    <li>
                        <a class="menu-item" href="{{url('/transactions/user/bank-payment')}}" >{{__('Offline(Bank)')}}</a>
                    </li>

                </ul>
            </li> --}}

           {{--  @role('admin')
            <li class="@yield('activeTravelPackage') nav-item"><a href="#"><i class="la la-suitcase"></i><span class="menu-title" >{{__('Manage Packages')}}</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="{{url('backend/travel-packages')}}" >{{__('Packages List')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('backend/travel-packages/create')}}" >{{__('Create New')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('backend/travel-packages/categories')}}" >{{__('Manage Categories')}}</a>
                    </li>
                </ul>
            </li>
            @endrole--}}

            {{--        <li class="@yield('activeMyWallet') nav-item">
                <a href="{{url('settings/wallets/user-wallet')}}">
                    <i class="la la-google-wallet"></i>
                    <span class="menu-title" >{{__('My Wallet')}}</span>
                </a>
            </li> --}}

    
            <li class="nav-item @yield('activeSettings')"><a href="#"><i class="la la-cogs"></i><span class="menu-title" >{{__('Settings')}}</span></a>
                <ul class="menu-content">
                    <li class="menu-item"><a href="{{route('profile')}}" >{{__('Manage Profile')}}</a>
                    </li>
                 @role('admin') 
                   </li>
                    <li><a class="menu-item" href="{{ route('clear-cache') }}"  >
                            {{__('Clear Cache')}}
                        </a>
                    </li>   
                    <li><a class="menu-item" href="{{route('settings')}}"> {{__('Home Settings')}}</a></li>
                    <li><a class="menu-item" href="{{url('settings/menu')}}" >{{__('Menu Settings')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/vats')}}" >{{__('Vats')}}</a>
                    </li>
                   {{--    <li><a class="menu-item" href="{{url('settings/markups')}}" >{{__('Markups')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/markdown')}}" >{{__('Markdowns')}}</a>
                    </li>
                  <li><a class="menu-item" href="{{route('banks')}}" >{{__('Banks')}}</a>
                    </li>--}}
                    <li><a class="menu-item" href="{{url('settings/users')}}" >{{__('Users Management')}}</a>
                    </li>
                    <li><a class="menu-item" href="{{url('settings/subscribers')}}" >{{__('Email Subscribers')}}</a>
                    </li>
                    {{--   <li><a class="menu-item" href="{{url('/settings/visa-application-requests')}}" >{{__('Visa Applications')}}</a>
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
                <a href="{{url('/logout')}}">
                    <i class="la la-sign-out"></i>
                    <span class="menu-title" >{{__('Log Out')}}</span>
                </a>
            </li>

        </ul>
    </div>
</div>