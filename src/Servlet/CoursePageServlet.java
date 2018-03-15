package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CoursePageBean;
import Bean.CourseBean;
import Dao.CourseDao;

/**
 * Servlet implementation class PageServlet
 */
public class CoursePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoursePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CourseDao udao=new CourseDao();
        int pagenumper=4;//设置每页数据数
        int pagenum=Integer.parseInt(request.getParameter("pagenum"));//获取当前页号
        int totalcount=udao.getTotalCount();//获取总数据条数
        int totalpagenum=(totalcount+pagenumper-1)/pagenumper;
        List<CourseBean> user=udao.findByPage((pagenumper*(pagenum-1)), pagenumper);
        CoursePageBean pb=new CoursePageBean();
        pb.setPagenumper(pagenumper);
        pb.setPagenum(pagenum);
        pb.setTotalpagenum(totalpagenum);
        pb.setTotalcount(totalcount);
        pb.setUser(user);
        request.setAttribute("pb", pb);
        request.getRequestDispatcher("CourseList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
