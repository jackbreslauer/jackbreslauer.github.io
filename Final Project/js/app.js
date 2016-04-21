//var words = ['cat', 'dog', 'fish']
//var i;
//for (i = 0; i < substr.length; ++i) {
    // do something with `substr[i]`
//}


var maincard=['a','b','c']
var firstcard=['a','b','c']
var secondcard=['a','b','c']
var thirdcard=['a','b','c']
var fourthcard=['a','b','c']

// $('#next').click(function(){
// 	$('#mainword').html(maincard[0])
// 	$('#taboo1').html(firstcard[0])
// 	$('#taboo2').html(secondcard[0])
// 	$('#taboo3').html(thirdcard[0])
// 	$('#taboo4').html(fourthcard[0])
// })

// $('#right').click(function(){
// 	$('#mainword').html(maincard[1])
// 	$('#taboo1').html(firstcard[1])
// 	$('#taboo2').html(secondcard[1])
// 	$('#taboo3').html(thirdcard[1])
// 	$('#taboo4').html(fourthcard[1])
// })

var cards = [
	{
		word: 'cat',
		hints: ['feline', 'kitty', 'meow','pussy']
	},
	{
		word: 'dog',
		hints: ['canine', 'puppy', 'woof','poochface']
	},
	{
		word: 'car',
		hints: ['auto', 'automobile', 'drive','vroom']
	}
]

$('#right').click(function () {

	// 1) get a random card
	var randomNum = Math.floor(Math.random() * cards.length)
	var randomCard = cards[randomNum]
	// randomCard = {
	// 	word: 'car',
	// 	hints: ['auto', 'automobile', 'drive']
	// }
$('#mainword').html(randomCard.word)
$('#taboo1').html(randomCard.hints[0])
$('#taboo2').html(randomCard.hints[1])
$('#taboo3').html(randomCard.hints[2])
$('#taboo4').html(randomCard.hints[3])
	// 2) print word to #mainword


	// 3) print hints to #taboo1-4

})

//var card{
//	main:[a,b,c,d,e]
//	first:[f,g,h,i]
//	second:[x,y,z]
//}

$('#down').click(function () {
	maincard.forEach(cycle)
})

function cycle(item){
	console.log(item)
	$('#mainword').html(item)
}
//	// do something with word
//})


$(document).ready(function () {

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
}

function showtime (){

		totalTime=parseInt(totalTime)
		if(totalTime>=1)
		{totalTime-=1
		$('#timeleft').html(totalTime)}
		else $('#timeleft').html("time's up!")
	 }	
