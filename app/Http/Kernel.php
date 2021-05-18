<?php

namespace App\Http;


use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
        \App\Http\Middleware\TrimStrings::class,
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
        \App\Http\Middleware\TrustProxies::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            // \Illuminate\Session\Middleware\AuthenticateSession::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \App\Http\Middleware\VerifyCsrfToken::class,
            \Illuminate\Routing\Middleware\SubstituteBindings::class,

            // Force redirect to HTTPS
            \App\Http\Middleware\HttpsProtocol::class,

             // Set language
             \App\Http\Middleware\Locale::class,

            // Page Speed
            \RenatoMarinho\LaravelPageSpeed\Middleware\InlineCss::class,
            \RenatoMarinho\LaravelPageSpeed\Middleware\ElideAttributes::class,
            \RenatoMarinho\LaravelPageSpeed\Middleware\InsertDNSPrefetch::class,
            \RenatoMarinho\LaravelPageSpeed\Middleware\RemoveComments::class,
            \RenatoMarinho\LaravelPageSpeed\Middleware\TrimUrls::class, 
        //   \RenatoMarinho\LaravelPageSpeed\Middleware\CollapseWhitespace::class, // Note: This middleware invokes "RemoveComments::class" before it runs.
        //   \RenatoMarinho\LaravelPageSpeed\Middleware\DeferJavascript::class,

        ],

        'api' => [
            'throttle:60,1',
            'bindings',
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \Illuminate\Auth\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
        'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'role' => \Zizaco\Entrust\Middleware\EntrustRole::class,
        'permission' => \Zizaco\Entrust\Middleware\EntrustPermission::class,
        'ability' => \Zizaco\Entrust\Middleware\EntrustAbility::class,
        'hotel' => \App\Http\Middleware\CheckAvailableHotels::class,
        'flight' => \App\Http\Middleware\CheckAvailableItineraries::class,
        'flight.search.param' => \App\Http\Middleware\CheckFlightSearchParam::class,
        'hotel.search.param' => \App\Http\Middleware\CheckHotelSearchParam::class,
        'flight.pricing.info' => \App\Http\Middleware\CheckItineraryPricingInfo::class,
        'payment.info' => \App\Http\Middleware\CheckPaymentInfo::class,
        'pnr'          => \App\Http\Middleware\CheckPnr::class,
        'hotel.information' => \App\Http\Middleware\CheckSelectedHotelInformation::class,
        'hotel.room.information' => \App\Http\Middleware\CheckSelectedHotelRoomInformation::class,
        'flight.selected' => \App\Http\Middleware\CheckSelectedItinerary::class,
        'hotel.room.selected' => \App\Http\Middleware\CheckSelectedRoom::class,
        'deals.booking.id' => \App\Http\Middleware\checkDealBookingId::class,
    ];

        /**
     * The priority-sorted list of middleware.
     *
     * This forces non-global middleware to always be in the given order.
     *
     * @var array
     */
    protected $middlewarePriority = [
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \Illuminate\Session\Middleware\AuthenticateSession::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
        \Illuminate\Auth\Middleware\Authorize::class,
    ];
}
