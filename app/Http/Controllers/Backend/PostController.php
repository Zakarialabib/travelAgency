<?php

namespace App\Http\Controllers\Backend;


use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Category;
use App\Post;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Notifications\ArticlePublished;
use Illuminate\Notifications\Notifiable;

class PostController extends Controller
{
    use Notifiable;
    private $response;

    public function __construct(Response $response)
    {
        $this->response = $response;
    }

    public function list(Request $request)
    {
        $filter = [
            'category_id' => $request->category_id
        ];

        $posts = Post::query();

        // Check is route post type: blog
        if (isRoute('post_list_blog')) {
            $post_type = Post::TYPE_BLOG;
            $posts->where('type', $post_type);
            // have filter by category
            if ($request->category_id) {
                $posts->where('category', 'like', "%{$request->category_id}%");
            }
        }

        // Check is route post type: page
        if (isRoute('post_list_page')) {
            $post_type = Post::TYPE_PAGE;
            $posts->where('type', $post_type);
        }

        // Get all posts
        $posts = $posts->orderBy('id', 'desc')->get();

        // Get all categories
        $categories = Category::query()
            ->where('type', Category::TYPE_POST)
            ->get();

        return view('backend.post.post_list', [
            'posts' => $posts,
            'post_type' => $post_type,
            'categories' => $categories,
            'filter' => $filter,
        ]);
    }

    public function pageCreate(Request $request, $type)
    {
        $post_type = $type;

        $categories = Category::query()
            ->where('type', Category::TYPE_POST)
            ->where('status', Category::STATUS_ACTIVE)
            ->get();

        $post = Post::find($request->id);

        return view('backend.post.post_add', [
            'post_type' => $post_type,
            'categories' => $categories,
            'post' => $post,
        ]);
    }

    public function pageEdit($id)
    {

    }

    public function create(Request $request)
    {
        $request['user_id'] = Auth::id();
        $request['slug'] = getSlug($request, 'title');

        $rules = [
            'user_id' => 'required',
            'category' => '',
            '%title%' => '',
            'slug' => 'required',
            '%content%' => '',
            'type' => 'required',
            'seo_title' => '',
            'seo_description' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ];

        $rule_factory = RuleFactory::make($rules);

        $data = $this->validate($request, $rule_factory);

        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }

//        return $data;

        $post = new Post();
        $post->fill($data)->save();

        ($request->type === Post::TYPE_BLOG) ? $route_name = "post_list_blog" : $route_name = "post_list_page";
        

        $post->notify(new ArticlePublished());


        return redirect(route($route_name))->with('success', 'Create blog post success!');
    }

    public function update(Request $request)
    {
        $request['slug'] = getSlug($request, 'title');

        $rules = [
            'category' => '',
            'slug' => '',
            '%title%' => '',
            '%content%' => '',
            'seo_title' => '',
            'seo_description' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ];

        $rule_factory = RuleFactory::make($rules);

        $data = $this->validate($request, $rule_factory);

        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }

        $post = Post::find($request->post_id);

        $post->fill($data)->save();

        ($post->type === Post::TYPE_BLOG) ? $route_name = "post_list_blog" : $route_name = "post_list_page";

        return redirect(route($route_name))->with('success', 'Update post success!');
    }

    public function destroy($id)
    {
        Post::destroy($id);
        return back()->with('success', 'Delete post success!');
    }

    public function updateStatus(Request $request)
    {
        $data = $this->validate($request, [
            'status' => 'required',
        ]);

        $model = Post::find($request->post_id);
        $model->fill($data);

        if ($model->save()) {
            return $this->response->formatResponse(200, $model, 'Update post status success!');
        }
    }


    public function createPostTest()
    {
//        App::setLocale('fr');
//        config(['app.locale' => 'fr']);

        $data = [
            'en' => [
                'title' => "Test TA"
            ],
            'fr' => [
                'title' => "Test TV"
            ]
        ];


        $test = Post::query()
            ->first();

        return $test;

    }


}