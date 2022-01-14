package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.ReportInMapperImpl;
import dao.impl.ReportOutMapperImpl;
import entity.ReportIn;
import entity.ReportOut;

public class JudgeServlet extends HttpServlet {
	public JudgeServlet() {
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
		HttpSession session=request.getSession();
		String userID = (String)session.getAttribute("userID");
		String timeToday=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		//判断是否已经打卡 在校
		ReportInMapperImpl reportInMapperImpl = new ReportInMapperImpl();
		List<ReportIn> rin = reportInMapperImpl.getAllListByTime(timeToday);
		for (int i = 0; i < rin.size(); i++) {
			if(rin.get(i).getUserID().equals(userID)){
				//返回数据，在原jsp显示今日已打卡，请明日再来
			}
		}
		//判断是否已经打卡 非在校
		 ReportOutMapperImpl reportOutMapperImpl = new ReportOutMapperImpl();
		 List<ReportOut> rou = reportOutMapperImpl.getAllListByTime(timeToday);
		for (int j = 0; j <rou.size() ; j++) {
			if(rou.get(j).getUserID().equals(userID)){
				//返回数据，在原jsp显示今日已打卡，请明日再来
			}
		}
		//暂未写完
		//否则 跳到相应的 各自处理的servlet，这里需要原jsp绑定一个参数来判断
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
