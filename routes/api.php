<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
     $request->user();
});

Route::group([
    'as' => 'api_',
    'middleware' => []], function (){

    Route::post('/upload-image', 'ImageController@upload')->name('upload_image');

    Route::get('/cities', 'Frontend\CityController@search')->name('city_search');
    Route::put('/city/status', 'Backend\CityController@updateStatus')->name('city_update_status');
    Route::get('/cities/{country_id}', 'Backend\CityController@getListByCountry')->name('city_get_list');

    Route::get('/categories', 'Frontend\CategoryController@search')->name('category_search');
    Route::put('/category/status', 'Backend\CategoryController@updateStatus')->name('category_update_status');
    Route::put('/category/is-feature', 'Backend\CategoryController@updateIsFeature')->name('category_update_is_feature');

    Route::put('/places/status', 'Backend\PlaceController@updateStatus')->name('place_update_status');
    //Route::get('/places/map', 'Frontend\PlaceController@getListMap')->name('place_get_list_map');

    Route::put('/reviews/status', 'Backend\ReviewController@updateStatus')->name('review_update_status');

    //Route::get('/search', 'Frontend\HomeController@ajaxSearch')->name('search');

    Route::put('/posts/status', 'Backend\PostController@updateStatus')->name('post_update_status');
    Route::put('/pages/status', 'Backend\PageController@updateStatus')->name('page_update_status');

    Route::put('/users/status', 'Backend\UserController@updateStatus')->name('user_update_status');
    Route::put('/users/role', 'Backend\UserController@updateRole')->name('user_update_role');

    Route::put('/languages/default', 'Backend\LanguageController@setDefault')->name('language_set_default');

 //   Route::post('/user/reset-password', 'Frontend\ResetPasswordController@sendMail')->name('user_forgot_password');
});


Route::group([
    'prefix' => 'app',
    'namespace' => 'API',
    'as' => 'api_app_',
    'middleware' => []], function (){

    Route::get('/cities', 'CityController@list');
    Route::get('/cities/{id}', 'CityController@detail')->where('id', '[0-9]+');
    Route::get('/cities/popular', 'CityController@popularCity');
    Route::get('/destination', 'PlaceController@list');

    Route::get('/posts/inspiration', 'PostController@postInspiration');

    Route::get('/pages', 'PostController@webPages');

    Route::get('/places/{id}', 'PlaceController@detail')->where('id', '[0-9]+');

    Route::get('/places/search', 'PlaceController@search');

    /**
     * Users
     */
    Route::get('/users', 'UserController@getUserInfo')->middleware('auth:api');
    Route::get('/users/{user_id}/place', 'UserController@getPlaceByUser')->middleware('auth:api');
    Route::get('/users/{user_id}/place/wishlist', 'UserController@getPlaceByUser');
  ///  Route::post('/users/reset-password', 'Frontend\ResetPasswordController@sendMail')->name('user_forgot_password');
    Route::post('/users/login', 'UserController@login');

    /**
     * Places
     */
    Route::post('/places/wishlist', 'PlaceController@addPlaceToWishlist')->middleware('auth:api');
    Route::delete('/places/wishlist', 'PlaceController@removePlaceFromWishlist')->middleware('auth:api');

});


Route::group(['prefix' => 'v1'],function(){

    Route::group(['prefix' => 'auth'],function(){
        Route::post('register','authAPIController@register');
        Route::post('login','authAPIController@login');
        Route::post('logout','authAPIController@logout');
    });

    Route::group(['middleware' => 'auth:api'],function(){

        Route::group(['prefix' => 'flight'],function(){

            Route::post('one-way','FlightAPIController@oneWaySearchV1');
            Route::post('round-trip','FlightAPIController@roundTripSearchV1');
            Route::post('multiple-destination','FlightAPIController@multiDestinationSearchV1');
            Route::post('price-itinerary','FlightAPIController@priceItineraryV1');
            Route::post('book-itinerary','FlightAPIController@bookItineraryV1');

            Route::get('all-bookings/{userId}','FlightAPIController@getAllBookingsV1');
            Route::get('get-booking/{pnr}','FlightAPIController@getFlightBookingV1');
            Route::get('payment-successful/{pnr}','FlightAPIController@paymentSuccessfulV1');
            Route::get('payment-pending/{pnr}','FlightAPIController@paymentPendingV1');

        });

        Route::group(['prefix' => 'hotel'],function(){

        });

    });
});


