@extends('layouts.app')



@section('content')


<div class="container cabinet-room">
    <div class="row courses-nav">
        @php
            $current_course = $program->getCurrentCourse();
        @endphp
        @include('cabinet.render-courses', compact('program', 'user_courses_progress', 'current_course' ))
    </div>
    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">{{ $course->name}}</h1>
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
                @include("learning.lessons-menu", compact('sorted_lessons', 'progress', 'current_lesson', 'course'))
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Урок: {{$current_lesson->name}}</h2>
            @include("learning.lesson-content", compact('current_lesson', 'progress', 'course', 'program', 'messages'))
        </div>
    </div>
</div>



@endsection


