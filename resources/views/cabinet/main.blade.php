@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    
    <div class="row">
        <div class="col-md-12 cabinet-user-header">
            <h1>Личный кабинет</h1>
            <div class="balance-inner-wrapper">


                <a class="giftcard" href="{{route('cabinet_pay')}}" data-conversion="oplata">
                    <i class="fa fa-ruble-sign"></i> Пополнить
                </a>
                <div class="balance-count">
                    <span class="balance-label">Твой баланс: </span> {{Auth::user()->balance}} рублей
                </div>
                <div class="balance-count">
                    <a href="{{route('cabinet_settings')}}" class="main-button"><i class="fa fa-cog"></i> Мои настройки</a>
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

<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
            <h2>Вопросы</h2>
        </div>
    </div>
</div>

@include('community.questions-preview', ["messages" => $messages, "title" => "Вопросы по программе"])

{{-- @include("cabinet.modals.make-payment") --}}

@if (session()->get('message_modal'))
    @include("cabinet.modals.infomodal")
@endif

@endsection
