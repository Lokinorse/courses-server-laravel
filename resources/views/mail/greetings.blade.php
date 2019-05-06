@component('mail::message')
# Я рад, что ты теперь с нами!

Я, Антон Платонов, основатель Varilo, приветствую тебя! Надеюсь тебе очень понравится совершенствоваться вместе со мной.

@component('mail::button', ['url' => env("APP_URL")])
Перейти к Varilo
@endcomponent

С уважением,<br>
{{ config('app.name') }}
@endcomponent
