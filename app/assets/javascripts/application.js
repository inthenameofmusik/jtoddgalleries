// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .

$(function(){
	if (!Array.prototype.indexOf) {
		Array.prototype.indexOf = function(searchElement, fromIndex) {

	    var k;

	    // 1. Let O be the result of calling ToObject passing
	    //    the this value as the argument.
	    if (this == null) {
	      throw new TypeError('"this" is null or not defined');
	    }

	    var O = Object(this);

	    // 2. Let lenValue be the result of calling the Get
	    //    internal method of O with the argument "length".
	    // 3. Let len be ToUint32(lenValue).
	    var len = O.length >>> 0;

	    // 4. If len is 0, return -1.
	    if (len === 0) {
	      return -1;
	    }

	    // 5. If argument fromIndex was passed let n be
	    //    ToInteger(fromIndex); else let n be 0.
	    var n = +fromIndex || 0;

	    if (Math.abs(n) === Infinity) {
	      n = 0;
	    }

	    // 6. If n >= len, return -1.
	    if (n >= len) {
	      return -1;
	    }

	    // 7. If n >= 0, then Let k be n.
	    // 8. Else, n<0, Let k be len - abs(n).
	    //    If k is less than 0, then let k be 0.
	    k = Math.max(n >= 0 ? n : len - Math.abs(n), 0);

	    // 9. Repeat, while k < len
	    while (k < len) {
	      // a. Let Pk be ToString(k).
	      //   This is implicit for LHS operands of the in operator
	      // b. Let kPresent be the result of calling the
	      //    HasProperty internal method of O with argument Pk.
	      //   This step can be combined with c
	      // c. If kPresent is true, then
	      //    i.  Let elementK be the result of calling the Get
	      //        internal method of O with the argument ToString(k).
	      //   ii.  Let same be the result of applying the
	      //        Strict Equality Comparison Algorithm to
	      //        searchElement and elementK.
	      //  iii.  If same is true, return k.
	      if (k in O && O[k] === searchElement) {
	        return k;
	      }
	      k++;
	    }
	    return -1;
	  };
	}


	$(".info-1").hover(
		function() {
			$(".info-1").removeClass("non-hovered").addClass("hovered");
		}, function() {
			$(".info-1").removeClass("hovered").addClass("non-hovered");
		}
	);
	$(".info-2").hover(
		function() {
			$(".info-2").removeClass("non-hovered").addClass("hovered");
		}, function() {
			$(".info-2").removeClass("hovered").addClass("non-hovered");
		}
	);
	$(".info-3").hover(
		function() {
			$(".info-3").removeClass("non-hovered").addClass("hovered");
		}, function() {
			$(".info-3").removeClass("hovered").addClass("non-hovered");
		}
	);

	$("#to-now-showing").hover(
		function() {
			$("#now-playing-panel-bg").css("opacity", 0.4);
		}, function() {
			$("#now-playing-panel-bg").css("opacity", 1);
		}
	);

	$("#sub-heading-panel .clickable-overlay").hover(
		function() {
			var color_div = $(this).parent().closest("div").children(".color-sub-heading");
			$(color_div).css("display", "block");
			// $($parent + ".color-sub-heading").css("display", "block");
		}, function() {
			var color_div = $(this).parent().closest("div").children(".color-sub-heading");
			$(color_div).css("display", "none");
		}
	);

	$(".nav-item").click(function(e){
		var $tolink = $(this).attr("href");

		if (e.altKey) {
			e.preventDefault();
			window.location.href = $tolink + "/admin";
		}

	});


	function myLiveEventHandler(e) {
		var handle = false;
		if(e.handled !== true) {
			console.log("submitting");
			e.handled = true;
			handle = true;
		} 
		return false; 
	}

	$("#popup-panel").submit(function(event) {
		myLiveEventHandler(event);

	});

	$("*").keydown(function(e){
		var url = window.location.href;
		var arr = url.split("/");
		var result = arr[0] + "//" + arr[2];
		
		if (e.keyCode == 65 && e.altKey && e.ctrlKey) {
			console.log("ya");
			$.post(result + "/artists/popup")
				.done(function(data) {
				$("#popup-panel").html(data);
			});
		}
	});

	$(".a-article").click(function() {
		var $articleId = $(this).attr("id");
		console.log($articleId);

		var url = window.location.href;
		var arr = url.split("/");
		var result = arr[0] + "//" + arr[2]

		$.post(result + "/article/show", {id: $articleId})
			.done(function(data){
				$("#shown-article").html(data);
			})
	});

	// $("*").unbind("ajax:success").bind("ajax:success", function() {
	// 	if ($(this).hasClass("artist")) {
	// 		$.ajax({
	// 			url: <%= artists_path(:json) %>,
	// 			type: 'GET',
	// 			success: function (data) {
	// 				console.log(data);
	// 			}
	// 		})
	// 	}
	// 	console.log($(this));
	// 	$(".attribute-popup").remove();
	// });

	var feature_image = $("#the-picture").attr("value");
	$("#full-feature").css("background-image", feature_image);

	$(".picture-show").magnificPopup({
		delegate: 'a',
		type: 'image'
	});
	$(".click-to-popup").magnificPopup({
		type: 'image'
	});
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
 		$("#info-icon-phone").attr("href", "tel:781-237-3434")
	}

});




// $(function() {        
//     $('.info-1').hover(function(){ //Open on hover 
//         alert("yep")
//     },    
//     function(){ //Close when not hovered
//         // $('#pull_down_content').animate({'top':'-340px'},1000);    
//     });
// });