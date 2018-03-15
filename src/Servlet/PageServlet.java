package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.PageBean;
import Bean.StudentBean;
import Dao.StudentDao;

/**
 * Servlet implementation class PageServlet
 */
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    StudentDao udao=new StudentDao();
        int pagenumper=4;//璁剧疆姣忛〉鏁版嵁鏁�
        int pagenum=Integer.parseInt(request.getParameter("pagenum"));//鑾峰彇褰撳墠椤靛彿
        int totalcount=udao.getTotalCount();//鑾峰彇鎬绘暟鎹潯鏁�
        int totalpagenum=(totalcount+pagenumper-1)/pagenumper;
        List<StudentBean> user=udao.findByPage((pagenumper*(pagenum-1)), pagenumper);
        PageBean pb=new PageBean();
        pb.setPagenumper(pagenumper);
        pb.setPagenum(pagenum);
        pb.setTotalpagenum(totalpagenum);
        pb.setTotalcount(totalcount);
        pb.setUser(user);
        request.setAttribute("pb", pb);
        request.getRequestDispatcher("StudentList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
