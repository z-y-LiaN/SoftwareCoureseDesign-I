package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.internal.runners.TestMethod;

import dao.impl.ReportOutMapperImpl;
import entity.ReportOut;

//@WebServlet("/ReportOutServlet")
public class ReportOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ReportOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
	//获取 当前session的userID
		HttpSession session = request.getSession();
		String userID = session.getAttribute("userID").toString();
	//中文乱码解决：new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");	
		String temperature=request.getParameter("temperature");
		String isSickString=request.getParameter("isSick");
		int isSick = Integer.parseInt(isSickString);
		String reportTime=request.getParameter("reportTime");
		//String codeState=request.getParameter("codeState");
		String codeState=new String(request.getParameter("codeState").getBytes("ISO-8859-1"),"UTF-8");

		String dosageString=request.getParameter("dosage");
		int dosage=Integer.parseInt(dosageString);
		String isIsolatedString=request.getParameter("isIsolated");
		int isIsolated=Integer.parseInt(isIsolatedString);
		String isDangerousString=request.getParameter("isDangerous");
		int isDangerous=Integer.parseInt(isDangerousString);
		
		String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");	
		String extraInfo=new String(request.getParameter("extraInfo").getBytes("ISO-8859-1"),"UTF-8");	
	//封装
		ReportOut reportOut = new ReportOut(userID,temperature,isSick,reportTime,codeState,dosage,isIsolated,isDangerous,address,extraInfo);
		System.out.println("提交的非在校学生打卡记录信息为：  "+reportOut);
		ReportOutMapperImpl reportOutMapperImpl = new ReportOutMapperImpl();
		int res = reportOutMapperImpl.addOne(reportOut);
		if(res>0){
			String script = "<script>window.location.href='welcome_user.jsp';alert('今日打卡成功，请明日继续保持');</script>";
			response.getWriter().println(script);
			//response.sendRedirect("jsps/ReportOutSuccess.jsp");
			System.out.println("非在校学生 "+userID+" 打卡成功");
		}else{
			System.out.println("打卡失败");
		}
		
	
	}

}
