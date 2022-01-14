package servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.impl.ReportInMapperImpl;
import entity.ReportIn;

//@WebServlet("/ManageReportInByPage")
public class ManageReportInByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManageReportInByPageServlet() {
        super();
    }
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");	
		
		HttpSession session = request.getSession(false);
		if(session == null){
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		int page;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("Page"));
		}else{
			page = 1;
		}
			//PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，
			//page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 2);
	      //查询
	      ReportInMapperImpl reportInMapperImpl = new ReportInMapperImpl();
	      List<ReportIn> reportIns=reportInMapperImpl.getAllList();
	      
	      //创建PageInfo对象，保存查询出的结果，PageInfo是pageHelper中的对象

	      PageInfo<ReportIn> p=new PageInfo<ReportIn>(reportIns);
	     
	      //将数据存放到request域中
	      request.setAttribute("page", p);
	      request.setAttribute("reportIns",reportIns);
	      
	      //返回页面
	     // response.sendRedirect("manageRI.jsp");
	      request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
