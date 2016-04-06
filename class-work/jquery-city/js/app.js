$('#first').click(function(){
var chosen=$(this).attr('src');
$('#bigimage').attr('src',chosen);
});

$('#second').click(function(){
var chosen=$(this).attr('src');
$('#bigimage').attr('src',chosen);
});


$('#third').click(function(){
var chosen=$(this).attr('src');
$('#bigimage').attr('src',chosen);
});

$('#fourth').click(function(){
var chosen=$(this).attr('src');
$('#bigimage').attr('src',chosen);
});
// 1. Create .click() handlers for each of the thumbnails: #first, #second, #third, #fourth
// 2. Use .attr() to change the `src` attribute of #bigimage to correspond to image that was clicked
