document.getElementById('click-me').onclick=calculation;

function calculation(){
	var age = parseInt(document.getElementById('age').value);
	var maxAge = parseInt(document.getElementById('max-age').value);
	var daily = parseInt(document.getElementById('num-per-day').value);
	var totaldrinks= (maxAge-age)*daily*365;
	var item= document.getElementById('item').value;



	document.getElementById('solution').innerHTML=totaldrinks;
	document.getElementById('drink').innerHTML=item;
}