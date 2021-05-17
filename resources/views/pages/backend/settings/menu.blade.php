@extends('layouts.backend')

@section('page-title') {{__('Menu Management')}}  @endsection

@section('content')

{!! Menu::render() !!}

@endsection  

@push('scripts')

{!! Menu::scripts() !!}

@endpush