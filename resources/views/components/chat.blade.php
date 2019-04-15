@if ($message_type == "comment")
    @include('components.comments', compact('messages'))
@else     
    @include('components.faq', compact('messages'))
@endif

