package servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.LeaveSheetMapperImpl;
import entity.Leavesheet;

public class AddLeaveServlet extends HttpServlet {


	public AddLeaveServlet() {
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
		String userID = request.getParameter("userID");
		String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"UTF-8");
//
		String outDate=request.getParameter("outDate");
		
		String returnDate=request.getParameter("returnDate");
		//eTime=eTime.replaceAll("T", " ")
		outDate=outDate.replaceAll("T", " ");returnDate=returnDate.replaceAll("T", " ");
		//System.out.println(outDate+"        "+returnDate);
		//中文乱码解决：new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");	
		String outThing=new String(request.getParameter("outThing").getBytes("ISO-8859-1"),"UTF-8");	
		String situation=new String(request.getParameter("situation").getBytes("ISO-8859-1"),"UTF-8");
		String note=new String(request.getParameter("note").getBytes("ISO-8859-1"),"UTF-8");	
		String state="待审核";
		Leavesheet sheet=new Leavesheet(userID,outDate,returnDate,state,outThing,situation,note,userName);
		LeaveSheetMapperImpl leaveSheetMapperImpl = new LeaveSheetMapperImpl();
		int res = leaveSheetMapperImpl.addOne(sheet);
		if(res>0){
			String script = "<script>window.location.href='welcome_user.jsp';alert('请假单已成功提交 ,等待辅导员审核');</script>";
			response.getWriter().println(script);
			System.out.println("AddLeaveServlet: 新增一个请假单成功:"+sheet);
		}else{
			System.out.println("AddLeaveServlet: 新增一个请假单失败"+sheet);
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
