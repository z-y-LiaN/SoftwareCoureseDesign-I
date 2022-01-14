package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageInfo;

import dao.impl.LeaveSheetMapperImpl;
import entity.Leavesheet;

public class LeaveServlet extends HttpServlet {

	public LeaveServlet() {
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

		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userID = session.getAttribute("userID").toString();
	//
		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 4;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
	//
		PageInfo<Leavesheet> pi = new LeaveSheetMapperImpl().idPageInfo(pageNum, pageSize, userID);
		//System.out.println(pi.getList());
		List<Leavesheet> list = new LeaveSheetMapperImpl().getOneByPrimaryKey(userID);
		session.setAttribute("list", list);
		session.setAttribute("PageInfo", pi);
		request.setAttribute("IDforLeave", "2");
		request.getRequestDispatcher("welcome_user.jsp").forward(request, response);
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
