$(document).ready(function () {

})

$('#submit').click(function(e){

var walktothec = $("#traveltime").val();
	$("#timetoleave").text(walktothec);
	e.preventDefault();

})