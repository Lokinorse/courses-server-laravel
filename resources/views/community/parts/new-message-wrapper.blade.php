@if (!Auth::user()) 
<div class="new-question-wrapper">
    <i>Для того, чтобы вопрос, необходимо авторизоваться в платформе</i>
    <a href="{{route('login')}}" class="main-button">Войти</a>
    <a class="animated-button" href="{{ route('oauth', ['provider'=>'vkontakte']) }}">
        <img src="{{asset('img/vk_logo.png')}}"/>
        Войти с помощью Вконтакте
    </a>
</div>
@else 
@if (Auth::user()->hasCommunityAccess()) 
    <div class="new-question-wrapper">

        @include('community.parts.message-form', $message)

    </div>
@else 
    <div class="new-question-wrapper">
        <i>Ты не можешь задать вопрос, так как у тебя нету доступа к сообществу. Необходимо оплатить любой тариф для получения этой возможности</i>
        <a href="{{route('cabinet_pay')}}" target="_blank" data-conversion="oplata" class="main-button">Оплатить</a>
    </div>
@endif
@endif 