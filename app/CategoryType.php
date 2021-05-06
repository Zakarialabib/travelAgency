<?php

namespace App;

use Astrotomic\Translatable\Translatable;
use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;
use Illuminate\Database\Eloquent\Model;

class CategoryType extends Model implements TranslatableContract
{
    use Translatable;

    public $translatedAttributes = ['name','description'];

    protected $table = 'category_types';

    protected $fillable = [
        'category_id', 'status', 'image'
    ];

    protected $hidden = [];

    protected $casts = [
        'category_id' => 'integer'
    ];

    const STATUS_ACTIVE = 1;
    const STATUS_DEACTIVE = 0;

    public function category(){
        return $this->hasOne(Category::class, 'id', 'category_id');
    }

    public function getListAll()
    {
        $category_types = self::query()
            ->orderBy('created_at', 'desc')
            ->get();
        return $category_types;
    }

    public function getListByCat($cat_id)
    {
        $category_types = self::query()
            ->with('category')
            ->orderBy('created_at', 'desc');

        if ($cat_id)
            $category_types->where('category_id', $cat_id);

        $category_types = $category_types->get();

        return $category_types;
    }
}