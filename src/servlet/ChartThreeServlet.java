package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.impl.LeaveSheetMapperImpl;
import dao.impl.NoticeMapperImpl;
import entity.Product;

public class ChartThreeServlet extends HttpServlet {
	public ChartThreeServlet() {
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
		LeaveSheetMapperImpl leaveSheetMapperImpl = new LeaveSheetMapperImpl();
		List<Product> list = new ArrayList<Product>();
		list.add(new Product("请假返家", leaveSheetMapperImpl.getAllListByKind("请假返家").size()));
		list.add(new Product("外出就医", leaveSheetMapperImpl.getAllListByKind("外出就医").size()));
		list.add(new Product("物资购置", leaveSheetMapperImpl.getAllListByKind("物资购置").size()));
		list.add(new Product("其他原因", leaveSheetMapperImpl.getAllListByKind("其他原因").size()));
		Gson gson = new Gson();
		String json = gson.toJson(list); // 将list中的对象转换为Json字符串
		System.out.println(json);
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
