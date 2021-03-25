<nav class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-light navbar-hide-on-scroll navbar-border navbar-shadow navbar-brand-center">
    <div class="navbar-wrapper">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="fa fa-bars"></i></a></li>
                <li class="nav-item"><a class="navbar-brand" href="{{url('/')}}"><img class="brand-logo" alt="{{config('app.name')}}" src="{{asset('backend/app-assets/images/logo/logo.png')}}">
                        <h3 class="brand-text">{{config('app.name')}}</h3></a></li>
                <li class="nav-item d-md-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="la la-ellipsis-v"></i></a></li>
            </ul>
        </div>
        <div class="navbar-container content">
            <div class="collapse navbar-collapse" id="navbar-mobile">
                <ul class="nav navbar-nav mr-auto float-left">
                    <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="fa fa-bars"></i></a></li>
                    <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"><i class="fa fa-expand"></i></a></li>
                       <li class="nav-item nav-search"><a class="nav-link nav-link-search" href="#"><i class="fa fa-search"></i></a>
                         <div class="search-input">
                             <form id="backend_search">
                             <input class="input backend_search_key" type="text" placeholder="{{__('Enter Pnr or booking reference')}}">
                             </form>
                         </div>
                       </li>
                </ul>
                <ul class="nav navbar-nav float-right">
                     <div class="dropdown dropdown-user nav-item" >
                         <a href="#">
                            <img src="{{flagImageUrl(\Illuminate\Support\Facades\App::getLocale())}}">
                            @if(count($languages) > 1)
                            <i class="las la-angle-down la-12-black"></i>
                            @endif
                        </a>
                        @if(count($languages) > 1)
                        <ul>
                            @foreach($languages as $language)
                            @if(\Illuminate\Support\Facades\App::getLocale() !== $language->code)
                            <li><a href="{{route('change_language', $language->code)}}" title="{{$language->name}}"><img
                                        src="{{flagImageUrl($language->code)}}">{{$language->name}}</a></li>
                            @endif
                            @endforeach
                        </ul>
                        @endif
                        </div>
                        
                    <li class="dropdown nav-item">
                            <a class="dropdown-toggle nav-link" href="javascript:;" id="notf_user" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fa fa-bell"></i>
                              <span data-href="{{ route('user-notf-count') }}" id="user-notf-count">{{ App\Notification::countRegistration() }}</span>
                            </a>
                              <ul class="dropdown-menu" style="width:300px;">
                                <div class="dropdownmenu-wrapper" data-href="{{ route('user-notf-show') }}" id="user-notf-show">
                            </ul>
                        </li>
                        <li class="dropdown nav-item">
                            <a class="dropdown-toggle nav-link" href="javascript:;" id="notf_booking" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fa fa-bell"></i>
                              <span data-href="{{ route('booking-notf-count') }}" id="booking-notf-count">{{ App\Notification::countBooking() }}</span>
                            </a>
                              <ul class="dropdown-menu" style="width:300px;">
                                <div class="dropdownmenu-wrapper" data-href="{{ route('booking-notf-show') }}" id="booking-notf-show">
                                </ul>
                        </li>
                    
                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown"><span class="mr-1">{{__('Hello')}},<span class="user-name text-bold-700">{{\App\Profile::where('user_id',auth()->user()->id)->first()->first_name}}</span></span>
                            <span class="avatar avatar-online">
                                <img src="{{asset('backend/app-assets/images/logo/logo.png')}}" alt="avatar"><i></i>
                            </span></a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="{{route('profile')}}"><i class="fa fa-user"></i> {{__('Edit Profile')}}</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" href="{{url('/logout')}}"><i class="ft-power"></i> {{__('Logout')}}</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>