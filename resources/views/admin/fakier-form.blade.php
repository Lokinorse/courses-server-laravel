@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    
    <div class="row">
        <div class="col-md-12 cabinet-user-header">
            <h1>Факир...</h1>            
        </div>
    </div>

    <form method="POST" action="{{url('/admin/fakier/save_and_run')}}">
        @csrf  
        <label class="input-group"> 
            Bearer: <br/>
        </label>
        <input name="bearer" class="form-control" value="{{$settings->bearer}}"/>
        <label class="input-group"> 
                Страница: <br/>
        </label>
        <input name="page" class="form-control" value="{{$settings->page}}"/>    
        <label class="input-group"> 
                Ордеринг: <br/>
        </label>
        <input name="order" class="form-control" value="{{$settings->order}}"/>    
        <label class="input-group"> 
                Количество результата: <br/>
        </label>
        <input name="page_size" class="form-control" value="{{$settings->page_size}}"/>    
        <button type="submit" class="main-button">Сохранить</button>
    </form>   

    <a href="{{url('/admin/fakier/get_messages/null')}}" target="_blank" class="main-button">Парсить!</a>
    <hr/>

    <form method="POST" action="{{url('/admin/fakier/save_parse_users')}}">
        @csrf  
        <label class="input-group"> 
            token: <br/>
        </label>
        <input name="token" class="form-control" value="{{$parse_users_settings->token}}"/>
        <label class="input-group"> 
            vk group id: <br/>
        </label>
        <input name="vk_group_id" class="form-control" value="{{$parse_users_settings->vk_group_id}}"/>    
        <label class="input-group"> 
            fields: <br/>
        </label>
        <input name="fields" class="form-control" value="{{$parse_users_settings->fields}}"/>    
        <label class="input-group"> 
            offset: <br/>
        </label>
        <input name="offset" class="form-control" value="{{$parse_users_settings->offset}}"/>    
        <button type="submit" class="main-button">Сохранить</button>
    </form>   

    <a href="{{url('/admin/fakier/parse_users')}}" target="_blank" class="main-button">Грабить юзеров!</a>
    <a href="{{url('/admin/fakier/change_users')}}" target="_blank" class="main-button">Изменить юзеров!</a>
    <hr/>    <hr/>
    <form method="POST" action="{{url('/admin/fakier/offset_date')}}">
        @csrf  
        <label class="input-group"> 
            offset in days: <br/>
        </label>
        <input name="offset" class="form-control" value="100"/>
        <button type="submit" class="main-button">Сместить</button>
    </form>   


</div>

{{-- @if (!Auth::user()->isPromoUsed(env("CURRENT_PROMO_ID"))) 
    @include("cabinet.modals.promocode")
@endif --}}

@include("cabinet.modals.make-payment")

@if (session()->get('message_modal'))
    @include("cabinet.modals.infomodal")
@endif

@endsection
