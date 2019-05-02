@if (Auth::user() && Auth::user()->hasRole("admin") && trim($slot) != "")
    <div class="admin-only">
        {{$slot}}
    </div>
@endif