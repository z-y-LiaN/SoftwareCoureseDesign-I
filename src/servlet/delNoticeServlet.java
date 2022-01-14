package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.SUCCESSFUL;

import dao.impl.NoticeMapperImpl;

public class delNoticeServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public delNoticeServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String infos=request.getParameter("delitems");
		String[] items = infos.split(",");
		NoticeMapperImpl noticeMapperImpl = new NoticeMapperImpl();
		int flag=0;
		for(int i=0;i<items.length;i++){
			int id=Integer.parseInt(items[i]);
			int res = noticeMapperImpl.deleteOneByPrimaryKey(id);
			if(res>0) flag++;
		}
		if(flag==items.length)	out.write("success");
		else out.write("false");
		
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
