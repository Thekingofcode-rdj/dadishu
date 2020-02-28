<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>打地鼠</title>
<style type="text/css">
html{
    height: 100%;
}
body{
    height: 100%;
    background-image: url('./image/bg.jpg');
    display: flex;
    justify-content: center;
    /* align-items: center; */
    position: relative;
}
section{
    width: 760px;
    height: 400px;
    margin-top: 100px;
}
section div{
    width: 160px;
    height: 140px;
    display: inline-block;
    margin-right: 30px;
    position: relative;
}
.hole{
    display: inline-block;
    width:160px;
    position: absolute;
    bottom: 0;
    z-index: 1;
}

.mouse{

   width:100px; 
    z-index: 10;
    position: absolute;
    bottom:25px;
    left: 30px;
     
}

#count{
    display:block;
    width:110px;
    height: 40px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    line-height: 40px;
    background-color:brown;
    color: white;
    position: absolute;
    top:200px;
    left: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    
}
.hide{display:none;}
#over{ width:80px; height:30px; background:#C60;}
#start{ width:80px; height:30px; background:#C60;}
#playbtn{
		background:none;
		cursor:none;
		width: 60px;
		height: 56px;
		background-image: url(image/musicplaying.png)  ;
		border: hidden;
			}
</style>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<table>
	<tr><td><input type="button" value="开始游戏" id="start"/></td></tr>
    
    <tr><td><input type="button" value="结束游戏" id="over"/></td></tr>
</table>
    <section>
        
    </section>

    <!-- 添加积分器 -->
    <span id="count">得分 为0</span>

    <!-- 添加音频  hidden="true" -->
    <audio id="audio" src="audio/music12.wav" autoplay="autoplay" loop ></audio>
	<input type="button" id="playbtn">
</body>
<script type="text/javascript">
var start=document.getElementById('start');
var over=document.getElementById('over');
//音频播放与暂停
function playOrPause(){
var audio = document.getElementById("audio");
if(audio.paused){
audio.play();
document.getElementById("playbtn").style.backgroundImage = "url(image/musicplaying.png)";
}else if(audio.played){
audio.pause();
document.getElementById("playbtn").style.backgroundImage = "url(image/musicpause.png)";
}
}
//初始化界面窗口
for(var i=1;i<17;i++){
$('section').append('<div></div>');  
}
$('section div').append("<img class='hole' src='image/hole.png'  >");


 $('.mouse').hide();
 
function start_game(){
start.style.background = "gray"
$('section div').append('<img class="mouse" src="image/mouse.png">');

//设置初始状态地鼠都没出现

$('.mouse').hide();

//袋鼠出现
               // [1,4] [0, 3)
//随机出现的袋鼠数目 [1 16]  (0, 15]  向上取整
var num
//
//袋鼠位置[0  15]  索引 index
var index
var object;
setInterval(function(){
num=Math.ceil(Math.random()*2);
for(var i=1; i<=num ;i++){
    //随机出现的袋鼠位置[0  15]  索引
  index=Math.floor(Math.random()*16);
  object=$('section div:nth-of-type('+(index+1)+') .mouse')

  object.slideDown();
  object.delay(2000).slideUp();//地鼠停留时间
}

},1000);//地鼠出现时间


//鼠标锤子  图形
$('body').mousedown(function(){
$('body').css({
    cursor:'url("./image/cursor-down.png"), auto'
});
}).mouseup(function(){
$('body').css({
cursor:'url("./image/cursor.png") ,auto'
});
});

//score 记录敲到地鼠的分数
var score=0;
$('.mouse').click(function(){

$(this).hide();
score+=10;
$(" <span id='count'>得分 为"+score+"</span>").replaceAll('span');
$('#dazhong').append('<audio></audio>');
setTimeout(function(){
    $('#dazhong').empty();
},1000);
});
over.disabled=false;
start.disabled=true;
 }
 	  
function over_game(){
var r = confirm("确定退出游戏吗？","提示");
			if(r==true){
				window.close();
			}else{
				alert("继续战斗吧");
			}
 }
playbtn.onclick = function(){
	 playOrPause();
	 }
 
start.onclick=function(){  

  start_game();

  }	 
over.onclick=function(){  

  over_game();

  }
</script>
</html>