<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Slider;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = Slider::orderby('id', 'desc')->paginate(10);
        return view('pages.backend.slides.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return  view ('pages.backend.slides.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $this->validate($request, array(
            'title'=>'',
            'photo'=>'',
          ));

          $slider = new Slider;
          $slider->title = $request->input('title');

          if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $filename = 'slide' . '-' . time() . '.' . $photo->getClientOriginalExtension();
            $location = public_path('images/');
            $request->file('photo')->move($location, $filename);
  
            $slider->photo = $filename;
          }

          $slider->save();

          return redirect()->route('slides.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $slider = Slider::findOrFail($id);
        return view('pages.backend.slides.edit', compact('slider'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    
        $slider = Slider::find($id);
        $this->validate($request, array(
          'title'=>'required|max:225',
          'photo'=>'required|image'
       ));
 
        $slider = Slider::where('id',$id)->first();
 
        $slider->title = $request->input('title');
 
        if ($request->hasFile('photo')) {
         $photo = $request->file('photo');
         $filename = 'slide' . '-' . time() . '.' . $photo->getClientOriginalExtension();
         $location = public_path('images/');
         $request->file('photo')->move($location, $filename);
 
         $oldFilename = $slider->photo;
         $slider->photo= $filename;
         if(!empty($slider->photo)){
           Storage::delete($oldFilename);
         }
       }
 
       $slider->save();
 
       return redirect()->route('pages.backend.slides.index',
           $slider->id)->with('success',
           'Slider, '. $slider->title.' updated');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $slider = Slider::findOrFail($id);
        Storage::delete($slider->photo);
        $slider->delete();
      
        return redirect()->route('pages.backend.slides.index')
                ->with('success',
                 'Slide successfully deleted');
    }
}
