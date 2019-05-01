@extends('layouts.app')

@section('content')
<div class="container cabinet-room">
    
    <div class="row">
        <div class="col-md-12 cabinet-user-header">
            <h1>Факир...</h1>            
        </div>
    </div>

    <form method="POST" action="{{url('/admin/fakier/get_messages')}}">
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
        <button type="submit" class="main-button">Парсить</button>
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
