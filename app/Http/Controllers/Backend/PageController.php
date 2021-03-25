<?php

namespace App\Http\Controllers\Backend;


use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Page;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class PageController extends Controller
{
    private $response;

    public function __construct(Response $response)
    {
        $this->response = $response;
    }

    public function list(Request $request)
    {
        // Get all pages
        $pages = Page::query()
        ->orderBy('created_at', 'desc')
        ->get();

        return view('backend.page.page_list', [
            'pages' => $pages,
        ]);
    }

    public function pageCreate(Request $request)
    {
        $page = Page::find($request->id);

        return view('backend.page.page_add', [
            'page' => $page,
        ]);
    }

      /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $page = Page::find($id);

        return view('backend.page.page_edit',compact('page'));
    }


    public function create(Request $request)
    {
        $request['slug'] = getSlug($request, 'title');

        $rules = [
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

        $pages = new Page();
        $pages->fill($data)->save();

        return view('backend.page.page_create', [
            'pages' => $pages,
        ]);
    }

    public function update(Request $request)
    {
        $request['slug'] = getSlug($request, 'title');

        $rules = [
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

        $pages = Page::find($request->page_id);

        $pages->update($data)->save();

        return redirect(route('page_list'))->with('success', 'Update Page success!');
    }

    public function destroy($id)
    {
        Page::destroy($id);
        return back()->with('success', 'Delete page success!');
    }

    public function updateStatus(Request $request)
    {
        $data = $this->validate($request, [
            'status' => 'required',
        ]);

        $pages = Page::find($request->page_id);
        $pages->fill($data);

        if ($pages->save()) {
            return $this->response->formatResponse(200, $pages, 'Update page status success!');
        }
    }

}
