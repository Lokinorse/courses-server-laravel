@extends('layouts.landing')

@section('content')
	@include("jslp.matrix")
	@include("jslp.advantages")
	@include("jslp.program")
	@include("jslp.starter", ["position" => 0])
	@include("jslp.resume")
	@include("jslp.costs")
	@include("jslp.teacher")
	@include("jslp.starter", ["position" => 1])
	@include("jslp.faq")
	@include("jslp.starter", ["position" => 2])
	@include("jslp.footer")

	@include("parts.paymodal")

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