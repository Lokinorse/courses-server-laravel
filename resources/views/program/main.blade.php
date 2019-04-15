@extends('layouts.app')

@section('content')

<script>
    var currentUnit = {!!json_encode($lesson) !!}
    var currentProgram = {!!json_encode($program) !!}
</script>

<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">{{ $program->name}}</h1>
        </div>
        @if (Auth::user())
            <div class="col-md-12">
                <div class="progress">
                    <div class="progress-bar" style="width: {{$percentProgress}}%" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="col-md-12">
                <label class="progresslabel">Прогресс: {{round($percentProgress)}}%</label>
            </div>
        @endif

    </div>
    <div class="row program-content-wrapper justify-content-center">


        <div class="col-md-4">
            <div class="program-section-header">Содержание</div>
            <div class="program-menu">
                @include("program.lesson-menu", compact('menu', 'program', 'progress', 'lesson', 'breadcrumbs'))
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Урок: {{$lesson->name}}</h2>
            @include("program.lesson-content", compact('lesson', 'progress', 'program'))
        </div>
    </div>
</div>



@endsection


