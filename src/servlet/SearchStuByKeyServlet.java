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

public class SearchStuByKeyServlet extends HttpServlet {


	public SearchStuByKeyServlet() {
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
		String infoString=request.getParameter("infoString");
		int pageSize = 10;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		PageInfo<User> pi = new UserMapperImpl().queryPageInfo(pageNum, pageSize, infoString);
		request.setAttribute("PageInfo", pi);
		request.setAttribute("lightkey", infoString);
		/*System.out.println("______stu___request.getAttribute(PageInfo)"+request.getAttribute("PageInfo"));
		System.out.println("==========pi.getList().size() = "+pi.getList().size());*/
		request.getRequestDispatcher("/back/users_info.jsp").forward(request, response);
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
