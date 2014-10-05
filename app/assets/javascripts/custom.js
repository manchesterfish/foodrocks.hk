function getUsrPhone(){
	var x = document.getElementById('order_phone');
	document.getElementById('usrPhone').innerHTML=x.value;
};

function validateForm() {
	var x = document.getElementById("order_phone");
	var y = document.getElementById('submitBtn');
    if (x.value == null || x.value == "" || x.value.length != 8) {
        //document.getElementById('usrPhone').innerHTML="请输入正确的手机号码";
	    document.getElementById('usrPhone').innerHTML=x.value;
        y.value = "请输入正确的手机号码";
        return false;
    }else{
	    document.getElementById('usrPhone').innerHTML=x.value;
    	y.value = "确认";
        return true;
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



function checkSoldOut(){
	var x = document.getElementsByClassName('reminingDish');
	var y = document.getElementsByClassName('soldOut');

	var i;
	for (i = 0; i < x.length; i++) {
		if (x[i].innerHTML == '仅剩0份') {
			//y[i].innerHTML="暂无供应";
			var btn = document.getElementsByClassName('btn');
			var img = document.getElementsByTagName('img');
			x[i].innerHTML = ''	;
			btn[i].className += ' disabled';
			btn[i].innerHTML = '卖完啦！ 明天再抢';
			img[i+1].className += ' img-dark';
		} else if (x[i].innerHTML == '仅剩1份' || x[i].innerHTML == '仅剩2份' || x[i].innerHTML == '仅剩3份'){

		} else {
			x[i].innerHTML = ''	;
		}
	}
};

function orderPageSoldOut(number){
//	alert(number);
	if(number == -2){
		var btn = document.getElementsByClassName('btn');
		btn[0].className += ' disabled';
		btn[0].innerHTML = '卖完啦！ 明天再抢';
	}
};

$('#navList').hover(
       function(){ $(this).addClass('active') },
       function(){ $(this).removeClass('active') }
);

$(document).ready(function($){
    $('.navList').hover(
         function(){ $(this).addClass('active') },
         function(){ $(this).removeClass('active') }
    )
});


function checkTimeToStart() {
	var currentTime = new Date().getTime();
	var startTime = new Date("October 6, 2014 09:00:00");
	var startTimeS = startTime.getTime();

	var x = document.getElementsByClassName('reminingDish');

	if (currentTime<startTimeS)
	{
		var i;
		for (i = 0; i < x.length; i++) {
			var btn = document.getElementsByClassName('btn');
			var img = document.getElementsByTagName('img')
			x[i].innerHTML = ''
			btn[i].className += ' disabled';
			btn[i].innerHTML = '每天9点 准时开抢';
		}
	}else{

	}
}
