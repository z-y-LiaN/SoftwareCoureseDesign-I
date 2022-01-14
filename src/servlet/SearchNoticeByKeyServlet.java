package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import dao.impl.NoticeMapperImpl;
import entity.Notice;

public class SearchNoticeByKeyServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public SearchNoticeByKeyServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String pageSizeStr = request.getParameter("pageSize");
		String keywords=request.getParameter("keywords");
		int pageSize = 5;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		/*                          */
		PageInfo<Notice> pi = new NoticeMapperImpl().queryPageInfo(pageNum, pageSize, keywords);
		request.setAttribute("PageInfo", pi);
		request.setAttribute("lightkey", keywords);
		System.out.println("_________request.getAttribute(PageInfo)"+request.getAttribute("PageInfo"));
		System.out.println("==========pi.getList().size() = "+pi.getList().size());
		System.out.println(pi.getList());
		
		request.getRequestDispatcher("/back/notice_manage_admin.jsp").forward(request, response);
		
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
