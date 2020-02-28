<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
</head>
<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
<body>
<form name="form1" method="post" action="RegisterSevelet" id="f">
  <p>用户名:
  <input type="text" name="username" id="username">
  </p>
  <p>密码:&nbsp;&nbsp;&nbsp;
    <input type="text" name="userpass" id="userpass">
  </p>
  <p>再次输入密码:
    <input type="text" name="userpass1" id="userpass1">
  </p>
  <p>
    <input type="button" name="button" id="button" value="确定" onClick="check()">
    <input type="reset" name="button2" id="button2" value="重置">
  </p>
</form>
<script type="text/javascript">
function checkPass(){
	var userpass=document.getElementById("userpass").value;
	var userpass1=document.getElementById("userpass1").value;
	if(userpass!=userpass1){
		alert("两次输入密码不一致");
		return false;
	}
	if(userpass.length<6 || userpass.length>12){
		alert("眼睛瞎吗？说的长度为6-12位！");
		return false;
	}
	return true
}
function check(){
	if(checkPass()==true){
		document.getElementById("f").submit();
	}else{
		alert("请重新注册");
	}
}
</script>
</body>

</html>