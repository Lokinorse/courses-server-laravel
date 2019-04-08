@extends('layouts.vklanding')

@section('content')
	@include("introweb.matrix")
	@include("introweb.advantages")
	@include("introweb.program")
	@include("introweb.starter", ["position" => 0])
	@include("introweb.teacher")
	@include("introweb.starter", ["position" => 1])
	@include("introweb.footer")
	@include("introweb.thankyou")
@endsection

