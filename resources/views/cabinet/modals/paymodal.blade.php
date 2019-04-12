@extends("parts.modal")



{{-- SETTINGS --}}
@section('modal_id', 'unlock-'.$unit->id)
@section('modal-max-height', '300px')
@section('modal-max-width', '700px')

{{-- HEADER --}}
@section('modal_header', 'Подтверждение разблокировки')

@section('modal_content')
        <span>
            Я рад, что ты всерьез решил подойти к делу! 
            <br/>
            После подтверждения твоего счета в <b>платформе</b> спишется <b>{{$unit->cost}}</b> рублей.
        </span>
@endsection

@section('modal_footer')
    <div class="actions-group pull-left">
        <a class="modal-actions next-step" href="{{url('/purchase/'.$unit->id)}}">Подтвердить и разблокировать</a>
    </div>
@endsection