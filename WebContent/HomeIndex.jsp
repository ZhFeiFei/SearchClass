<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
request.setCharacterEncoding("UTF-8");
String username=(String)session.getAttribute("name");
String number=(String)session.getAttribute("number");
%>
<html> 
    <head> 
        <title>学生选课系统</title>
        <meta charset = "utf-8"/>
        <link rel="Shortcut Icon" href="images/blueicon.jpg" />
        <link rel="stylesheet" href="css/index.css" />
        <script type="text/javascript" src = "js/jquery.js"></script>
        <script type="text/javascript" src = "js/index.js"></script>
    </head>
    <body> 
        <div> 
            <div id = "top">
                <div class = "top-left">
                    <span class = "top-logo"> 
                        <a href="index.jsp"><img src="images/logo.jpg" alt="" /></a>
                    </span>
                    <span class = "top-title"> 
                        学生选课系统
                    </span>
                </div>
                <div class = "top-right">
                    <ul>
                        <li>欢迎您，
                        <% out.println(username);%>
                        </li>
                        <li><a href="Login.jsp">注销</a></li>
                    </ul>
                </div>
            </div>
            <div id = "left">
                <div class = "left-title">
                    <span class = "title-name">学 生 信 息</span>
                    <ul class = "left-info">
                        <li><a href="StudentSearchServlet?number=<%=number%>" target = "myframe">个 人 信 息 </a></li>
                        <li><a href="StudentUpdateServlet?number=<%=number%>" target = "myframe">修 改 信 息</a></li>
                    </ul>
                </div>
                <div class = "left-title">
                    <span class = "title-name">课 程 选 择</span>
                    <ul class = "left-info">
                        <li><a href="CoursePageServlet?pagenum=1" target = "myframe">课 程 信 息</a></li>
                        <li><a href="SelectCourse.jsp" target = "myframe">学 生 选 课 </a></li>
                        <li><a href="SelectSuccess.jsp" target = "myframe">选 课 结 果</a></li>
                    </ul>
                </div>
                <div class = "left-title">
                    <span class = "title-name">学 分 查 询</span>
                    <ul class = "left-info">
                        <li><a href="CreditSelect.jsp?number=<%=number%>" target = "myframe">查询所选学分</a></li>
                        <li><a href="UnCredit.jsp" target = "myframe">学分不足的学生</a></li>
                        <li><a href="InCredit.jsp" target = "myframe">学分满足的学生</a></li>
                    </ul>
                </div>
                <div class = "left-title">
					<span class = "title-name">关键字查询</span>
					<ul class = "left-info">
						<li><a href="select.jsp" target = "myframe">模糊查询</a></li>
					</ul>
				</div>
            </div>
            <div id = "right">
                <iframe src="images/index.jpg" name = "myframe" id = "myframe" frameborder="0"></iframe>
            </div>
        </div>
    </body>
</html>