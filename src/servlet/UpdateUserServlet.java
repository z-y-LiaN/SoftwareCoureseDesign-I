package servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.UserMapperImpl;
import entity.User;

public class UpdateUserServlet extends HttpServlet {

	public UpdateUserServlet() {
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
		UserMapperImpl userMapperImpl = new UserMapperImpl();
		
		String userPwd = request.getParameter("userPwd");
		String userPhone=request.getParameter("userPhone");
		String userID=(String)session.getAttribute("userID");
		String userName=(String)session.getAttribute("NowUser");
		String classNum=userMapperImpl.getOneByPrimaryKey(userID).getClassNum();
		User user = new User(userName,userPwd,userID,classNum,userPhone);
		int res = userMapperImpl.updateOne(user);
		if(res>0){
			out.write("success"); 
			System.out.println("======In UpdateAdminServlet: 个人信息更新成功: "+user);
		}else {
			out.write("false");
		}
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
