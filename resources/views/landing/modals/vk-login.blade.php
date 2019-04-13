@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'vk-login')
    @slot('modal_max_height', '300px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Начало обучения')

    @slot('modal_content')

            <a class="main-button" href="{{url('auth/vkontakte')}}">
                <img src="{{asset("img/vk_logo.png")}}"/>
            </a>
            Чтобы начать обучение, необходимо войти на платформу с помощью вконтакте.

    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <a class="modal-actions main-button" href="{{url('auth/vkontakte')}}">Войти с помощью Вконтакте</a>
        </div>
    @endslot

@endcomponent

