package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import entity.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.ReportInMapperImpl;

//@WebServlet("/ReportIn")
public class ReportInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReportInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//String userID=(String)request.getAttribute("userID");
		HttpSession session = request.getSession();
		String userID = session.getAttribute("userID").toString();
		String temperature=request.getParameter("temperature");
		//System.out.println("temperature: "+temperature);
		String isSickString=request.getParameter("isSick");
		if(isSickString==null||isSickString==""){
			String script0 = "<script>window.location.href='welcome_user.jsp';alert('表单填写不完善，请重新填写');</script>";
			response.getWriter().println(script0);
		}

		String reportTime=request.getParameter("reportTime");
		int isSick = Integer.parseInt(isSickString);
		
		ReportIn reportIn = new ReportIn(userID,temperature,isSick,reportTime);
		System.out.println("提交的打卡记录信息为 "+reportIn);
		ReportInMapperImpl reportInMapperImpl = new ReportInMapperImpl();
		int res = reportInMapperImpl.addOne(reportIn);
	/*	PrintWriter out = response.getWriter();*/
		if(res>0){
			/*out.write("success"); */
			//
			String script = "<script>window.location.href='welcome_user.jsp';alert('今日打卡成功，请明日继续保持');</script>";
			response.getWriter().println(script);
			//response.sendRedirect("jsps/ReportInSuccess.jsp");
			System.out.println("打卡成功");
		}else{
			/*out.write("false"); */
			System.out.println("打卡失败");
		}
	}

}
