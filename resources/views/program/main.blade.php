@extends('layouts.cabinet')

@section('content')
<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">{{ $program->name}}</h1>
        </div>
        <div class="col-md-12">
            <div class="progress">
            <div class="progress-bar" style="width: {{$percentProgress}}%" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
        <div class="col-md-12">
            <label class="progresslabel">Ваш прогресс: {{round($percentProgress)}}%</label>
        </div>

        <div class="col-md-12">
          {!! $program->description !!}
        </div>
    </div>
    <div class="row program-content-wrapper justify-content-center">


        <div class="col-md-4">
            <div class="program-section-header">Содержание</div>
            <div class="program-menu">
                @include("program.lesson-menu", compact('menu', 'program', 'progress', 'lesson', 'breadcrumbs'))
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">{{$lesson->name}}</h2>
            @include("program.lesson-content", compact('lesson'))
        </div>
    </div>
</div>

@include("parts.paymodal")



@endsection
