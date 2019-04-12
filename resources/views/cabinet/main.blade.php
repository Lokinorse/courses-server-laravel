@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    
    <div class="row">
        <div class="col-md-12 cabinet-user-header">
            <h1>Личный кабинет</h1>
            <div class="balance-inner-wrapper">

                @if (!Auth::user()->isPromoUsed(env("CURRENT_PROMO_ID"))) 
                    <div class="giftcard" data-modaltrigger="promocode">
                        <i class="fa fa-gift"></i> Получить 20 000 на счет
                    </div>
                @endif

                <div class="balance-count">
                    <span class="balance-label">Твой баланс: </span> {{Auth::user()->balance}} рублей
                </div>
            </div>
            
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

                        <div class="cabinet-program-wrapper col-md-12">
                            <div class="cabinet-program-thumb" style="background-image: url({{url("storage/".$unit->thumb)}})"></div>
                            <div class="cabinet-program-content">
                                <h2 class="cabinet-program-title">{{$unit->name}}</h2>
                                <div class="cabinet-program-description">{!! $unit->description !!}</div>
                                <div class="cabinet-program-footer">
                                    @if (Auth::user()->isUnitPurchased($unit->id))
                                        <a href="{{$unit->slug}}" class="cabinet-program-cta">
                                            <i class="fa fa-play"></i>
                                            <div class="cabinet-program-action-text">
                                                <span>
                                                    К обучению
                                                </span>
                                            </div>
                                        </a>
                                    @else 
                                        @php
                                            $modalId = "unlock-".$unit->id;
                                        @endphp
                                        <button class="cabinet-program-cta" data-modaltrigger="{{$modalId}}">
                                                <i class="fa fa-unlock"></i>
                                            <div class="cabinet-program-action-text">
                                                <div class="cabinet-program-price">
                                                    Стоимость: {{$unit->cost}}р.
                                                </div>
                                                <span>
                                                    Разблокировать
                                                </span>
                                            </div>
                                        </button>
                                        @include("cabinet.modals.paymodal", ["unit" => $unit])
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

    </div>
</div>

@if (!Auth::user()->isPromoUsed(env("CURRENT_PROMO_ID"))) 
    @include("cabinet.modals.promocode")
@endif


@if (session()->get('message_modal'))
    @include("cabinet.modals.infomodal")
@endif

@endsection
