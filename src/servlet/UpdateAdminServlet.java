package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.AdminMapperImpl;
import entity.Admin;

public class UpdateAdminServlet extends HttpServlet {

	public UpdateAdminServlet() {
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
		HttpSession  session = request.getSession();
		PrintWriter out = response.getWriter();
		//URLDecoder.decode(userName,"utf-8");解决ajax中文乱码问题
		String adminName = URLDecoder.decode(request.getParameter("adminName"),"UTF-8");
		String adminPwd = request.getParameter("adminPwd");
		String adminID = session.getAttribute("adminID").toString();
		Admin admin = new Admin(adminName,adminPwd,adminID);
		AdminMapperImpl adminMapperImpl = new AdminMapperImpl();
		int res = adminMapperImpl.updateOne(admin);
		if(res>0){
			out.write("success"); 
			System.out.println("======In UpdateAdminServlet: 管理员信息更新成功: "+admin);
		}else {
			out.write("false");
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
