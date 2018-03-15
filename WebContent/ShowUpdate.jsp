<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="Bean.StudentBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
    <head>
        <title>修改学生信息</title>
        <meta charset = "utf-8"/>
        <link rel="stylesheet" href="css/add.css" />
    </head>
    <body> 
    <% 
    request.setCharacterEncoding("UTF-8");
    StudentBean user=(StudentBean)request.getAttribute("user");
    %>
        <div id = "body-box"> 
            <div id = "body-info">  
                <ul>
                <form action="StudentUpdateActionServlet">
                    <li class = "info-list">
                        <span>学生学号</span>
                        <span>
                            <input type = "text" name = "Sid" value = "<%=user.getSid() %>" hidden = "true"/>
                            <input type="text" name = "Sno"  value = "<%=user.getSno() %>" readonly = "true"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生姓名</span>
                        <span>
                            <input type="text" name = "Sname" value = "<%=user.getSname() %>"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生密码</span>
                        <span>
                            <input type="password" name = "Spsw" value = "<%=user.getSpsw() %>"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生性别</span>
                        <span>
                            <label><input type="radio" name = "Ssex" value = "男" />男</label>
                            <label><input type="radio" name = "Ssex" value = "女" checked = "checked"/>女</label>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>出生年月</span>
                        <span>
                            <input type="text" name = "Sbirth" maxlength = "8" value = "<%=user.getSbirth() %>"/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>所属班级</span>
                        <span> 
                            <input type="text" name = "Sclass" value = "<%=user.getSclass() %>"/>
                        </span>
                    </li>
                    <li class = "info-list"> 
                        <span>所属院系</span>
                        <span>
                            <input type="text" name = "Sdept" value = "<%=user.getSdept() %>"/>
                        </span>
                    </li>
                    <li class = "info-list"> 
                        <span> 
                            <input type="submit" name = "submit" value = "添加提交"/>
                        </span>
                    </li>
                </form>
                </ul>
            </div>
        </div>
    </body>
</html>