<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<style>
*{ margin:0;padding:0;}
body{
     background-image:url(image/back.gif) ;
    background-size:cover;
    }

form{
   
	background-repeat:no-repeat;
	 margin-top:10px;
	 margin-left:auto;
	 margin-right:auto;
	height:360px;
	width:300px;
	
/*	border:#328aa2 3px solid; */
	}
	
.hz{ 
	margin-left:-55px;
	 margin-right:auto;
	margin-top:50px;
	padding:120px;
	width:200px;
	height:155px;}
	
div{

	height:40px;}
.sp{
	font-size:12px;}

.denglu{
	margin-left:16px;
	width:60px;
	hight:35px;
	border-radius:3px;
	margin-top:50px;}
	
	.zhuce{
	margin-left:30px;
	width:60px;
	hight:35px;
	border-radius:3px;}
		
a{ text-decoration:none;
 margin-left:10px;
 font-size:12px;}
</style>
</head>
<body>
<form name="form1" method="post" action="LoginServelet" id="f">
<div  class="hz">
  <div>用户名:
    <label for="textfield"></label>
  <input type="text" name="username" id="username">
  </div>
  <div>密码:&nbsp;&nbsp;&nbsp;
    <label for="textfield2"></label>
    <input type="password" name="userpass" id="userpass">
  </div>
  <div>
    <input type="submit" name="button" id="button" value="登录" class="denglu" onclick="check()">
    <input type="button" name="button2" id="button2" value="注册" onclick="jump()" class="zhuce">
  </div>
  </div>
 </form>
<script type="text/javascript">
function login_onclick(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("userpass").value;
	if(username=="" || password==""){
		alert("账号或密码不能为空");
		return false;
	}
	if(password==""){
		alert("密码不能为空！");
		return false;
	}
	if(password.length>16||password.length<6){
		alert("密码为6-16位！");
		return false;
	}
}
function check(){
	if(login_onclick()){
		document.getElementById("f").submit();
	}
}
function jump(){
	 window.location.href="Register.jsp";
	}
</script>
</body>
</html>