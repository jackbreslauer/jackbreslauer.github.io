$(document)
$('#c2f').click(function(){
var answer=0;
answer=($('#c').val());
answer=(answer*1.8)+32;
$('#f').val(answer);
});


$('#f2c').click(function(){
var answer=0;
answer=parseInt($('#f').val());
answer=(answer-32)/1.8;
$('#c').val(answer);
});

$('#reset').click(function(){
$('#c').val(0)
$('#f').val(0)
});

