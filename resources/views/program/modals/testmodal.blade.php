@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'lessontest')
    @slot('modal_max_height', '400px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Тестирование знаний')

    @slot('modal_content',"")



    @slot('modal_footer')
        <div class="actions-group pull-left">
        </div>
    @endslot
@endcomponent