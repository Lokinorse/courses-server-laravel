@extends('layouts.app')

@section('content')


<div class="container cabinet-room">

    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">Сообщество - {{ $messages->total() }} комментариев</h1>
        </div>
    </div>

    <div class="community-preview-wrapper">
        @foreach ($messages as $msg)

        @include('community.message', compact('msg'))
        @endforeach
    </div>
    
    <div class="community-preview-pagination">
        {{ $messages->links() }}
    </div>
</div>



@endsection


