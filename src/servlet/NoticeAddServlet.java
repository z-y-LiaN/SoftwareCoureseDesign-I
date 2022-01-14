package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.NoticeMapperImpl;
import entity.Notice;

public class NoticeAddServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public NoticeAddServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String noticeTitle=new String(request.getParameter("noticeTitle").getBytes("ISO-8859-1"),"UTF-8");
		String noticeContent=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		String outTime=request.getParameter("outTime");
		Notice notice = new Notice(noticeTitle,noticeContent,outTime);
		NoticeMapperImpl noticeMapperImpl = new NoticeMapperImpl();
		int res = noticeMapperImpl.addOne(notice);
		if(res>0){
			System.out.println("NoticeAddServlet：通知发布成功");
			request.setAttribute("INFOcode", "success");
			request.getRequestDispatcher("/back/notice_add_admin.jsp").forward(request, response);
		}
		
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
