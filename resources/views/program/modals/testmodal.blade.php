@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'lessontest')
    @slot('modal_max_height', '300px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Тестирование знаний')

    @slot('modal_content')
        test
    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <button class="modal-actions main-button">Далее</button>
        </div>
    @endslot
@endcomponent