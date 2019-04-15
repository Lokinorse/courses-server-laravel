function initTabs(selector) {
    

    $(document).on("click", selector+" .tab-pill",  function() {
        $(this).parent().find('.tab-pill').removeClass("active");
        $(this).addClass("active");

        var currentTabId = $(this).prop('id')

        $(selector+ " .tab-content").removeClass("active");
        $(selector+ ` .tab-content[data-tabtarget='${currentTabId}']`).addClass('active')
    })
}



module.exports = {initTabs}