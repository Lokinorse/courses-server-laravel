function openmodal(name) {
	var html = $("#" + name).html();
	$("body").append(html)
}

function closemodal(name) {
	$("[data-modal='" + name + "']").remove();
}

function Modal({ name, onOpen, onBeforeOpen, onClose }) {
	this.name = name;
	this.onOpen = onOpen
	this.onBeforeOpen = onBeforeOpen
	this.onClose = onClose
	var modal = this 

	this.opened = false;

	this.open = function() {
		if (modal.onBeforeOpen) {
			if (!modal.onBeforeOpen(modal)) return;
		}
		openmodal(name)
		modal.opened = true;
		modal.dom = $("[data-modal='" + name + "']")[0];
		if (modal.onOpen) modal.onOpen(modal)
	}
	this.close = function () {
		closemodal(name)
		if (modal.onClose) modal.onClose(modal)
	}

	this.processing = function() {
		if (!modal.dom) return 
		$(modal.dom).find('.modal-content').html("Загрузка...")
	}


}


function initModal(params) {
	//Init open triggers

	var modal = new Modal(params);
	var name = params.name

	$(document).on("click", "[data-modaltrigger='"+name+"']", function() {
		modal.open();
	})

	//Close by times symbol
	$(document).on("click", "[data-modalclose='" + name + "']", function () {
		modal.close();
	})
	//Cancel propagation to wrapper
	$(document).on("mouseup", "[data-modal='" + name + "'] .modal-inner-content", function (event) {
		event.stopImmediatePropagation();
	})
	//Close by 
	$(document).on("mouseup", "[data-modal='" + name + "']", function () {
		modal.close();
	})
	return modal;

}

module.exports = {
	initModal: initModal
}