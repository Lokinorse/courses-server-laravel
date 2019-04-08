@extends('layouts.cabinet')

@section('content')
<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
        <h1 class="course-name">{{$unit->name}}</h1>
        </div>
        <div class="col-md-12">
            <div class="progress">
                <div class="progress-bar" style="width: 5%" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
        <div class="col-md-12">
            <label class="progresslabel">Ваш прогресс: 5%</label>
        </div>

        <div class="col-md-12">
          @markdown($unit->description)
        </div>
    </div>
    <div class="row course-content-wrapper justify-content-center">


        <div class="col-md-4 lesson-nav-wrapper">
          @include('cabinet.hierarchy', ["unit" => $unit]) 
        </div>

        <div class="col-md-8">
            <div class="lesson-wrapper tab-content">
                <div class="tab-pane fade show">
                  
                </div>


            </div>
        </div>
    </div>
</div>

@include("parts.paymodal")



@endsection
