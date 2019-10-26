<section class="lp-section white padded" id="community">
    <div class="lp-content">

        <h1 class="lp-h1">НАШЕ <span>СООБЩЕСТВО</span></h1>
        <div class="landing-comminity_wrapper">
            @include('community.questions-preview', [
                "hide_title" => true,
                "messages" => $messages, 
                "title" => "Вопросы по программе", 
                "hide_search" => false, 
                "ajax" => true
            ])
        </div>

    </div>
</section>