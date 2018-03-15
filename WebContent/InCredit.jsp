<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>满足学分</title>
</head>
<body background="images/0.jpg">
	<%request.setCharacterEncoding("UTF-8"); %>
	<table border="3" align="center" cellspacing="0dp" cellpadding="30dp" align="center" bordercolor="purple" >
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>课号</th>
				<th>课程名</th>
				<th>分数</th>
				<th>学分</th>
			</tr>
		</thead>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=null;
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_keshe","root","123456");
				PreparedStatement ps=null;
				String sql1="select * from sc where Ccredit>=7";
				ps=conn.prepareStatement(sql1);
				ResultSet rs1=null;
				rs1=ps.executeQuery();
				while(rs1.next()){
			%>
		<tbody>
			<tr>
				<td><%=rs1.getString("Sno") %></td>
				<td><%=rs1.getString("Sname") %></td>
				<td><%=rs1.getInt("Cno") %></td>
				<td><%=rs1.getString("Cname") %></td>
				<td><%=rs1.getString("Grade") %></td>
				<td><%=rs1.getInt("Ccredit") %></td>
			</tr>
		</tbody>
		<%	
				}
				rs1.close();
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%> 
		<tfoot>
			<tr>
				<td colspan="6" align="center" >满足学分的学生信息</td>
			</tr>
		</tfoot>
	</table> 
	

</body>
</html>