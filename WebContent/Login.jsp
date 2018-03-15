<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src = "js/index.js"></script>
</head>
<body>
<div class="login-box">
    <h1>中北大学选课系统</h1>
    <form method="post" action="StudentLoginServlet" onsubmit = "check()">
        <div class="name">
            <label>账  号：</label>
            <input type="text" name="Sno" id="" tabindex="1" placeholder= "学生学号" autocomplete="off" />
        </div>
        <div class="password">
            <label>密  码：</label>
            <input type="password" name="Spsw" maxlength="16" id="" tabindex="2"/>
        </div>
        <div class="login">
            <input type="submit" value = "登 陆" id = "loginBut" tabindex="5"/>
        </div>
    </form>
</div>
<div class="bottom">©2016 中北大学 <a href="javascript:;" target="_blank">关于</a> <span>学生选课系统</span></div>
<div class="screenbg">
    <ul>
        <li><a href="javascript:;"><img src="images/0.jpg"></a></li>
        <li><a href="javascript:;"><img src="images/1.jpg"></a></li>
        <li><a href="javascript:;"><img src="images/2.jpg"></a></li>
    </ul>
</div>
</body>
</html>