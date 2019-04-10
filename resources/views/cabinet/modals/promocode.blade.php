@extends("parts.modal")



{{-- SETTINGS --}}
@section('modal_id', 'promocode')
@section('modal-max-height', '300px')
@section('modal-max-width', '700px')

{{-- HEADER --}}
@section('modal_header', 'Инструкция по пополнению баланса')

@section('modal_content')

        Чтобы получить 20 000 рублей для начала обучения, тебе необходимо написать в сообщения группы любую фразу, например "начать".
        <br/>
        После этого ты сразу получишь промокод, который нужно ввести в поле ниже.

        <br/>
        Ввести промо:
        <input type="text"/>
        <button>Подтвердить</button>

@endsection