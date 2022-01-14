package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageInfo;

import dao.impl.ReportInMapperImpl;
import dao.impl.ReportOutMapperImpl;
import dao.impl.UserMapperImpl;
import entity.Product;
import entity.ReportIn;
import entity.ReportOut;
import entity.User;

public class ReportTodayServlet extends HttpServlet {

	public ReportTodayServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 5;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
				pageSize = Integer.parseInt(pageSizeStr);
		}
		/////////////////////////////////////////////////////////////////////		
		String pageNumberStr = request.getParameter("pageNum");
		String timeString=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		int pageNum = 1;
		if (pageNumberStr != null && !pageNumberStr.equals("")) {
			pageNum = Integer.parseInt(pageNumberStr);
		}
		//
		String pageNumberStr2 = request.getParameter("pageNum2");
		int pageNum2 = 1;
		if (pageNumberStr2 != null && !pageNumberStr2.equals("")) {
			pageNum2 = Integer.parseInt(pageNumberStr2);
		}

		
		/////////////在校学生今日打卡分页//////////////////
		PageInfo<ReportIn> ipi = new ReportInMapperImpl().timeInPageInfo(pageNum, pageSize, timeString);
		request.setAttribute("InPageInfo", ipi);
		System.out.print("在校学生今日打卡名单"+ipi);
		////////////非在校学生今日打卡分页//////////////////
		PageInfo<ReportOut> opi = new ReportOutMapperImpl().timePageInfo(pageNum2, pageSize, timeString);
		request.setAttribute("OuPageInfo", opi);
		
		////未打卡学生//////////////////////////////////
		UserMapperImpl userMapperImpl = new UserMapperImpl();
		List<User> allusers = userMapperImpl.getAllList(); //获取全部学生
		
		ReportInMapperImpl reportInMapperImpl = new ReportInMapperImpl();
		List<ReportIn> allReportIns = reportInMapperImpl.getAllListByTime(timeString); //获取全部已经今日在校打卡学生
		int totIn=allReportIns.size();
		
		ReportOutMapperImpl reportOutMapperImpl=new ReportOutMapperImpl();
		List<ReportOut> allReportOuts = reportOutMapperImpl.getAllListByTime(timeString);//获取全部今日非在校打卡学生
		int totOut=allReportOuts.size();
		/*System.out.println();*/
		int tot = userMapperImpl.getAllAccout();
		System.out.println("学生总人数: "+tot+" 已打卡人数 "+totIn+" 未打卡人数:"+totOut);
		
		List<User> nolist=new ArrayList<User>(); //记录为打卡学生
		
		for(int i=0;i<tot;i++){
			User user = allusers.get(i);
			String userID=user.getUserID();
			int flag=0;
			for(int j=0;j<totIn;j++){
				String inuserID=allReportIns.get(j).getUserID();
				//System.out.println(inuserID+"[ ?= ]"+userID);
				if(inuserID.equals(userID)){ //一旦属于在校打卡名单，break掉
					//System.out.println("循环中属于在校打卡名单："+userID);
					flag=-1;
					break;
				}else{
					flag++;
				}
			}
			if(flag==-1) continue;
			if(flag==totIn){ //flag一直加到totIn都不等，说明不在那里面，判断是否在下面里面
				flag=0;
				for(int k=0;k<totOut;k++){
					if(allReportOuts.get(k).getUserID().equals(userID)){
						flag=-1;break;
					}else{
						flag++;
					}
				}
				if(flag==totOut){
					nolist.add(userMapperImpl.getOneByPrimaryKey(userID));
					//System.out.println("未打卡学生: "+userID);
				}
			}
		
		}
		for (User users : nolist) {
			System.out.println(users);
		}
		/*request.setAttribute("nolist", nolist);*/
		session.setAttribute("nolist", nolist);
		
		
		
		request.getRequestDispatcher("/back/report_today.jsp").forward(request, response);
		
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
