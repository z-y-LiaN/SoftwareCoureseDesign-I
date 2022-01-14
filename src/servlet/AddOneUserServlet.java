package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.UserMapperImpl;
import entity.User;

public class AddOneUserServlet extends HttpServlet {

	public AddOneUserServlet() {
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
		PrintWriter out = response.getWriter();
		
		String userID = request.getParameter("userID");
		String userPhone=request.getParameter("userPhone");
		//URLDecoder.decode(userName,"utf-8");解决ajax中文乱码问题
		String userName = URLDecoder.decode(request.getParameter("userName"),"UTF-8");
		String classNum = URLDecoder.decode(request.getParameter("classNum"),"UTF-8");
		//String userName=request.getParameter("userName");
		//String classNum=request.getParameter("classNum");
		//String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"UTF-8");
		//String classNum=new String(request.getParameter("classNum").getBytes("ISO-8859-1"),"UTF-8");
		User user = new User(userName,"0000",userID,classNum,userPhone);//初始密码0000
		UserMapperImpl userMapperImpl = new UserMapperImpl();
		int res = userMapperImpl.addOne(user);
		
		if(res>0){
			out.write("success"); System.out.println("新增一位学生成功: "+user);
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
