var $somethingSelected = false;
var elementContent;

$(".a-result").click(function(e) {
	
	var $original = $(this);

	var $currentScroll;
	var $reverseDirection = false;

	// if ($somethingSelected == true) {
	// 	$("div.returned-show").remove();
	// }
	$currentScroll = $(document).scrollTop();

	if ($somethingSelected == true){
		if ($original.hasClass("selected")) {
			$original.removeClass("selected");
			$("div.returned-show").remove();
			return;
		} else {
			$(".selected").trigger("click");
		}
	}

	var $thisOffset = $original.offset().top;

	var $next1, $next2, $next3, $next4
	var $next1 = $(this).next();
	if ($original.hasClass("last-one")) {
		$reverseDirection = true;
		$rowBeginner = $original;
		$(window).scrollTop(+350);
	} else if ($original.hasClass("only-one")) {
		$rowBeginner = $original;
	} else if ($original.attr("id") == "0") {
		$rowBeginner = $original;
	} else {
		if ($next1.length !== 0) {
			if ($next1.offset().top !== $thisOffset) {
				$rowBeginner = $next1;
			} else {
				functionTwo();
			}
		} else {
			$rowBeginner = $original.prev().prev().prev();
		}
	}

	function functionTwo() {
		$next2 = $next1.next();
		if ($next2.length !== 0) {
			if ($next2.offset().top !== $next1.offset().top) {
				$rowBeginner = $next2;
			} else {
				functionThree();
			}
		} else {
			$rowBeginner = $original.prev().prev();
		}
	}

	function functionThree() {
		$next3 = $next2.next();
		if ($next3.length !== 0) {
			if ($next3.offset().top !== $next2.offset().top) {
				$rowBeginner = $next3;
			} else {
				functionFour();
			}
		} else {
			$rowBeginner = $original.prev();
		}
	}

	function functionFour() {
		$next4 = $next3.next();
		if ($next4.length !== 0) {
			if ($next4.offset().top !== $next3.offset().top) {
				$rowBeginner = $next4;
			}
		} else {
			$rowBeginner = $original;
		}

	}

	$somethingSelected = true;
	$original.addClass("selected");

	var $artwork_id = $($original).find(".hidden_id").text();
	// console.log($artwork_id);

	var url = window.location.href;
	var arr = url.split("/");
	var result = arr[0] + "//" + arr[2]

	$.post(result + "/fineart/show", {id: $artwork_id})
		.done(function(data){
			if ($reverseDirection == false) {
				$rowBeginner.before(data);
			} else {
				$rowBeginner.after(data);
			}
		});
	$(document).scrollTop($currentScroll);
});



