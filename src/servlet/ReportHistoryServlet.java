package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import dao.impl.ReportInMapperImpl;
import dao.impl.ReportOutMapperImpl;
import entity.ReportIn;
import entity.ReportOut;

public class ReportHistoryServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public ReportHistoryServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 5;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
		/////////////////////////////////////////////////////////////////////		
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		String pageNumberStr2 = request.getParameter("pageNum2");
		int pageNum2 = 1;
		if (pageNumberStr2 != null && !pageNumberStr2.equals("")) {
			pageNum2 = Integer.parseInt(pageNumberStr2);
		}
		
		/////////////在校学生历史打卡//////////////////
		PageInfo<ReportIn> ipi = new ReportInMapperImpl().riPageInfo(pageNum, pageSize);
			//System.out.println(ipi.getList());
		request.setAttribute("InPageInfo", ipi);
		////////////非在校学生历史打卡//////////////////
		PageInfo<ReportOut> opi = new ReportOutMapperImpl().roPageInfo(pageNum2, pageSize);
		request.setAttribute("OuPageInfo", opi);
		
		request.getRequestDispatcher("/back/report_history.jsp").forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
