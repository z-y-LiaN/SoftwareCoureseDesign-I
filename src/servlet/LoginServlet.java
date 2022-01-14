package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.impl.NoticeMapperImpl;
import entity.Admin;
import entity.Notice;
import entity.User;
import service.AdminService;
import service.UserService;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置页面编码格式
				response.setHeader("content-type","text/html;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				
				String ID=request.getParameter("userID");
				String Pwd=request.getParameter("userPwd");
				String type=request.getParameter("type");
				String msg="";
				HttpSession session = request.getSession();
				
		//普通用户登录
				if(type.equals("user")){
					UserService userService=new UserService();
					User user=userService.Login(ID,Pwd);
					System.out.println(user);
					if(user!=null){					
						System.out.println("=======用户登录成功=========");
						session.setAttribute("UserInfo", user);
						session.setAttribute("NowUser",user.getUserName() );
						session.setAttribute("userID", ID);
						request.getRequestDispatcher("welcome_user.jsp").forward(request, response);
						
					}else{
						msg="登录失败：用户名或密码错误,请重新输入";
						request.setAttribute("message", msg);
						System.out.println("用户登录失败");
						String script="<script>alert('用户名或密码错误，请重新登陆');location.href='index.jsp?#login'</script>";
						response.getWriter().println(script);
						
				}
					
			}
				
				else if(type.equals("admin")){
						AdminService adminService = new AdminService();
						Admin admin = adminService.Login(ID, Pwd);
						System.out.println(admin);
						if(admin!=null){
							session.setAttribute("adminID", ID);
							session.setAttribute("adminName", admin.getAdminName());
							System.out.println("=========管理员登录成功，跳到管理员页面=========");
							response.sendRedirect("back/admin.jsp");
							//request.getRequestDispatcher("back/admin.jsp").forward(request, response);
						}
						else{
							msg="登录失败：用户名或密码错误,请重新输入";
							request.setAttribute("message", msg);
							System.out.println("管理员登录失败");
							String script="<script>alert('用户名或密码错误，请重新登陆');location.href='index.jsp?#login'</script>";
							response.getWriter().println(script);
						}
					
				}
	}

}
