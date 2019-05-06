<div class="lesson-pane">
    <h5>Урок закрыт</h5>
    @if (Auth::user())
        <div class="lesson-pane-content">
            Не расстраивайся, ведь чтобы его открыть, тебе всего лишь нужно пройти его предшественников! 
        </div>
        <div class="lesson-pane-footer">
            <a class="main-button" href="{{$program->getResumeUrl()}}">Перейти к текущему уроку</a>
        </div>
    @else 
        <div class="lesson-pane-content">
            Для начала стоит авторизоваться на платформе. Только так я смогу определить, открыт ли конкретно тебе этот урок.
        </div>
        <div class="lesson-pane-footer">
            <a href="{{route('login')}}" class="main-button">Войти</a>
            <a class="animated-button" href="{{ route('oauth', ['provider'=>'vkontakte']) }}">
                <img src="{{asset('img/vk_logo.png')}}"/>
                Войти с помощью Вконтакте
            </a>
        </div>
    @endif

</div>