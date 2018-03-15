package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.LoginBean;
import Bean.StudentBean;
import Dao.StudentDao;

/**
 * Servlet implementation class StudentLoginServlet
 */
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8");
        LoginBean luser=new LoginBean();
        luser.setSno(request.getParameter("Sno"));
        luser.setSpsw(request.getParameter("Spsw"));
        StudentDao udao=new StudentDao();
          if(udao.isRegUser(luser)){
              StudentBean user=udao.findByNum(luser.getSno());
              request.getSession().setAttribute("number", luser.getSno());                 
              request.getSession().setAttribute("id", user.getSid());
              request.getSession().setAttribute("name", user.getSname());
              response.sendRedirect("HomeIndex.jsp");     
          }else if((request.getParameter("Sno").equals("admin")) && (request.getParameter("Spsw").equals("123456"))){
              request.getSession().setAttribute("name", request.getParameter("Sno"));
              response.sendRedirect("index.jsp");     
          }else{
                 String message="µÇÂ½Ê§°Ü";
                 request.setAttribute("message", message);
                 request.getRequestDispatcher("Login.jsp").forward(request, response);
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
