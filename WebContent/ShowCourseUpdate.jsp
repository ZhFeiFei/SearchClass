<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="Bean.CourseBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
    <head>
        <title>修改课程信息</title>
        <meta charset = "utf-8"/>
        <link rel="stylesheet" href="css/add.css" />
    </head>
    <body> 
    <% 
    request.setCharacterEncoding("UTF-8");
    CourseBean user=(CourseBean)request.getAttribute("user");
    int Cno=user.getCno();
    session.setAttribute("Cno", Cno);
    %>
        <div id = "body-box"> 
            <div id = "body-info">  
                <ul>
                <form action="CourseUpdateActionServlet">
                    <li class = "info-list">
                        <span>课程编号</span>
                        <span>
                            <input type = "text" name = "Cno" value = "<%=user.getCno() %>" />
          
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>课程姓名</span>
                        <span>
                            <input type="text" name = "Cname" value = "<%=user.getCname() %>"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>教师编号</span>
                        <span>
                            <input type="text" name = "Tno" value = "<%=user.getTno() %>"/>
                        </span>
                    </li>
                    
                    <li class = "info-list">
                        <span>教师姓名</span>
                        <span>
                            <input type="text" name = "Tname" maxlength = "8" value = "<%=user.getTname() %>"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学分</span>
                        <span> 
                            <input type="text" name = "Ccredit" value = "<%=user.getCcredit() %>"/>
                        </span>
                    </li>
                     <li class = "info-list"> 
                        <span> 
                            <input type="submit" name = "submit" value = "确认提交"/>
                        </span>
                    </li>
                </form>
                </ul>
            </div>
        </div>
    </body>
</html>