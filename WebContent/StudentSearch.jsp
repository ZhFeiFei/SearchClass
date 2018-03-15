<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="Bean.StudentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生信息</title>
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
                    <li class = "info-list">
                        <span>学生学号</span>
                        <span>
                            <%=user.getSno() %>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生姓名</span>
                        <span>
                            <%=user.getSname() %>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生密码</span>
                        <span>
                            <%=user.getSpsw() %>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>学生性别</span>
                        <span>
                            <%=user.getSsex() %>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>出生年月</span>
                        <span>
                            <%=user.getSbirth() %>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>所属班级</span>
                        <span> 
                            <%=user.getSclass() %>
                        </span>
                    </li>
                    <li class = "info-list"> 
                        <span>所属院系</span>
                        <span>
                            <%=user.getSdept() %>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
</body>
</html>