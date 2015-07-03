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
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .
$(function(){
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

});




// $(function() {        
//     $('.info-1').hover(function(){ //Open on hover 
//         alert("yep")
//     },    
//     function(){ //Close when not hovered
//         // $('#pull_down_content').animate({'top':'-340px'},1000);    
//     });
// });