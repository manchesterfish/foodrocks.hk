function validateForm() {
    var x = document.getElementById('order_phone');

    if (x.value == null || x.value == "") {
        alert("First name must be filled out");
        return false;
    }
};


function forbidEnter() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
};

/*
$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});*/

function getUsrPhone(){	
	var x = document.getElementById('order_phone');
	document.getElementById('usrPhone').innerHTML=x.value;
};


function checkSoldOut(){
	var x = document.getElementsByClassName('reminingDish');
	var y = document.getElementsByClassName('soldOut');

	if (x[0].innerHTML == '仅剩0份') {
		y[0].innerHTML="沽清";
		var btn = document.getElementsByClassName('btn');
		var img = document.getElementsByTagName('img')	
		x[0].innerHTML = '售罄'	
		btn[0].className += ' disabled';
		img[1].className += ' img-dark'

	};

};