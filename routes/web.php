<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});

Route::get('clear-translations', 'ClearCacheController@clear_translations')
      ->name('clear-translations');
Route::get('clear-cache', 'ClearCacheController@clear_cache')
      ->name('clear-cache');
      
  // User Notification
  Route::get('/user/notf/show', 'NotificationController@user_notf_show')->name('user-notf-show');
  Route::get('/user/notf/count','NotificationController@user_notf_count')->name('user-notf-count');
  Route::get('/user/notf/clear','NotificationController@user_notf_clear')->name('user-notf-clear');
  // User Notification Ends

  // booking Notification
  Route::get('/booking/notf/show', 'NotificationController@booking_notf_show')->name('booking-notf-show');
  Route::get('/booking/notf/count','NotificationController@booking_notf_count')->name('booking-notf-count');
  Route::get('/booking/notf/clear','NotificationController@booking_notf_clear')->name('booking-notf-clear');
  // booking Notification Ends


Route::get('typeaheadJs', 'AirportController@typeAhead')->name('typeaheadJs');
Route::get('airlineTypeAheadJs', 'AirlineController@typeAhead')->name('airlineTypeAheadJs');

Route::post('/one-way-flight-search','FlightController@oneWayFlightSearch');
Route::post('/round-trip-flight-search','FlightController@roundTripFlightSearch');
Route::post('/multi-destination-flight-search','FlightController@multiDestinationFlightSearch');
Route::get('/selected-itinerary-info/{id}','FlightController@selectedItineraryInfo');
Route::get('/get-flight-information-and-pricing/{id}','FlightController@getItineraryInformationAndPricing');
Route::post('/book-itinerary','FlightController@bookItinerary');
Route::post('/bank-payment','BankPaymentController@itineraryBankPayment');
Route::post('/hotel-bank-payment','BankPaymentController@hotelBankPayment');
Route::post('/flight-wallet-payment','WalletController@itineraryWalletPayment');
Route::post('/hotel-wallet-payment','WalletController@hotelWalletPayment');


Route::get('/logout','Auth\LoginController@logout');


Route::get('/cancel-pnr/{pnr}','FlightController@cancelPNR');
Route::get('/issue-ticket/{pnr}','FlightController@issueTicket');
Route::get('/void-ticket/{pnr}','FlightController@voidTicket');



Route::get('/get-logged-in-user',function(){
    return App\User::findOrFail(auth()->user()->id)
        ->join('profiles','profiles.user_id','=','users.id')
        ->join('role_user','role_user.user_id','=','users.id')
        ->first();
});




