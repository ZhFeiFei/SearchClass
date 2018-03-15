<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
    <head>
        <title>添加课程信息</title>
        <meta charset = "utf-8"/>
        <link rel="stylesheet" href="css/add.css" />
    </head>
    <body> 
        <div id = "body-box"> 
            <div id = "body-info">  
                <ul>
                <form action="AddCourseServlet">
                     <li class = "info-list">
                        <span>课程编号</span>
                        <span>
                            <input type = "text" name = "Cno" value = ""/>
          
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>课程名称</span>
                        <span>
                            <input type="text" name = "Cname" value = ""/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>教师编号</span>
                        <span>
                            <input type="text" name = "Tno" value = ""/>
                        </span>
                    </li>
                    
                    <li class = "info-list">
                        <span>教师姓名</span>
                        <span>
                            <input type="text" name = "Tname" maxlength = "8" value = ""/>
                        </span>
                    </li>
                    <li class = "info-list">
                        <span>课程学分</span>
                        <span> 
                            <input type="text" name = "Ccredit" value = ""/>
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