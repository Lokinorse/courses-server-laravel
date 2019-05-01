@extends('layouts.landing')

@section('content')
	@include("landing.matrix")
	@include("landing.program")
	@include("landing.advantages")
	@include("landing.how-to-learn")
	@include("landing.resume")
	@include("landing.teacher")
	@include("landing.tarifs")
	@include("landing.faq")
	@include("landing.starter", ["position" => 2])
	

    @include("landing.modals.vk-login")
@endsection

@section('landing-nav')
    <div class="nav-left-side navbar-list">

        <div class="navbar-list-item">
            <a class="nav-link" href="/#advantages">Преимущества</a>
        </div>
        <div class="navbar-list-item">
            <a class="nav-link" href="/#program">Программа</a>
        </div>
        <div class="navbar-list-item">
            <a class="nav-link" href="/#teacher">Преподаватель</a>
        </div>
        <div class="navbar-list-item">
            <a class="nav-link" href="/#faq">FAQ</a>
        </div>
        <div class="navbar-list-item">
            
        </div>
    </div>
@endsection