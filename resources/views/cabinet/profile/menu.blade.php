<div class="unit-block">
    <a class="unit {{($current_profile_area == "pay") ? "active" : ""}}" href="{{route('cabinet_pay')}}">
        <div class="lesson-title">
            <span>
                <span class="lesson-icon fa fa-money-bill-wave" aria-hidden="true"></span> Пополнение
            </span>
        </div>
    </a>
    <a class="unit {{($current_profile_area == "transactions") ? "active" : ""}}" href="{{route('cabinet_transactions')}}">
        <div class="lesson-title">
            <span>
                <span class="lesson-icon fa fa-search-dollar" aria-hidden="true"></span> История операций
            </span>
        </div>
    </a>
    <a class="unit {{($current_profile_area == "settings") ? "active" : ""}}" href="{{route('cabinet_settings')}}">
        <div class="lesson-title">
            <span>
                <span class="lesson-icon fa fa-cog" aria-hidden="true"></span> Настройки
            </span>
        </div>
    </a>
</div>