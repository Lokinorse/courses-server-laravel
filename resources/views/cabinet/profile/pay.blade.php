

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
                @include("cabinet.profile.menu", ["current_profile_area" => "pay"])
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Пополнение</h2>
            <form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml" target="_blank">    
                <input type="hidden" name="receiver" value="410015198324774">    
                <input type="hidden" name="formcomment" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="short-dest" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="label" value="$order_id">    
                <input type="hidden" name="quickpay-form" value="donate">    
                <input type="hidden" name="targets" value="транзакция {order_id}">    
                <input type="hidden" name="sum" value="4568.25" data-type="number">    
                <input type="hidden" name="comment" value="Добровольное пожертвование на развитие проекта">    
                <input type="hidden" name="need-fio" value="true">    
                <input type="hidden" name="need-email" value="true">    
                <input type="hidden" name="need-phone" value="false">    
                <input type="hidden" name="need-address" value="false">    
                <label><input type="radio" name="paymentType" value="PC">Яндекс.Деньгами</label>   
                <label><input type="radio" name="paymentType" value="AC">Банковской картой</label>
                <input type="submit" value="Перевести">
            </form>
            
        </div>
    </div>
</div>



@endsection


