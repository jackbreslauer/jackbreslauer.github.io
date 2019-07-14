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
{ cardcontent: ['General Assembly','Coding','expensive','terrible elevator','worth it!' ]},
{ cardcontent: ['HTML','website','markup','H1','easy' ]},
{ cardcontent: ['CSS','curly bracket','style','float','finicky' ]},
{ cardcontent: ['Javascript','$','interactions','coffee','hard' ]},
{ cardcontent: ['Chandler','red bull','Keanu Reeves','Long hair','legend' ]},
{ cardcontent: ['Flatiron','triangle','tourists','sprint','Broadway' ]},
{ cardcontent: ['Slack','clicking','emojis','AIM for adults','Group' ]},
{ cardcontent: ['Sublime','Santeria','Text','Editor','S button' ]},
{ cardcontent: ['Emojis','Smily Face','Thumbs Up','Cartoon','Icon' ]},
{ cardcontent: ['New York','Subway','Rats','Times Square','Big Apple' ]},
{ cardcontent: ['Subway','Rats','Smelly','Showtime','underground' ]},
{ cardcontent: ['startup','company','tech','trendy','VC' ]},
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

var team=0;
var score1=0;
var score2=0;


$('#next').click(function(){
	if(team===0) {team=1}
	else if (team===1) {team=2}
	else team=1
})



$('#left').click(function(){

if(team===1){
	score1=score1-1;
	$('#score1').html(score1);
}
else{
	score2=score2-1;
	$('#score2').html(score2);}
});



$('#right').click(function(){

if(team===1){
	score1=score1+1;
	$('#score1').html(score1);
}
else{
score2=score2+1;
$('#score2').html(score2);
}
});


$('#next').click(countdown)	



var totalTime

function countdown(){
	totalTime=60
	var timer=setInterval(showtime, 1000)
	$('#timeleft').html("Let's Go!");
	$('#left,#right,#down').css('display','block')
	$('#next').css('display','none')

function showtime (){

		totalTime=parseInt(totalTime)
		if(totalTime>=1)
		{totalTime-=1
		$('#timeleft').html(totalTime)}
		else {
			clearInterval(timer);
			$('#right,#left,#down').css('display','none')
			$('#next').css('display','inline-block')
			$('#timeleft').html("Time's Up!");
			
			}}
	 }	

