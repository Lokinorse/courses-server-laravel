@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'unlock-'.$unit->id)
    @slot('modal_max_height', '300px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Подтверждение разблокировки')

    @slot('modal_content')
            <span>
                Я рад, что ты всерьез решил подойти к делу! 
                <br/>
                После подтверждения, с твоего счета в <b>платформе</b> спишется <b>{{$unit->cost}}</b> рублей.
            </span>
    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <a class="modal-actions main-button" href="{{url('/purchase/'.$unit->id)}}">Подтвердить и разблокировать</a>
        </div>
    @endslot
@endcomponent