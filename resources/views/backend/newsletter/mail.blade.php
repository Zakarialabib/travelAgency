@extends('layouts.backend')

@section('content')

<div class="p-0 -mb-5">
    <div class="container mx-auto sm:px-4 max-w-full">
        <div class="flex flex-wrap ">
        <div class="sm:w-1/2 pr-4 pl-4">
            <h1 class="flex flex-wrap text-lg capitalize text-bold pt-3 pb-3 py-4 px-4 mb-2 m-0 text-gray-900">{{ __('Mail Subscribers') }} </h1>
        </div><!-- /.col -->
        
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<section class="content">
    <div class="container mx-auto sm:px-4 max-w-full">
        <div class="flex flex-wrap ">
            <div class="md:w-full pr-4 pl-4">
                <div class="relative flex flex-col min-w-0 rounded break-words border bg-white border-1 border-gray-300 card-primary card-outline">
                    <div class="flex my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        <h3 class="px-4 mt-1 w-1/2 ">{{ __('Send Mail') }}</h3>
                    
                    </div>
                    <!-- /.card-header -->
                    <div class="flex-auto p-6">
                            <form class="" action="{{route('admin.subscribers.sendmail')}}" method="post">
                                @csrf
                                <div class="flex flex-wrap  justify-center">
                                    <div class="lg:w-2/3 pr-4 pl-4">
                                        <div class="mb-4">
                                            <label for="">Subject <span class="text-red-600">*</span></label>
                                            <input type="text" class="block appearance-none w-full py-1 px-2 mb-1 text-base leading-normal bg-white text-gray-800 border border-gray-200 rounded" name="subject" value="" placeholder="Enter subject of E-mail">
                                            @if ($errors->has('subject'))
                                              <p class="text-red-600 mb-0">{{$errors->first('subject')}}</p>
                                            @endif
                                          </div>
                                          <div class="mb-4">
                                            <label for="">Message <span class="text-red-600">*</span></label>
                                            <textarea type="text" class="form-control tinymce_editor" id="place_description" name="message" rows="6"></textarea>

                                            @if ($errors->has('message'))
                                              <p class="text-red-600 mb-0">{{$errors->first('message')}}</p>
                                            @endif
                                          </div>
                                          <button type="submit" class="btn-sm btn-success inline-block align-middle select-none border whitespace-no-wrap py-2 px-4 bg-blue-600 hover:bg-blue-700 focus:ring-blue-500 focus:ring-offset-blue-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg">
                                            Send Mail 
                                        </button>
                                    </div>
                                </div>

                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</section>
@endsection