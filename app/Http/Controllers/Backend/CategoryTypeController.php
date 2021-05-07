<?php

namespace App\Http\Controllers\Backend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Category;
use App\CategoryType;
use App\User;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;

class CategoryTypeController extends Controller
{
    private $category;
    private $category_type;
    private $response;

    public function __construct(Category $category, CategoryType $category_type, Response $response)
    {
        $this->category = $category;
        $this->category_type = $category_type;
        $this->response = $response;
    }

    public function list(Request $request)
    {
        $user = User::where('is_admin','=',1)->first();

        $param_category_id = $request->category_id;
        $categories = $this->category->getListAll(Category::TYPE_OFFER);
        $category_types = $this->category_type->getListByCat($param_category_id);

//        return $category_types;

        return view('pages.backend.category_type.category_type_list', [
            'categories' => $categories,
            'category_types' => $category_types,
            'category_id' => (int)$param_category_id,
            'user' => $user
        ]);
    }

    public function store(Request $request)
    {
        $categories = Category::query()
        ->where('type', Category::TYPE_POST)
        ->where('status', Category::STATUS_ACTIVE)
        ->get();

        $type = Category::all();

        return view('pages.backend.category_type.category_type_create', [
            'categories' => $categories,
            'type' => $type
        ]);

    }
    public function create(Request $request)
    {
        $rules = [
            'category_id' => 'required',
            '%name%' => '',
            '%description%' => '',
            'image' => 'mimes:jpeg,jpg,png,gif|max:10000',
        ];
        $rule_factory = RuleFactory::make($rules);
        $data = $this->validate($request, $rule_factory);

        if ($request->hasFile('image')) {
            $icon = $request->file('image');
            $file_name = $this->uploadImage($icon, '');
            $data['image'] = $file_name;
        }

        $model = new CategoryType();
        $model->fill($data)->save();

        return back()->with('success', "Type d'activité ajoutée avec succes!");
    }

    public function update(Request $request)
    {
        $rules = [
            'category_id' => 'required',
            '%name%' => '',
            '%description%' => '',
            'image' => 'mimes:jpeg,jpg,png,gif|max:10000',

        ];
        $rule_factory = RuleFactory::make($rules);
        $data = $this->validate($request, $rule_factory);

        if ($request->hasFile('image')) {
            $icon = $request->file('image');
            $file_name = $this->uploadImage($icon, '');
            $data['image'] = $file_name;
        }

        $model = CategoryType::find($request->place_type_id);
        $model->fill($data);

        if ($model->save()) {
            return back()->with('success', "Type d'activité à jour");
        }
    }

    public function destroy($id)
    {
        CategoryType::destroy($id);
        return back()->with('success', "Type d'activtié suprimée avec succes");
    }
}