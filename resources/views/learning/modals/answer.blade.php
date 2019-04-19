@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'answermodal')
    @slot('modal_max_height', '400px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Ответ на сообщение')

    @slot('modal_content')
        <textarea class="answer-area"></textarea>
    @endslot
    @slot('modal_footer')
        <div class="actions-group pull-left">
            <button class="main-button">Ответить</button>
        </div>
    @endslot
@endcomponent