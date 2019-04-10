@extends("parts.modal")



{{-- SETTINGS --}}
@section('modal_id', 'vk-login')
@section('modal-max-height', '300px')
@section('modal-max-width', '700px')

{{-- HEADER --}}
@section('modal_header', 'Начало обучения')

@section('modal_content')

        <a class="next-step" href="{{url('auth/vkontakte')}}">
            <img src="{{asset("img/vk_logo.png")}}"/>
        </a>
        Чтобы начать обучение, необходимо войти на платформу с помощью вконтакте.

@endsection

@section('modal_footer')
    <div class="actions-group pull-left">
        <a class="modal-actions next-step" href="{{url('auth/vkontakte')}}">Войти с помощью Вконтакте</a>
    </div>
@endsection