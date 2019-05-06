@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'makepayment')
    @slot('modal_max_height', '500px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Пополнение баланса')

    @slot('modal_content')





        <span>Для получения инструкций по пополнению баланса напиши в <a href="https://vk.me/varilo_webdeveloper" data-conversion="to-messages-for-pay" target="_blank">сообщения группы</a> "пополнение баланса"!
        </span>
    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <a class="modal-actions main-button" href="https://vk.me/varilo_webdeveloper" target="_blank" data-conversion="to-messages-for-pay">Получить инструкцию</a>
        </div>
    @endslot
@endcomponent