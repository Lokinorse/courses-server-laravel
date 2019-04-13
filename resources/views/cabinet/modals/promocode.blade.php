@component('components.modal')
        {{-- SETTINGS --}}
        @slot('modal_id', 'promocode')
        @slot('modal_max_height', '300px')
        @slot('modal_max_width', '700px')

        {{-- HEADER --}}
        @slot('modal_header', 'Инструкция для бесплатного обучения')

        @slot('modal_content')

                <span>
                        Чтобы получить 20 000 рублей для начала обучения, тебе нужно написать в <a target="_blank" href="https://vk.me/varilo_webdeveloper">чат моей группы</a> <b>"начать" или "я готов"</b>. 
                </span>
                <br/>
                <span>
                        Тебе придет сообщение с активационной ссылкой, которая занесет 20 000 рублей тебе на счет.
                </span>

        @endslot

        @slot('modal_footer')
        <div class="actions-group pull-left">
                <a class="modal-actions main-button" target="_blank" href="https://vk.me/varilo_webdeveloper">Открыть чат с группой</a>
        </div>
        @endslot
@endcomponent

