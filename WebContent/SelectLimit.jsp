<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>按学分选课</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");%>
	<%
		String Sno=(String)session.getAttribute("number");
		String Sname=(String)session.getAttribute("name");
		int Cno=(Integer)session.getAttribute("Cno");
		String Cname=(String)session.getAttribute("Cname");
		String Grade=null;
		int Ccredit=(Integer)session.getAttribute("Ccredit");
	%>
	<%
		try{
			//加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//建立连接
			Connection conn=null;
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_keshe","root","123456");
			PreparedStatement ps=null;
			//操作数据
			String sql="insert into sc (Sno,Sname,Cno,Cname,Grade,Ccredit) values (?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,Sno);
			ps.setString(2, Sname);
			ps.setInt(3,Cno);
			ps.setString(4,Cname);
			ps.setString(5,Grade);
			ps.setInt(6, Ccredit);
			if(ps.executeUpdate()>0){
				if(Ccredit<=6){
				out.print("选课成功");
				}else{
					out.println("选课失败，超出学分限制，不能再进行选课");
				}
			}else{
				out.print("选课失败");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>

</body>
</html>