@component('mail::message')
{{-- Greeting --}}
@if (! empty($greeting))
# {{ $greeting }}
@else
@if ($level === 'error')
# @lang('Упс!')
@else
# @lang('Привет!')
@endif
@endif

{{-- Intro Lines --}}
Пожалуйста, нажми на кнопку ниже, чтоб подтвердить этот электронный адрес.


{{-- Action Button --}}
@isset($actionText)
<?php
    switch ($level) {
        case 'success':
        case 'error':
            $color = $level;
            break;
        default:
            $color = 'primary';
    }
?>
@component('mail::button', ['url' => $actionUrl, 'color' => $color])
Подтвердить аккаунт
@endcomponent
@endisset

Если ты не регистрировал аккаунт на {{ config('app.name') }}, никаких действий не требуется!

{{-- Salutation --}}
@if (! empty($salutation))
{{ $salutation }}
@else
@lang('С уважением'),<br>{{ config('app.name') }}
@endif

{{-- Subcopy --}}
@isset($actionText)
@slot('subcopy')
@lang(
    "Если не работает кнопка, скопируйте и вставьте эту ссылку прямо в браузер: [:actionURL](:actionURL)",
    [
        'actionText' => $actionText,
        'actionURL' => $actionUrl,
    ]
)
@endslot
@endisset
@endcomponent
