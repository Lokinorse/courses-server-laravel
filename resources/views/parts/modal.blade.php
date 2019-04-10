<template id="@yield('modal_id')">
    <div class="modal-wrapper modal-@yield('modal_id')" data-modal="@yield('modal_id')">
        <div class="modal-inner-content" style="max-height: @yield('modal-max-height'); max-width: @yield('modal-max-width'); ">
            <div class="modal-header">
                @yield('modal_header')
                <div data-modalclose="@yield('modal_id')"><i class="fa fa-times"></i></div>
            </div>
            <div class="modal-content">@yield('modal_content')</div>

            <div class="modal-footer">@yield('modal_footer')</div>
        </div>
    </div>
</template>