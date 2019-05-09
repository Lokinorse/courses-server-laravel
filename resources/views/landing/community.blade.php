<section class="lp-section white padded" id="community">
    <div class="lp-content">

        <h1 class="lp-h1">НАШЕ <span>СООБЩЕСТВО</span></h1>
        <div class="landing-comminity_wrapper">
            @include('community.questions-preview', [
                "messages" => $messages, 
                "title" => "Вопросы по программе", 
                "hide_search" => false, 
                "ajax" => true
            ])
        </div>

    </div>
</section>
<section class="lp-section starter-section">
    <div class="lp-content">
    <a class="lp-cta-button" href="{{route("community")}}" target="_blank" data-conversion="preview-community"><i style="font-weight:bolder;" class="fa fa-users"></i> СМОТРЕТЬ СООБЩЕСТВО</a>
    </div>
</section>