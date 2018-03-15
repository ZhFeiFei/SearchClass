<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="Bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息表</title>
<style>
    a{text-decoration:none}
    a:hover{color:orange}
</style>
</head>
<body>
<div style = "width:95%;margin:20px auto;">
<table cellspacing="0" border="6" bordercolor="#0053b9" align="center" width = "95%">
  
  <tr>
  <th align="center" bordercolor="#0053b9" style = "color:green">课程编号</th>
  <th align="center" bordercolor="#0053b9" style = "color:green">课程名</th>
  <th align="center" bordercolor="#0053b9" style = "color:green">教师编号</th>
  <th align="center" bordercolor="#0053b9" style = "color:green">教师名</th>
  <th align="center" bordercolor="#0053b9" style = "color:green">学分</th>
  <th align="center" bordercolor="#0053b9" style = "color:green">操作</th>
  </tr>
<%
     request.setCharacterEncoding("UTF-8");
     CoursePageBean pb=(CoursePageBean)request.getAttribute("pb");
     List<CourseBean> list=pb.getUser();
     if(list==null||list.size()<0)
     {
        out.print("数据为空");
        }else{
        for(CourseBean user:list)
        {    %>
     <tr>
        <td><%=user.getCno()%></td>
        <td><%=user.getCname()%></td>
        <td><%=user.getTno()%></td>
        <td><%=user.getTname()%></td>
        <td><%=user.getCcredit()%></td>

        <td style = "text-align:center">
            <a href="DeleteCourseServlet?Cno=<%=user.getCno() %>" >删除</a>
            <a href="CourseUpdateServlet?Cno=<%=user.getCno()%>">修改</a>
        </td>
    </tr>
       <%}%> 
 <%
       }
%>
</table>
<hr>
<div align="center">
<!-- 如果当前页是首页，那么不显示首页和上一页 -->
<%
   if(pb.getPagenum()!=1){
%>     
       <a href="CoursePageServlet?pagenum=1">首页</a>
       <a href="CoursePageServlet?pagenum=<%=pb.getPagenum()-1%>">上一页  </a>      
<%
   } 
/* 以当前页尾基准，左面显示5个，右面显示4个 */ 
  int begin=(pb.getPagenum()-5)>0?(pb.getPagenum()-5):1;
  int end=((pb.getPagenum()+4)>pb.getTotalpagenum())?(pb.getTotalpagenum()):(pb.getPagenum()+4);
  for(int i=begin;i<=end;i++){    
      if(pb.getPagenum()==i){    
%>
          <a href="CoursePageServlet?pagenum=<%=i%>"> <font color="red"> <%=i%></font> </a>&nbsp;       
<%    }else{
%>
         <a href="CoursePageServlet?pagenum=<%=i%>"> <%=i %></a>&nbsp;
<%    }
  }

   if(pb.getPagenum()!=pb.getTotalpagenum()){      
%>      
 <!-- 如果当前页是尾页，那么不显示尾页和下一页 -->  
       <a href="CoursePageServlet?pagenum=<%=pb.getPagenum()+1%>">下一页  </a>
       <a href="CoursePageServlet?pagenum=<%=pb.getTotalpagenum()%>">尾页</a>

<%    
   }
%>
</div>
</div>
</body>
</html>