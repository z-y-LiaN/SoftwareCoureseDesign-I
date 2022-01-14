package servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import dao.impl.LeaveSheetMapperImpl;
import entity.Leavesheet;

public class CheckReadyServlet extends HttpServlet {

	public CheckReadyServlet() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 5;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		PageInfo<Leavesheet> pi = new LeaveSheetMapperImpl().statePageInfo(pageNum, pageSize,"待审核");
			System.out.println(pi.getList());
		request.setAttribute("PageInfo", pi);
		request.getRequestDispatcher("/back/leave_check_admin.jsp").forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
