<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="Bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息表</title>

</head>
<body>
<table cellspacing="0" border="6" bordercolor="red" align="center" width = "95%">
  
  <tr>
  <td align="center" bordercolor="red" style = "color:green">学号</td>
  <td align="center" bordercolor="red" style = "color:green">姓名</td>
  <td align="center" bordercolor="red" style = "color:green">出生年月</td>
  <td align="center" bordercolor="red" style = "color:green">性 别</td>
  <td align="center" bordercolor="red" style = "color:green">班级</td>
  <td align="center" bordercolor="red" style = "color:green">院系</td>
  <td align="center" bordercolor="red" style = "color:green">操作</td>
  </tr>
<%
     request.setCharacterEncoding("UTF-8");
     PageBean pb=(PageBean)request.getAttribute("pb");
     List<StudentBean> list=pb.getUser();
     if(list==null||list.size()<0)
     {
        out.print("数据为空");
        }else{
        for(StudentBean user:list)
        {    %>
     <tr>
        <td><%=user.getSno()%></td>
        <td><%=user.getSname()%></td>
        <td><%=user.getSbirth()%></td>
        <td><%=user.getSsex()%></td>
        <td><%=user.getSclass()%></td>
        <td><%=user.getSdept()%></td>
        <td>
            <a href="DeleteStudentServlet?number=<%=user.getSno() %>" >删除</a>
            <a href="StudentUpdateServlet?number=<%=user.getSno()%>">修改</a>
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
       <a href="PageServlet?pagenum=1">首页</a>
       <a href="PageServlet?pagenum=<%=pb.getPagenum()-1%>">上一页  </a>      
<%
   } 
/* 以当前页尾基准，左面显示5个，右面显示4个 */ 
  int begin=(pb.getPagenum()-5)>0?(pb.getPagenum()-5):1;
  int end=((pb.getPagenum()+4)>pb.getTotalpagenum())?(pb.getTotalpagenum()):(pb.getPagenum()+4);
  for(int i=begin;i<=end;i++){    
      if(pb.getPagenum()==i){    
%>
          <a href="PageServlet?pagenum=<%=i%>"> <font color="red"> <%=i%></font> </a>&nbsp;       
<%    }else{
%>
         <a href="PageServlet?pagenum=<%=i%>"> <%=i %></a>&nbsp;
<%    }
  }

   if(pb.getPagenum()!=pb.getTotalpagenum()){      
%>      
 <!-- 如果当前页是尾页，那么不显示尾页和下一页 -->  
       <a href="PageServlet?pagenum=<%=pb.getPagenum()+1%>">下一页  </a>
       <a href="PageServlet?pagenum=<%=pb.getTotalpagenum()%>">尾页</a>

<%    
   }
%>
</div>

<%-- <div>
<a href="PageServlet?pagenum=1">首页</a>&nbsp;
<a href="PageServlet?pagenum=<%=pb.getTotalpagenum() %>">尾页</a>&nbsp;
<a href="PageServlet?pagenum=<%=pb.getPagenum()-1 %>">上一页</a>&nbsp;
<a href="PageServlet?pagenum=<%=pb.getPagenum()+1 %>">下一页</a>；
</div> --%>

</body>
</html>