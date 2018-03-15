<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生选课首页</title>
</head>
<body background="images/0.jpg">
	<%
		request.setCharacterEncoding("utf-8");
	%>
		<table border="3" align="center" cellspacing="0dp" cellpadding="30dp" align="center" bordercolor="purple" >
			<thead>
			<tr>
				<th>课程号</th>
				<th>课程名</th>
				<th>教师编号</th>
				<th>教师姓名</th>
				<th>学分</th>
				<th colspan="3">可选课程</th>
			</tr>
			</thead>
			<%
			try{
				//加载驱动
				Class.forName("com.mysql.jdbc.Driver");
				//建立连接
				Connection conn=null;
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_keshe","root","123456");
				//操作数据
				String sql="select * from course";
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
			%>
			<tbody>
				<tr>
					<td><%=rs.getInt("Cno") %></td>
					<td><%=rs.getString("Cname") %></td>
					<td><%=rs.getString("Tno") %></td>
					<td><%=rs.getString("Tname") %></td>
					<td><%=rs.getInt("Ccredit") %></td>
					<td align="center"><a href="SelectConfrim.jsp?Cno=<%=rs.getInt("Cno")%>&Cname=<%=rs.getString("Cname")%>&Tno=<%=rs.getString("Tno")%>&Tname=<%=rs.getString("Tname")%>&Ccredit=<%=rs.getInt("Ccredit") %>">选课</a></td>
				</tr>
			</tbody>
			<%
				}
				rs.close();
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			%>		
		</table>

</body>
</html>