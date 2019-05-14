@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'vk-login')
    @slot('modal_max_height', '500px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Начало обучения')

    @slot('modal_content')

            <a href="{{ route('oauth', ['provider'=>'vkontakte']) }}">
                <img src="{{asset("img/vk_logo.png")}}"/>
            </a>
            Чтобы начать обучение, необходимо войти на платформу.

    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <a class="modal-actions main-button" href="{{route('login')}}">Войти</a>
            <a class="animated-button" href="{{ route('oauth', ['provider'=>'vkontakte']) }}">
                <img src="{{asset('img/vk_logo.png')}}"/>
                Войти через Вконтакте
            </a>
        </div>
    @endslot

@endcomponent

