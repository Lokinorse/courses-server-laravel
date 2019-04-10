function openmodal(top) {
	modalStepChange(0)
	$(".lesson-payout-modal-wrapper").addClass("opened");


	$(".lesson-payout-modal").css("position", "fixed")

	$(".lesson-payout-modal").css("top", "30px")
	$(".lesson-payout-modal").css("left", "0px")

	if (window.location.search && window.location.search.indexOf("fullscreen=1") !== -1 && top) {
		$(".lesson-payout-modal").css("top", (top - 250) + "px")
	}

}

window.openmodal = openmodal;

var modalStepChange = window.modalStepChange = function (step) {
	$(".pay-step").removeClass("active");
	$(".pay-step[data-modalstep='"+step+"']").addClass('active');

	if (step == 1) {
		$("#current-plan").html(window.plans[window.selectedPlan].name)
		$("#price-number").html(window.plans[window.selectedPlan].price)
	}
}

function closemodal() {
	$(".lesson-payout-modal-wrapper").removeClass("opened");
}


$(document).on("submit", "#payment-form", function(e) {
	e.preventDefault();
	var formData = $(this).serializeArray();


	modalStep++;
	modalStepChange(modalStep);
	setTimeout(function() {
		modalStep++;
		modalStepChange(modalStep);
	}, 1500);
	window.convert("oplata");

	formData.push({
		value: window.plans[window.selectedPlan].name, 
		name:"plan"
	}, {
		value: window.location.href,
		name: "url",
	}, {
		value: window.plans[window.selectedPlan].price,
		name: "price",
	})

	$.post("/transaction", formData, function(data) {
		console.log(data);
	})
})


$(document).on("click", ".next-step", function(e) {
	e.stopPropagation();
	e.preventDefault();
	modalStep++;
	modalStepChange(modalStep);
	if (modalStep == 2) {

	}
})
$(document).on("click", ".payment-action-button-wrapper", function(e) {
	window.convert("rassilka")
})



$(document).on("click", ".lesson-payout-modal-body", function(e) {
	e.stopImmediatePropagation();
	
})




$(document).on("click", ".lesson-payout-modal-wrapper, .pay-modal-close", function(e) {
	closemodal();
})

//openmodal()