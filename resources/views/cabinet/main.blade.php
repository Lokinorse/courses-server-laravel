@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
            <h1 class="course-name">Личный кабинет</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2>Программы</h2>
        </div>
        <div class="col-md-12">

            <div class="container cabinet-programs">
                <div class="row">
                    @foreach($units as $unit)
                        <div class="cabinet-program-wrapper col-md-4">
                            <div class="cabinet-program-thumb">
                                <img src="{{url("storage/".$unit->thumb)}}"/>
                                <span class="cabinet-program-title">{{$unit->name}}</span>
                            </div>
                            <div class="cabinet-program-footer">
                                <div class="cabinet-program-price">Стоимость: 20 000р.</div>
                                <a href="#"><i class="fa fa-unlock"></i> Разблокировать</a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

    </div>
</div>

@if (!Auth::user()->isPromoUsed(2)) 
    @include("cabinet.modals.promocode")
@endif

@endsection
