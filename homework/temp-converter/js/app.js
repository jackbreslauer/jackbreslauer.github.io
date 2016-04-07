$(document)
$('#c').keydown(function(){
var answer=0;
answer=parseInt($('#c').val());
answer=answer*2;
$('#f').val(answer);
});


$('#f').keydown(function(){
var answer=0;
answer=parseInt($('#f').val());
answer=answer*2;
$('#c').val(answer);
});

$('button').click(function(){
$('#c').val(0)
$('#f').val(0)
});

