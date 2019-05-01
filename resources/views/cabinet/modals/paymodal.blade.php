@component('components.modal')
    {{-- SETTINGS --}}
    @slot('modal_id', 'unlock-'.$plan->id)
    @slot('modal_max_height', '900px')
    @slot('modal_max_width', '700px')

    {{-- HEADER --}}
    @slot('modal_header', 'Тариф: '.$plan->name)

    @slot('modal_content')
            <span>
                Я рад, что ты всерьез решил подойти к делу! 
                <br/>
                <br/>
                <h4>После разблокировки ты получишь:</h4>
                {!!$plan->description!!}
                
                
                <br/>
                @if ($plan->discount)
                    В рамках акции, на данный момент по этому тарифу предусмотрена <b>{{$plan->discount}}%</b> скидка. 
                    <br/>
                    Вместо <b>{{$plan->cost_string}}р.</b> у тебя в платформе спишется <b>{{$plan->discounted_cost_string}}</b>р.
                @else 
                    После подтверждения, с твоего счета в <b>платформе</b> спишется <b>{{$plan->discounted_cost_string}}</b>р.
                @endif
                
            </span>
    @endslot

    @slot('modal_footer')
        <div class="actions-group pull-left">
            <a class="modal-actions main-button" href="{{url('/purchase/plan/'.$plan->id)}}">Разблокировать за {{$plan->discounted_cost_string}}р.</a>
        </div>
    @endslot
@endcomponent