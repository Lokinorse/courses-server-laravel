@extends('layouts.app')

@section('content')




<div class="container cabinet-room">

    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">Все тэги</h1>
        <h1 class="program-name">

        @foreach ($tags as $tag)
        <h2>{{$tag->name}}</h2><br>
        @endforeach
        </h1>
        </div>
    </div>

</div>



@endsection

