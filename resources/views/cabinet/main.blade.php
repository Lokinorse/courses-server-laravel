@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    
    <div class="row">
        <div class="col-md-12 cabinet-user-header">
            <h1>Личный кабинет</h1>
            <div class="balance-inner-wrapper">

{{--                 @if (!Auth::user()->isPromoUsed(env("CURRENT_PROMO_ID"))) 
                    <div class="giftcard" data-modaltrigger="promocode">
                        <i class="fa fa-gift"></i> Получить 20 000 на счет
                    </div>
                @endif --}}
                <div class="giftcard" data-modaltrigger="makepayment" data-conversion="oplata">
                    <i class="fa fa-ruble-sign"></i> Пополнить
                </div>
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
                    @foreach($programs as $program)
                        @include('cabinet.render-program', compact('program'))
                    @endforeach
                </div>
            </div>
        </div>

    </div>
</div>

{{-- @if (!Auth::user()->isPromoUsed(env("CURRENT_PROMO_ID"))) 
    @include("cabinet.modals.promocode")
@endif --}}

@include("cabinet.modals.make-payment")

@if (session()->get('message_modal'))
    @include("cabinet.modals.infomodal")
@endif

@endsection