Route::group([
              'namespace' => 'Frontend', 
              'middleware' => []], function(){
                  
                Route::get('/', 'ViewController@home');

                Route::get('/home', 'ViewController@home')->name('home');
                
                Route::get('/language/{locale}', 'ViewController@changeLanguage')->name('change_language');
                Route::post('/custom-sign-in','UserController@signIn');
Route::post('/custom-sign-up','UserController@signUp');

                Route::get('/itinerary-booking','ViewController@itineraryBooking')->middleware('flight.search.param','flight.selected','flight.pricing.info');
                
                Route::get('/available-itineraries','ViewController@availableItineraries')->middleware('flight');
                Route::get('/flight-booking-payment-page','ViewController@flightBookingPayment')->middleware('flight.search.param','flight.selected','flight.pricing.info','pnr');
                Route::get('/flight-booking-confirmation','ViewController@flightPaymentConfirmation')->middleware('flight.search.param','flight.selected','flight.pricing.info','payment.info');
                
                Route::get('/available-hotels','ViewController@availableHotels')->middleware('hotel','hotel.search.param');
                
                Route::get('/hotel-information','ViewController@hotelInformation')->middleware('hotel.information');
                
                Route::get('/hotel-room-booking/{id}','ViewController@hotelRoomBooking')->middleware('hotel.search.param');
                
        
Route::get('/search', 'ViewController@search')->name('search');
Route::get('/termes-et-conditions', 'ViewController@termsConditions')->name('page_terms_conditions');
Route::get('/contact', 'ViewController@pageContact')->name('page_contact');
Route::get('/about', 'ViewController@pageAbout')->name('page_about');
Route::post('/about', 'ViewController@sendAbout')->name('page_about_send');
Route::post('/contact', 'ViewController@sendContact')->name('page_contact_send');
Route::get('/ajax-search', 'ViewController@ajaxSearch');
Route::get('/ajax-search-listing', 'ViewController@searchListing');
Route::get('/search', 'ViewController@search')->name('search');

Route::post('/searchHotel','HotelController@searchHotel');
Route::get('/get-selected-hotel-information/{id}','HotelController@getSelectedHotelInformation');
Route::get('/get-selected-hotel-rooms-information/{id}','HotelController@getSelectHotelRoomsInformation');
Route::get('/get-selected-hotel-room-information/{id}','HotelController@getSelectedHotelRoomInformation');
Route::get('/selected-hotel-information','HotelController@selectedHotel');
Route::get('/hotel-room-information/{id}','HotelController@hotelRoomInformation');
Route::post('/hold-customer-hotel-booking-information','HotelController@holdCustomerHotelBookingInfo');
Route::get('/hotel-booking-confirmation','HotelController@hotelPaymentConfirmation');

Route::get('/page/landing/{page_number}', 'ViewController@pageLanding')->name('page_landing');
Route::get('/search-listing-input', 'ViewController@searchListing')->name('search_listing');
Route::get('/search-listing', 'ViewController@pageSearchListing')->name('page_search_listing');
Route::get('/hotel-booking-payment-page','ViewController@hotelBookingPaymentPage')->middleware('hotel.search.param','hotel.room.selected');
Route::get('/hotel-booking-completion','ViewCOntroller@hotelBookingCompletion')->middleware('hotel.search.param','hotel.room.selected','payment.info');
Route::post('/wishlist', 'UserController@addWishlist')->name('add_wishlist')->middleware('auth');
Route::delete('/wishlist', 'UserController@removeWishlist')->name('remove_wishlist')->middleware('auth');
Route::get('/user/profile', 'UserController@pageProfile')->name('user_profile')->middleware('auth');
Route::put('/user/profile', 'UserController@updateProfile')->name('user_profile_update')->middleware('auth');    

        Route::get('/Meilleures-offres', 'PlaceController@list')->name('best_offers');
        Route::get('/offres/{slug}', 'PlaceController@detail')->name('place_detail');
        Route::get('/offres/filter', 'PlaceController@getListFilter')->name('place_get_list_filter');
        Route::get('/new-place', 'PlaceController@pageAddNew')->name('place_addnew');
        Route::get('/edit-place/{id}', 'PlaceController@pageAddNew')->name('place_edit')->middleware('auth');
        Route::post('/place', 'PlaceController@create')->name('place_create')->middleware('auth');
        Route::put('/place', 'PlaceController@update')->name('place_update')->middleware('auth');
        
        Route::get('/blog/all', 'PostController@list')->name('post_list_all');
        Route::post('/post', 'PostController@send')->name('send');
        Route::get('/blog/{cat_slug}', 'PostController@list')->where('cat_slug', '[a-zA-Z0-9-_]+')->name('post_list');
         Route::get('{slug}-{id}', 'PostController@detail')
        ->where('slug', '[a-zA-Z0-9-_]+')
        ->where('id', '[0-9]+')->name('post_detail');
        Route::get('/city/{slug}', 'CityController@detail')->name('city_detail');
        Route::get('/city/{slug}/{cat_slug}', 'CityController@detail')->name('city_category_detail');
    
        Route::get('/categorie', 'CategoryController@listPlace')->name('category_list');
        Route::get('/categorie/{slug}', 'CategoryController@detail')->name('category_detail');
        Route::get('/categorie/type/{slug}', 'CategoryController@typeDetail')->name('category_type_detail');
        Route::get('/categories', 'CategoryController@search')->name('category_search');
        Route::post('/review', 'ReviewController@create')->name('review_create')->middleware('auth');
        
    Route::get('/user/my-place', 'UserController@pageMyPlace')->name('user_my_place')->middleware('auth');
    Route::delete('/user/my-place', 'UserController@deleteMyPlace')->name('user_my_place_delete')->middleware('auth');

    Route::get('/user/wishlist', 'UserController@pageWishList')->name('user_wishlist')->middleware('auth');

    Route::get('/cart', 'BookingController@cart')->middleware('auth');
    Route::get('/add-to-cart/{id}', 'BookingController@addToCart')->name('add-to-cart')->middleware('auth');
    Route::put('/update-cart', 'BookingController@update')->middleware('auth');
    Route::delete('/remove-from-cart', 'BookingController@remove')->name('remove-from-cart')->middleware('auth');

    Route::post('/bookings', 'BookingController@booking')->name('booking_submit');
  
      Route::get('/places/map', 'PlaceController@getListMap')->name('place_get_list_map');

    Route::get('/cities/{country_id}', 'CityController@getListByCountry')->name('city_get_list');
    Route::get('/cities', 'CityController@search')->name('city_search');

});
Route::group([
    'namespace' => 'Backend', 
    'middleware' => ['auth']], function(){
        
        Route::get('/country', 'CountryController@list')->name('country_list');
        Route::post('/country', 'CountryController@create')->name('country_create');
        Route::put('/country', 'CountryController@update')->name('country_update');
        Route::delete('/country/{id}', 'CountryController@destroy')->name('country_delete');
    
        Route::get('/city', 'CityController@list')->name('city_list');
        Route::post('/city', 'CityController@create')->name('city_create');
        Route::put('/city', 'CityController@update')->name('city_update');
        Route::put('/city/status', 'CityController@updateStatus')->name('city_update_status');
        Route::delete('/city/{id}', 'CityController@destroy')->name('city_delete');
    

        Route::group(['prefix' => 'customers'],function(){

        Route::get('/', 'CustomerController@list')->name('customer_list');
        Route::get('/add', 'CustomerController@create')->name('customer_create_view');
        Route::post('/', 'CustomerController@store')->name('customer_create');
        Route::get('/edit/{id}', 'CustomerController@edit')->name('customer_edit');
        Route::put('/update/{id}', 'CustomerController@update')->name('customer_update');
        Route::delete('/{id}', 'CustomerController@destroy')->name('customer_delete');
    
        });

        Route::group(['prefix' => 'suppliers'],function(){

        Route::get('/', 'SupplierController@list')->name('supplier_list');
        Route::get('/add', 'SupplierController@create')->name('supplier_create_view');
        Route::post('/', 'SupplierController@store')->name('supplier_create');
        Route::get('/edit/{id}', 'SupplierController@edit')->name('supplier_edit');
        Route::put('/update/{id}', 'SupplierController@update')->name('supplier_update');
        Route::delete('/{id}', 'SupplierController@destroy')->name('supplier_delete');
      });
              

        Route::get('/category/{type}', 'CategoryController@list')->name('category_list');
        Route::post('/category', 'CategoryController@create')->name('category_create');
        Route::put('/category', 'CategoryController@update')->name('category_update');
        Route::delete('/category/{id}', 'CategoryController@destroy')->name('category_delete');
    
        Route::get('/amenities', 'AmenitiesController@list')->name('amenities_list');
        Route::post('/amenities', 'AmenitiesController@create')->name('amenities_create');
        Route::put('/amenities', 'AmenitiesController@update')->name('amenities_update');
        Route::delete('/amenities/{id}', 'AmenitiesController@destroy')->name('amenities_delete');
    
        Route::get('/places-type', 'PlaceTypeController@list')->name('place_type_list');
        Route::post('/place-type', 'PlaceTypeController@create')->name('place_type_create');
        Route::put('/place-type', 'PlaceTypeController@update')->name('place_type_update');
        Route::delete('/place-type/{id}', 'PlaceTypeController@destroy')->name('place_type_delete');
       
        Route::resource('/place', 'PlaceController');
        Route::get('/place', 'PlaceController@list')->name('place_list');
        Route::get('/places/create', 'PlaceController@create')->name('place_create');
        Route::post('/place/store', 'PlaceController@store')->name('place_store');
        Route::get('/place/edit/{id}', 'PlaceController@edit')->name('place_edit');
        Route::put('/place/update', 'PlaceController@update')->name('place_update');
        Route::delete('/place/{id}', 'PlaceController@destroy')->name('place_delete');
    
        Route::get('/blog', 'PostController@list')->name('post_list_blog');
        Route::get('/pages', 'PostController@list')->name('post_list_page');
    
        Route::get('/posts/add/{type}', 'PostController@pageCreate')->name('post_add');
        Route::get('/posts/{id}', 'PostController@pageCreate')->name('post_edit');
        Route::post('/posts', 'PostController@create')->name('post_create');
        Route::put('/posts', 'PostController@update')->name('post_update');
        Route::delete('/posts/{id}', 'PostController@destroy')->name('post_delete');
        
        Route::get('/review', 'ReviewController@list')->name('review_list');
        Route::delete('/review', 'ReviewController@destroy')->name('review_delete');

        Route::get('/bookings', 'BookingController@list')->name('booking_list');
        Route::get('/bookings/add', 'BookingController@create')->name('booking_create');
        Route::post('/booking/store', 'BookingController@store')->name('booking_store');
        Route::get('/bookings/edit/{id}', 'BookingController@edit')->name('booking_edit');
        Route::put('/booking/update', 'BookingController@update')->name('booking_update');
        Route::put('/bookings', 'BookingController@updateStatus')->name('booking_update_status');
        Route::delete('/bookings/{id}', 'BookingController@destroy')->name('booking_delete');
      
        Route::get('/testimonials', 'TestimonialController@list')->name('testimonial_list');
        Route::get('/testimonials/add', 'TestimonialController@pageCreate')->name('testimonial_page_add');
        Route::get('/testimonials/edit/{id}', 'TestimonialController@pageCreate')->name('testimonial_page_edit');
        Route::post('/testimonials', 'TestimonialController@create')->name('testimonial_action');
        Route::put('/testimonials', 'TestimonialController@update')->name('testimonial_action');
   
        Route::get('/settings', 'SettingController@index')->name('settings');
        Route::post('/settings', 'SettingController@store')->name('setting_create');
    
        Route::get('/settings/language', 'SettingController@pageLanguage')->name('settings_language');
        Route::get('/settings/translation', 'SettingController@pageTranslation')->name('settings_translation');

    });

