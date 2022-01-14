package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.LeaveSheetMapperImpl;
import entity.Leavesheet;

public class CheckLeaveServlet extends HttpServlet {

	public CheckLeaveServlet() {
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
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String userID=request.getParameter("userID");
		String flags=request.getParameter("flag");//==1 审核通过，==2审核拒绝
		int flag=Integer.parseInt(flags);
		System.out.println("flag = "+flag);
		LeaveSheetMapperImpl leaveSheetMapperImpl = new LeaveSheetMapperImpl();
		List<Leavesheet> ulist = leaveSheetMapperImpl.getOneByKeyState(userID, "待审核");
		System.out.print("当前的list大小: "+ulist.size());
		if(ulist.size()==1){
			Leavesheet ls=ulist.get(0);
			if(flag==1){
				System.out.print("===========进入审核通过阶段");
				int res = leaveSheetMapperImpl.updateState(ls.getUserID(), ls.getState(), "审核通过");
				if(res>0){
					System.out.println("审核 更新成功");
				}
			}else if(flag==2) {
				leaveSheetMapperImpl.updateState(ls.getUserID(), ls.getState(), "审核拒绝");
			}
		}else{
			System.out.println("------------数据库出现多个待审核 error");
		}
		request.getRequestDispatcher("CheckReadyServlet").forward(request, response);
		
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
