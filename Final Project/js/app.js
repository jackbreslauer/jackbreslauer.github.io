$(document).ready(function () {

})

var score=0;

$('#down').click(function(){
	alert('pass')});

$('#left').click(function(){
	score=score-1;
	$('#score').html(score);
});

$('#right').click(function(){
	score=score+1;
	$('#score').html(score);
});

$('#next').click(countdown)

var timer;
var totalTime =$('#timeleft').html()


function countdown(){
	timer=setInterval(showtime, 1000)
}

function showtime (){

		totalTime=parseInt(totalTime)
		if(totalTime>=1)
		{totalTime-=1
		$('#timeleft').html(totalTime)}
		else $('#timeleft').html("time's up!")
	 }	
