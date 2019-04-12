@extends("parts.modal")



{{-- SETTINGS --}}
@section('modal_id', 'promocode')
@section('modal-max-height', '300px')
@section('modal-max-width', '700px')

{{-- HEADER --}}
@section('modal_header', 'Инструкция для бесплатного обучения')

@section('modal_content')

        <span>
                Чтобы получить 20 000 рублей для начала обучения, тебе нужно написать в <a target="_blank" href="https://vk.me/varilo_webdeveloper">чат моей группы</a> <b>"начать" или "я готов"</b>. 
        </span>
        <br/>
        <span>
                Тебе придет сообщение с активационной ссылкой, которая занесет 20 000 рублей тебе на счет.
        </span>

@endsection

@section('modal_footer')
    <div class="actions-group pull-left">
        <a class="modal-actions next-step" target="_blank" href="https://vk.me/varilo_webdeveloper">Открыть чат с группой</a>
    </div>
@endsection