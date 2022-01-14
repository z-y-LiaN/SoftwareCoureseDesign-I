package servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import dao.impl.UserMapperImpl;
import entity.User;


public class UsersInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UsersInfoServlet() {
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");	
		
		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 10;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		PageInfo<User> pi = new UserMapperImpl().userPageInfo(pageNum, pageSize);
		//System.out.println(pi.getList());
		request.setAttribute("PageInfo", pi);
		request.getRequestDispatcher("/back/users_info.jsp").forward(request, response);
		
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
