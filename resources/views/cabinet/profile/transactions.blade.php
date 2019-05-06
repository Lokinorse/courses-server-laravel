

@extends('layouts.app')


@section('content')


<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
            <h1 class="program-name">Мой профиль</h1>
        </div>
    </div>
    <div class="row program-content-wrapper justify-content-center">


        <div class="col-md-4">
            <div class="program-section-header">Меню</div>
            <div class="program-menu">
                @include("cabinet.profile.menu", ["current_profile_area" => "transactions"])
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Транзакции</h2>
            
            
        </div>
    </div>
</div>



@endsection


