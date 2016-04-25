$(document).ready(function () {

})

var cards = [
	{
		cardcontent: ['cat','feline', 'kitty', 'meow','pussy']
	},
	{
		cardcontent: ['dog','canine', 'puppy', 'woof','poochface']
	},
	{
		cardcontent: ['car','auto', 'automobile', 'drive','vroom']
	},
	{ cardcontent: ['house','bedroom','roof','door ','windows' ]},
{ cardcontent: ['brooklyn','hipsters','brownstone','spike lee','g train' ]},
{ cardcontent: ['peanut butter','skippy','jif','chunky','smooth' ]},
{ cardcontent: ['friends','ross','monica','rachel','chandler' ]},
]

$('#right, #left, #down,#next').click(function () {

	var randomNum = Math.floor(Math.random() * cards.length)
	var randomCard = cards[randomNum]

$('#mainword').html(randomCard.cardcontent[0])
$('#taboo1').html(randomCard.cardcontent[1])
$('#taboo2').html(randomCard.cardcontent[2])
$('#taboo3').html(randomCard.cardcontent[3])
$('#taboo4').html(randomCard.cardcontent[4])

})





var score=0;

$('#down').click(function(){
//	alert('pass')
});

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
	$('#left,#right,#down').css('display','block')}


function showtime (){

		totalTime=parseInt(totalTime)
		if(totalTime>=1)
		{totalTime-=1
		$('#timeleft').html(totalTime)}
		else {$('#timeleft').html("time's up!");
			$('#right,#left,#down').css('display','none')}
	 }	
