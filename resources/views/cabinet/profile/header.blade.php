<div class="row">
    <div class="col-md-12 cabinet-user-header">
        <h1>Мой профиль</h1>
        <div class="balance-inner-wrapper">
            <a class="giftcard" href="{{route('cabinet_pay')}}" data-conversion="oplata">
                <i class="fa fa-ruble-sign"></i> Пополнить
            </a>
            <div class="balance-count">
                <span class="balance-label">Твой баланс: </span> {{Auth::user()->balance}} рублей
            </div>
            <div class="balance-count">
                <a href="{{route('cabinet')}}" class="main-button"><i class="fa fa-cog"></i> В кабинет</a>
            </div>
        </div>
    </div>
</div>