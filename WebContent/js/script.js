$(document).ready(function(){
	
	alert("hi");
	alert(localStorage.indicatorNumber);
	//localStorage.clear();
	//alert(localStorage.indicatorNumber);
	if(localStorage.indicatorNumber){	
		$("#indicator").text(localStorage.indicatorNumber);
	}else{
		localStorage.indicatorNumber = 0;
	}
	
	$('[data-toggle="tooltip"]').tooltip();

  $(".slide-img").mouseenter(function(){
		$('.carousel').carousel('pause');

  });
	
  $(".slide-img").mouseleave(function(){ 
		$('.carousel').carousel('cycle');

    });
		
	$(".search-candidate").on("click", function() {
		var activeItem = $("#search-criteria").text();
		$("#search-criteria").html($(this).text() + "<span class='caret'></span>");
		$(this).text(activeItem);
	});
	
	var score = $(".star");
	for(var i = 0; i < score.length; i++){
		var result = Math.round(score.next()[i].innerHTML / 2);
		var star = "&#x2605";
		var starResult = "";
		for(var j = 0; j < result; j++){
			starResult += star;
		}
		score[i].innerHTML = starResult;
	}
	
	$(".buy-button").on("click", function(){
		$(this).css({"background-color":"rgba(109,192,102,0.7)"});
		$(this).text("Done!");
		localStorage.indicatorNumber++;
		$("#indicator").text(localStorage.indicatorNumber);
	});
	
	$(".remove-button").on("click", function(){
		$(this).css({"background-color":"rgba(255,68,68,0.7)"});
		$(this).text("Done!");
		localStorage.indicatorNumber--;
		$("#indicator").text(localStorage.indicatorNumber);
		$(this).parentsUntil("li").parent().remove();
	});
	
	/*
	var gridster;

  $(function(){

		gridster = $(".gridster ul").gridster({
			widget_base_dimensions: [100, 100],
			widget_margins: [5, 5],

			}).data('gridster');
	});
	*/
	
	/*$("#search-button").on("click", function(){
		alert($("#search-bar").val());
		$.post("querybook.html",
			{
				isbn: $("#search-bar").val()
			},
			function(data, status){
			   alert("Data: " + data + "\nStatus: " + status);
			}
		);
	});*/
	
	
	
});
