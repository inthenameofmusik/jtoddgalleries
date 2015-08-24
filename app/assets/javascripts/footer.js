$("#to-popup-signup").click(function() {
	$("body").addClass("no-scroll");
	$("#signup").fadeIn("fast");
})

$("#signup").click(function(e) {
	if (e.target == this) {
		removeIt();
	}
})


var removeIt = function() {
	// $("#signup").css("display", "none");
	$("#signup").fadeOut("fast");
	$("body").removeClass("no-scroll");
}