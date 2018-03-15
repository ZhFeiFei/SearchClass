<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课学分查询</title>
</head>
<body background="images/0.jpg">
	<% 
		request.setCharacterEncoding("utf-8");
		String Sno=(String)session.getAttribute("number");	
	%>
		<table border="3" align="center" cellspacing="0dp" cellpadding="30dp" align="center" bordercolor="purple">
			<thead>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>课号</th>
					<th>课程名</th>
					<th>成绩</th>
					<th>学分</th>
				</tr>
			</thead>
			<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=null;
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_keshe","root","123456");
				PreparedStatement ps=null;
				String sql="select * from sc where Sno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1,Sno);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
			%>
			<tbody>
				<tr>
					<td><%=rs.getString("Sno") %></td>
					<td><%=rs.getString("Sname") %></td>
					<td><%=rs.getInt("Cno") %></td>
					<td><%=rs.getString("Cname") %></td>
					<td><%=rs.getString("Grade") %></td>
					<td><%=rs.getInt("Ccredit") %></td>
				</tr>
			</tbody>
			<% }%>
			<tfoot>
				<tr>
					<td colspan="6" align="center"><font color="purple" >成绩在选修课完成后给出</font> </td>
				</tr>
			</tfoot>
		</table>
	<%
		rs.close();
		ps.close();
		conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>

</body>
</html>