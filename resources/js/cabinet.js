
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
require('./components/fakeModal');



$(document).on("click", ".nav-chapter-list .nav-link", function(e) {
	e.preventDefault();
	e.stopPropagation();
	

	$(".nav-chapter-list .nav-link").removeClass("active");
	$(this).addClass("active");

	var paneId = $(this).data("paneid");

	$(".lesson-wrapper .tab-pane").removeClass("active");
	$("#"+paneId).addClass("active");


})

