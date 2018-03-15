<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认选课</title>
<link rel="stylesheet" href="add.css" />
</head>
<body>
	<form action="SelectLimit.jsp" method="post">
		<table border="3" align="center" cellspacing="0dp" cellpadding="30dp" align="center" bordercolor="purple">
			<thead>
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>教师编号</th>
					<th>教师姓名</th>
					<th>学分</th>
				</tr>
			</thead>
			<tbody>
				<%request.setCharacterEncoding("utf-8");
				  String username=(String)session.getAttribute("name");
				  int Cno=Integer.parseInt(request.getParameter("Cno"));
				  String Cname=new String(request.getParameter("Cname").getBytes("ISO-8859-1"),"UTF-8") ;
				  int Ccredit=Integer.parseInt(request.getParameter("Ccredit"));
				%>
				<tr>
					<td colspan="5" align="center"><font size="5" color="red"><%=username %>确认选择该课程:</font></td>
				</tr>
				<tr>
					<td><%=Cno %></td>
					<td><%=Cname %></td>
					<td><%=request.getParameter("Tno")%></td>
					<td><%=new String(request.getParameter("Tname").getBytes("ISO-8859-1"),"UTF-8")%></td>
					<td><%=request.getParameter("Ccredit")%></td>
					<%
						session.setAttribute("Cno", Cno);
						session.setAttribute("Cname", Cname);	
						session.setAttribute("Ccredit", Ccredit);
					%>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
						<input type="Submit" name="submit" value="确定"></input>
						<a href="SelectCourse.jsp">取消</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>	
</body>
</html>