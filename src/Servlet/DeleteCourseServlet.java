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
 * Servlet implementation class DeleteStudentServlet
 */
public class DeleteCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        CourseDao udao=new CourseDao();
        CourseBean user=new CourseBean();
        if(udao.delete(Integer.parseInt(request.getParameter("Cno"))))
        {
            out.println("É¾³ý³É¹¦");
            response.sendRedirect("CoursePageServlet?pagenum=1");
            
        }else{
            out.println("É¾³ýÊ§°Ü");
        }
        response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    doGet(request, response);
	}

}
