@extends('layouts.master-layouts')
@section('title')
Starter Page
@endsection
@section('content')
@component('common-components.breadcrumb')
@slot('pagetitle') Layouts @endslot
@slot('title') Horizontal @endslot
@endcomponent

@endsection
@section('script')

@endsection
