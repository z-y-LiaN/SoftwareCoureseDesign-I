package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.NoticeMapperImpl;
import entity.Notice;

public class NoticeServlet extends HttpServlet {
	public NoticeServlet() {
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
		//获取newsID
		String noticeIDString=request.getParameter("noticeID");
		//如果newsID==null，默认为最大（显示最新
		NoticeMapperImpl noticeMapperImpl = new NoticeMapperImpl();
		if(noticeIDString==null){
			Notice newOne = noticeMapperImpl.getNewOne();
			noticeIDString=String.valueOf(newOne.getNoticeID());
		}
		int noticeID=Integer.parseInt(noticeIDString);
		//set news,set MainPage
		Notice notice = noticeMapperImpl.getOneByPrimaryKey(noticeID);
		List<Notice> allList = noticeMapperImpl.getAllList();
		/*for (Notice notice2 : allList) {
			System.out.println("NOw   :"+notice2);
		}*/
		HttpSession session = request.getSession();
		session.setAttribute("notice", notice);
		//request.setAttribute("notice", notice);
		session.setAttribute("allList", allList);
		//request.setAttribute("allList", allList);
		
		request.setAttribute("mainPage", "noticeShow.jsp");
		request.setAttribute("IDforGet", "1");
		//跳到通知页面
		//request.getRequestDispatcher("notice.jsp").forward(request, response);
		//request.getRequestDispatcher("welcome_user.jsp?IDforGet='1'").forward(request, response);
		request.getRequestDispatcher("welcome_user.jsp").forward(request, response);
		//在通知页面 MainPage单独写一个，jsp include
		//
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
