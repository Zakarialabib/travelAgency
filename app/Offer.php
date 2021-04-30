<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use \Staudenmeir\EloquentJsonRelations\HasJsonRelationships;
use Astrotomic\Translatable\Translatable;
use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;

class Offer extends Model  implements TranslatableContract
{
    use Translatable, HasJsonRelationships {
        Translatable::getAttribute insteadof HasJsonRelationships;
    }

    public $translatedAttributes = ['name', 'description'];

    protected $casts = [
        'category' => 'json',
        'gallery' => 'json',
        'itinerary' => 'json',
        'user_id' => 'integer',
        'price' => 'double',
        'status' => 'integer'
    ];

    protected $table = 'offers';

    protected $fillable = [
        'user_id', 'category', 'slug',  'price',
        'address', 'thumb', 'gallery', 'status', 'seo_title', 'seo_description', 'itinerary'
    ];

    protected $hidden = [];

    const STATUS_DEACTIVE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_PENDING = 2;
    const STATUS_DELETE = 4;

    public function categories()
    {
        return $this->belongsToJson(Category::class, 'category');
    }

    public function reviews()
    {
        return $this->hasMany(Review::class, 'offer_id', 'id');
    }

    public function avgReview()
    {
        return $this->reviews()
            ->selectRaw('avg(score) as aggregate, offer_id')
            ->groupBy('offer_id');
    }

    public function getAvgReviewAttribute()
    {
        if (!array_key_exists('avgReview', $this->relations)) {
            $this->load('avgReview');
        }
        $relation = $this->getRelation('avgReview')->first();
        return ($relation) ? $relation->aggregate : null;
    }

    public function wishList()
    {
        return $this->hasMany(Wishlist::class, 'offer_id', 'id')->where('user_id', Auth::id());
    }

    public function getBySlug($slug)
    {
        $place = self::query()
            ->withCount('wishList')
            ->where('slug', $slug)
            ->first();
        return $place;
    }
}