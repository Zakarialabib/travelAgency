@extends('layouts.backend')

@section('content')

<div class="p-0 -mb-5">
    <div class="container mx-auto sm:px-4 max-w-full">
        <div class="flex flex-wrap ">
        <div class="sm:w-1/2 pr-4 pl-4">
            <h1 class="flex flex-wrap text-lg capitalize text-bold pt-3 pb-3 py-4 px-4 mb-2 m-0 text-gray-900">{{ __('newsletters') }} </h1>
        </div><!-- /.col -->
        <button type="button" class="btn-sm btn-danger" style='margin:30px;'>
            <a href="{{ route('admin.mailsubscriber')}}" class="inline-flex justify-center  text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" style='padding:20px;'>
                        envoyer un email
            </a>
        </button>
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<section class="content">
    <div class="container mx-auto sm:px-4 max-w-full">
        <div class="flex flex-wrap ">
            <div class="md:w-full pr-4 pl-4">
                <div class="relative flex flex-col min-w-0 rounded break-words border bg-white border-1 border-gray-300 card-primary card-outline">
                    <div class="flex my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        <h3 class="px-4 mt-1 w-1/2">{{ __('Email List') }}</h3>
                        <div class="w-1/2 justify-end flex"  style='padding:10px;'>
                        <button type="button" class="btn-sm btn-success">
                            <a href="{{ route('admin.newsletter.add')}}" class="inline-flex justify-center  text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" style='padding:20px;'>
                             {{ __('Add Email') }}
                            </a>
                        </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="flex-auto p-6" >
                    <table class="table">
                        <thead>
                            <tr>
                                <th>{{ __('#') }}</th>
                                <th scope="col">{{ __('Email') }}</th>
                                <th scope="col">{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($newsletters as $id=>$newsletter)
                            <tr>
                                <td>
                                    {{ $id }}
                                </td>
                                <td scope='row'>
                                    {{ $newsletter->email }}
                                </td>
                                <td scope='row'>
                                <button type="button" class="btn-sm btn-success"  style='margin-bottom:2px;'>
                                  <a href="{{ route('admin.newsletter.edit', $newsletter->id) }}" class="no-underline text-white ">Modifier</a>

                                  </button> 
                                    <form  id="deleteform" class="inline-block" action="{{ route('admin.newsletter.delete', $newsletter->id ) }}" method="post">
                                        @csrf
                                        <input type="hidden" name="id" value="{{ $newsletter->id }}">
                                        <button type="button" class="btn-sm btn-danger place_delete" id='delete'>{{__('Delete')}}</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach

                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</section>
@endsection