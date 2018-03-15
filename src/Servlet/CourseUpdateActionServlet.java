package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CourseBean;
import Dao.CourseDao;

/**
 * Servlet implementation class StudentUpdateActionServlet
 */
public class CourseUpdateActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseUpdateActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    PrintWriter Out =response.getWriter();
        request.setCharacterEncoding("UTF-8");
        CourseBean user=new CourseBean();
        String cname = new String(request.getParameter("Cname").getBytes("ISO-8859-1"),"utf-8");
        String tname = new String(request.getParameter("Tname").getBytes("ISO-8859-1"),"utf-8");
        user.setCno(Integer.parseInt(request.getParameter("Cno")));
	    user.setCname(cname);
	    user.setTno(Integer.parseInt(request.getParameter("Tno")));
	    user.setTname(tname);
	    user.setCcredit(Integer.parseInt(request.getParameter("Ccredit")));
	
	    CourseDao udao=new CourseDao();
        if(udao.update(user))
        {
            Out.println("更新成功");
            response.sendRedirect("CoursePageServlet?pagenum=1");
        }
        else{
            Out.println("更新失败");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    doGet(request, response);
	}

}
