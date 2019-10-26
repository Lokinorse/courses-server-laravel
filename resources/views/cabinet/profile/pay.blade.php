@extends('layouts.landing')

@section('content')
	@include("landing.tarifs") 
@endsection


{{-- 

@extends('layouts.app')


@section('content')


<div class="container cabinet-room">
    @include('cabinet.profile.header')
    <div class="row program-content-wrapper justify-content-center">


        <div class="col-md-4">
            <div class="program-menu">
                @include("cabinet.profile.menu", ["current_profile_area" => "pay"])
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Пополнение</h2>
            <form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml" target="_blank">    

                <input type="hidden" name="receiver" value="410015198324774">    
                <input type="hidden" name="formcomment" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="short-dest" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="label" value="{{$current_transaction->id}}">    
                <input type="hidden" name="quickpay-form" value="donate">    
                <input type="hidden" name="targets" value="Транзакция {{Auth::user()->id}}/{{$current_transaction->id}}">    
                <label>
                    Укажите сумму перевода
                    <br/>
                    <input type="number" class="main-input" name="sum" min="5" max="15000" required value="845"  data-type="number"/>     
                    рублей
                </label>
                <br/>
                <br/>
                <input type="hidden" name="comment" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="need-fio" value="true">    
                <input type="hidden" name="need-email" value="true">    
                <input type="hidden" name="need-phone" value="true">    
                <input type="hidden" name="need-address" value="false">    

                <button type="submit" class="payment-button" name="paymentType" value="PC">
                    <img src="{{asset("img/payment_methods/yandex_money.png")}}"/>
                </button>
                <button type="submit" class="payment-button" name="paymentType" value="AC">
                    <img src="{{asset("img/payment_methods/cards.png")}}"/>
                </button>

            </form>
        </div>
    </div>
</div>



@endsection


 --}}