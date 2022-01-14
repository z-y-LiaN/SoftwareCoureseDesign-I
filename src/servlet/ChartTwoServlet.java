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

import dao.impl.UserMapperImpl;
import entity.Product;

public class ChartTwoServlet extends HttpServlet {

	public ChartTwoServlet() {
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
		//根据班级获取人数
		UserMapperImpl userMapperImpl = new UserMapperImpl();
		List<Product> list = new ArrayList<Product>();
		list.add(new Product("软工一班", userMapperImpl.getAllListByClass("软工一班").size()));
		list.add(new Product("智能一班", userMapperImpl.getAllListByClass("智能一班").size()));
		list.add(new Product("网安一班", userMapperImpl.getAllListByClass("网安一班").size()));
		list.add(new Product("计科一班", userMapperImpl.getAllListByClass("计科一班").size()));
		Gson gson = new Gson();
		String json = gson.toJson(list); // 将list中的对象转换为Json字符串
		System.out.println(json);
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
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