Route::middleware(['auth'])->group(function(){

    Route::get('/ajax-search-places', 'BackEndViewController@searchPlaces');
    
    Route::post('/search-portal','BackEndViewController@searchPortal');

    Route::get('backend/payment-confirmation','BackEndViewController@paymentConfirmation');

    Route::get('/dashboard','BackEndViewController@dashboard')->name('dashboard');    

Route::group(['prefix' => 'purchases'],function(){

    Route::get('/', 'PurchaseController@list')->name('purchase_list');
    Route::get('/ajax-delete-file', 'PurchaseController@deletePurchaseFile');
    Route::get('/add', 'PurchaseController@createView')->name('purchase_create_view');
    Route::post('/', 'PurchaseController@create')->name('purchase_create');
    Route::get('/edit/{id}', 'PurchaseController@edit')->name('purchase_edit');
    Route::put('/update/{id}', 'PurchaseController@update')->name('purchase_update');
    Route::delete('/{id}', 'PurchaseController@destroy')->name('purchase_delete');
    Route::get('template/{id}', 'PurchaseController@genInvoice')->name('purchase_invoice');
    Route::get('invoice/template1/{id}', 'PurchaseController@Invoice')->name('invoice_sale1');
    Route::get('invoice/template2/{id}', 'PurchaseController@Invoiceun')->name('invoice_sale2');
    Route::get('invoice/template3/{id}', 'PurchaseController@Invoicedeux')->name('invoice_sale3');


    Route::get('gen_quotation/{id}', 'PurchaseController@genQuotation')->name('purchase_quotation');
    Route::get('/status', 'PurchaseController@updateStatus');

});

Route::group(['prefix' => 'sales'],function(){

    Route::get('/', 'SaleController@list')->name('sale_list');
    Route::get('/ajax-delete-file', 'SaleController@deleteSaleFile');
    Route::get('/add', 'SaleController@createView')->name('sale_create_view');
    Route::post('/add', 'SaleController@createView')->name('sale_create_view');
    Route::post('/', 'SaleController@create')->name('sale_create');
    Route::get('/edit/{id}', 'SaleController@edit')->name('sale_edit');
    Route::put('/update/{id}', 'SaleController@update')->name('sale_update');
    Route::delete('/{id}', 'SaleController@destroy')->name('sale_delete');
	Route::get('gen_invoice/{id}', 'SaleController@genInvoice')->name('sale_invoice');
    Route::get('gen_devis/{id}', 'SaleController@genQuotation')->name('sale_quotation');
    Route::get('/status', 'SaleController@updateStatus');
    Route::get('template/{id}', 'SaleController@genInvoice')->name('purchase_invoice');
    Route::get('invoice/template1/{id}', 'SaleController@Invoice')->name('invoice_sale1');
    Route::get('invoice/template2/{id}', 'SaleController@Invoiceun')->name('invoice_sale2');
    Route::get('invoice/template3/{id}', 'SaleController@Invoicedeux')->name('invoice_sale3');
    Route::get('download/{id}', 'SaleController@printToPDF')->name('download_pdf');
    Route::get('download2/{id}', 'SaleController@printToPDF2')->name('download_pdf2');
    Route::get('download3/{id}', 'SaleController@printToPDF3')->name('download_pdf3');
    Route::get('download4/{id}', 'SaleController@printToPDF4')->name('download_pdf4');
    Route::post('/send-invoice/sendmail/{id}', 'SaleController@invoiceSend')->name('invoice_send_mail'); 
    });
    

    Route::group(['prefix' => 'return'],function(){

        Route::get('/', 'ReturnController@list')->name('return_list');
        Route::get('/ajax-delete-file', 'ReturnController@deleteSaleFile');
        Route::get('/add', 'ReturnController@createView')->name('return_create_view');
        Route::post('/add', 'ReturnController@createView')->name('return_create_view');
        Route::post('/', 'ReturnController@create')->name('return_create');
        Route::get('/edit/{id}', 'ReturnController@edit')->name('return_edit');
        Route::put('/update/{id}', 'ReturnController@update')->name('return_update');
        Route::delete('/{id}', 'ReturnController@destroy')->name('return_delete');
        Route::get('gen_invoice/{id}', 'ReturnController@genInvoice')->name('return_invoice');
        Route::get('gen_devis/{id}', 'ReturnController@genQuotation')->name('return_quotation');
        Route::get('/status', 'ReturnController@updateStatus');
        });

    Route::group(['prefix' => 'settings'],function(){

        Route::get('menu','MenuController@index')->name('menu.get');
        Route::get('vats','BackEndViewController@vat')->name('vats');
        Route::post('vat', 'VatController@saveVat')->name('backend-save-vat');
        Route::get('getVat/{type}','VatController@getVat');

        Route::get('markups', 'BackEndViewController@markupView');
        Route::post('markup/admin', 'MarkupController@saveAdminMarkup')->name('backend-save-markup');
        Route::get('getMarkup/{id}','MarkupController@getMarkupById');

        Route::get('markdown', 'BackEndViewController@index');
        Route::post('createOrUpdateMarkdown','MarkdownController@createOrUpdate');
        Route::get('getMarkdown/{id}','MarkdownController@getMarkdownById');

  ///      Route::get('/', 'SettingController@index')->name('settings');
     ///   Route::post('/update', 'SettingController@update')->name('settings.update');

        Route::group(['prefix' => 'bank-details'],function(){
            Route::get('/fetch/{id}', 'BankDetailController@getBankDetail')->name('backend-bank-details');
            Route::view('','pages.backend.settings.banks')->name('banks');
            Route::post('/saveOrUpdate','BankDetailController@saveOrUpdateBankDetails');
            Route::post('/activate','BankDetailController@activateBankDetails');
            Route::post('/deActivate','BankDetailController@deActivateBankDetails');
            Route::post('/delete','BankDetailController@deleteBankDetails');
        });

        Route::get('/profile', 'BackEndViewController@profile')->name('profile');

        Route::post('/updateProfile','ProfileController@updateProfileImageJs');
        Route::post('/update/user/profile','ProfileController@updateUserProfile')->name('update-profile');
        Route::post('/update/user/image','ProfileController@updateUserProfileImage')->name('update-profile-image');
        Route::post('/update/user/password','ProfileController@updateUserProfilePassword')->name('update-profile-password');

        Route::group(['prefix' => 'users'],function(){
            Route::get('/', 'BackEndViewController@usersManagement');
            Route::post('/add-new','UserController@addNew');
            Route::get('/delete-user/{id}','UserController@deleteUser');
            Route::post('/update-user','UserController@updateUser');
        });

        Route::group(['prefix' => 'wallets'],function(){

            Route::get('','BackEndViewController@walletsManagement');
            Route::post('/update-wallet','WalletController@updateWallet');
            Route::get('/user-wallet','BackEndViewController@userWallet');
        });

        Route::group(['prefix' => 'language'],function(){

        Route::get('/', 'LanguageController@pageLanguage')->name('language');
        Route::put('/status/{code}', 'LanguageController@updateStatus')->name('language_status');
        Route::put('/default', 'LanguageController@updateStatus')->name('language_default');
      
        });
        
    //    Route::get('subscribers','BackEndViewController@emailSubscriptions');

        Route::get('visa-application-requests','BackEndViewController@visaApplicationRequests');

    });

    Route::group(['prefix' => 'bookings'],function(){

        Route::group(['prefix' => 'flight'],function(){
            Route::get('user','BackEndViewController@userFlightBookings');
            Route::get('agent','BackEndViewController@agentFlightBookings');
            Route::get('customer','BackEndViewController@customerFlightBookings');
            Route::get('itinerary-booking-information/{reference}','BackEndViewController@itineraryBookingInformation');
        });

        Route::group(['prefix' => 'hotel'],function(){
            Route::get('user','BackEndViewController@userHotelBookings');
            Route::get('agent','BackEndViewController@agentHotelBookings');
            Route::get('customer','BackEndViewController@customerHotelBookings');
            Route::get('hotel-reservation-information/{reference}','BackEndViewController@hotelBookingInformation');
            Route::get('rebook-hotel-room/{reference}','HotelController@reBookHotelRoom');
        });

        Route::group(['prefix' => 'package'],function(){
            Route::get('user','BackEndViewController@userPackageBookings');
            Route::get('agent','BackEndViewController@agentPackageBookings');
            Route::get('customer','BackEndViewController@customerPackageBookings');
            Route::get('package-reservation-information/{reference}','BackEndViewController@packageBookingInformation');
        });
    });


    Route::group(['prefix' => 'transactions'],function(){
        Route::get('/online-payment','BackEndViewController@onlinePayment');
        Route::get('/bank-payment','BackEndViewController@bankPayment');

        Route::get('/user/online-payment','BackEndViewController@userOnlinePayment');
        Route::get('/user/bank-payment','BackEndViewController@userBankPayment');

        Route::post('/update-payment-proof','BankPaymentController@updatePaymentProof');
        Route::get('/update-payment-status/{id}/{type}','BankPaymentController@updatePaymentStatus');
        Route::get('/requery/{id}','OnlinePaymentController@requery');
    });

    Route::group(['prefix' => 'backend/travel-packages', 'middleware' => ['auth','role:admin'] ], function(){

        Route::get('', 'TravelPackageController@travelPackages');
        Route::get('create', 'TravelPackageController@packageCreate');
        Route::post('createPackage','TravelPackageController@create');
        Route::post('createFlightDeal','TravelPackageController@createFlightDeal');
        Route::post('createHotelDeal','TravelPackageController@createHotelDeal');
        Route::post('createAttraction','TravelPackageController@createAttraction');
        Route::get('delete-sight-seeing/{id}','TravelPackageController@deleteSightSeeing');
        Route::get('activate/{id}', 'TravelPackageController@activate')->name('activate');
        Route::get('deactivate/{id}', 'TravelPackageController@deactivate')->name('deactivate');
        Route::get('delete/{id}', 'TravelPackageController@deletePackage');
        Route::get('edit/{id}', 'TravelPackageController@editPackage');
        Route::post('delete-image','TravelPackageController@deleteImage');
        Route::get('categories','TravelPackageController@categories');
        Route::post('activate/category','TravelPackageController@activateCategory');
        Route::post('deActivate/category','TravelPackageController@deActivateCategory');
        Route::post('categoryCreateOrUpdate','TravelPackageController@categoryCreateOrUpdate');
        Route::post('storeGalleryInfo','TravelPackageController@storeGalleryImages');

        // Newsletter Route
        Route::get('/subscriber', 'NewsletterController@newsletter')->name('admin.newsletter');
        Route::get('/mailsubscriber', 'NewsletterController@mailsubscriber')->name('admin.mailsubscriber');
        Route::post('/subscribers/sendmail', 'NewsletterController@subscsendmail')->name('admin.subscribers.sendmail');
        Route::get('/subscriber/add', 'NewsletterController@add')->name('admin.newsletter.add');
        Route::post('/subscriber/store', 'NewsletterController@store')->name('admin.newsletter.store');
        Route::post('/subscriber/delete/{id}/', 'NewsletterController@delete')->name('admin.newsletter.delete');
        Route::get('/subscriber/edit/{id}/', 'NewsletterController@edit')->name('admin.newsletter.edit');
        Route::post('/subscriber/update/{id}/', 'NewsletterController@update')->name('admin.newsletter.update');


    });

});

Route::group(['prefix' => '/deals'],function(){

    Route::get('','ViewController@hotDeals');
    Route::get('flight','ViewController@flightDeals');
    Route::get('hotel','ViewController@hotelDeals');
    Route::get('attraction','ViewController@attractionDeals');
    Route::get('details/{id}','ViewController@dealDetails');
    Route::get('booking/{id}','ViewController@dealBooking');
    Route::post('booking','TravelPackageController@bookDeal');
    Route::get('payment-options','ViewController@dealPaymentOptions')->middleware('deals.booking.id');
    Route::get('booking-confirmation','ViewController@dealBookingConfirmation')->middleware('payment.info','deals.booking.id');
    Route::post('calculateBookingAmount','TravelPackageController@calculateBookingAmount');
    Route::post('wallet-payment','WalletController@dealWalletPayment');
    Route::post('bank-payment','BankPaymentController@dealBankPayment');

});

Auth::routes();


