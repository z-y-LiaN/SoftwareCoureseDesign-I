package servlet;

import java.io.IOException;

import entity.Product;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;

import com.google.gson.Gson;

import dao.impl.ReportInMapperImpl;
import dao.impl.ReportOutMapperImpl;
import entity.ReportIn;
import entity.ReportOut;

public class ChartOneServlet extends HttpServlet {


	public ChartOneServlet() {
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
		//String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		ReportInMapperImpl reportInMapperImpl = new ReportInMapperImpl();
		ReportOutMapperImpl reportOutMapperImpl = new ReportOutMapperImpl();
	/*	ArrayList<String> pastDaysList = new ArrayList<>();*/
		List<Product> list = new ArrayList<Product>();
        for (int i = 6; i >=0; i--) {
            List<ReportIn> allListIn = reportInMapperImpl.getAllListByTime(getPastDate(i));
            List<ReportOut> allListOut=reportOutMapperImpl.getAllListByTime(getPastDate(i));
            int tot=allListIn.size()+allListOut.size();
            System.out.println("今天是个好日子吗"+getPastDate(i)+" 打卡 "+tot);
            list.add(new Product(getPastDate(i), tot));  
        }
        Gson gson = new Gson();
		String json1 = gson.toJson(list); // 将list中的对象转换为Json字符串
	
		//System.out.println(json);

		// 将json字符串数据返回给前端
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json1);
		
	}

	public void init() throws ServletException {
		// Put your code here
	}
	 public static String getPastDate(int past) {
	        Calendar calendar = Calendar.getInstance();
	        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
	        Date today = calendar.getTime();
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        String result = format.format(today);
	       // System.out.println(result);
	        return result;
	    }
}
