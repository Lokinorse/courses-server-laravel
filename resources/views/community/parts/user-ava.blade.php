
@php 
    $avatar = $user->getFallbackAva();
@endphp
<div class="message-heading-ava" data-userid="{{$user->id}}">
    <img src="{{$avatar}}"/>
</div>