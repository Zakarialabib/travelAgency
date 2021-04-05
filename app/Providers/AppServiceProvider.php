<?php

namespace App\Providers;


use App\Category;
use App\City;
use App\Language;
use App\Place;
use App\Menu;
use Harimayco\Menu\Models\Menus;
use Harimayco\Menu\Models\MenuItems;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        $destinations = Cache::remember('destinations', 60 * 60, function () {
            return City::query()
                ->limit(10)
                ->get();
        });

        $popular_search_cities = Cache::remember('popular_search_cities', 60 * 60, function () {
            return City::query()
                ->inRandomOrder()
                ->limit(3)
                ->get();
        });

        $city_count = City::query()
            ->where('status', City::STATUS_ACTIVE)
            ->count();

        $category_count = Category::query()
            ->where('status', Category::STATUS_ACTIVE)
            ->where('type', Category::TYPE_PLACE)
            ->count();

        $place_count = Place::query()
            ->where('status', Place::STATUS_ACTIVE)
            ->count();

        $menu = Menus::where('name','Header')->first();
        $menuitems = $menu->items;

        $menus = Menus::where('name','FOOTER')->first();
        $menuitems = $menus->items;

        if (Schema::hasTable('languages')) {
            $languages = Language::query()
                ->where('is_active', Language::STATUS_ACTIVE)
                ->orderBy('is_default', 'desc')
                ->get();

            $language_default = Language::query()
                ->where('is_default', Language::IS_DEFAULT)
                ->first();
        } else {
            $languages = [];
        }
        View::share([
            'menu' => $menu,
            'menus' => $menus,
            'menuitems' => $menuitems,
            'languages' => $languages,
            'language_default' => $language_default,
            'destinations' => $destinations,
            'popular_search_cities' => $popular_search_cities,
            'city_count' => $city_count,
            'category_count' => $category_count,
            'place_count' => $place_count,
        ]);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->environment() !== 'production') {
            $this->app->register(\Way\Generators\GeneratorsServiceProvider::class);
            $this->app->register(\Xethron\MigrationsGenerator\MigrationsGeneratorServiceProvider::class);
        }
        //
    }
}
