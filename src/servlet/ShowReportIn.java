package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import dao.impl.ReportInMapperImpl;
import entity.ReportIn;

//@WebServlet("/ShowReportIn")
public class ShowReportIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShowReportIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 第一次访问的验证,如果没有传递参数,设置默认值
		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 2;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
				
		String pageNumberStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		PageInfo<ReportIn> pi = new ReportInMapperImpl().riPageInfo(pageNum, pageSize);
			System.out.println(pi.getList());
		request.setAttribute("PageInfo", pi);
		request.getRequestDispatcher("manageRI.jsp").forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
