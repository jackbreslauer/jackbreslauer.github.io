
// 1. Besure to write your code within the $(document).ready(...)
$(document).ready(function(){
// I still don't really understand what this above function acheives, but my code didn't work properly without it...
var count=0;

$('#a10').click(plus10);
$('#a20').click(plus20);
$('#a30').click(plus30);
$('#n10').click(minus10);
$('#n20').click(minus20);
$('#n30').click(minus30);
$('#red').click(red);
$('#blue').click(blue);
$('#out').click(reset);


function plus10(){
	count=(count+10);
	$('#out').html(count);
};
function plus20(){
	count=(count+20);
	$('#out').html(count);
};
function plus30(){
	count=(count+30);
	$('#out').html(count);
};
function minus10(){
	count=(count-10);
	$('#out').html(count);
};
function minus20(){
	count=(count-20);
	$('#out').html(count);
};
function minus30(){
	count=(count-30);
	$('#out').html(count);
};
function red(){
	$('#out').css('background','red');
};
function blue(){
	$('#out').css('background','blue');
};
function reset(){
	count=0;
	$('#out').html(count);
	$('#out').css('background','white');
};
// 2. Add .click() event handlers for each of the boxes:
// - A) boxes #a10, #a20, and #a30 should each add 10, 20, and 30, respectively, to the value in the center box, #out
// - B) boxes #n10, #n20, and #n30 should each subtract 10, 20, and 30, respectively, from the value in the center box, #out
// - C) #red and #blue should change the background color of #out to red and blue, respectively
// - D) #out should change the background of #out to white, and set the value back to zero
// HINT: define a variable, var count = 0, at the top of your function; use this variable to keep track of what to display inside of #out
// Ex: when the user clicks #a10, add 10 to the var count, and then reflect this change in the HTML
//
// jQuery Methods Needed:
// - .click()
// - . text() or .html()
// - .css()
});