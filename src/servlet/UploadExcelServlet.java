package servlet;

import java.io.FileNotFoundException;




import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.impl.UserMapperImpl;
import entity.User;

public class UploadExcelServlet extends HttpServlet {

	public UploadExcelServlet() {
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
		 FileItemFactory factory = new DiskFileItemFactory();
	     ServletFileUpload upload = new ServletFileUpload(factory);
		try {
		    List items = upload.parseRequest(request);
		    InputStream is = null;
		    Iterator iter = items.iterator();
		    while (iter.hasNext()) {
		        FileItem item = (FileItem) iter.next();
		        if (!item.isFormField()) {
		            is = item.getInputStream();
		        }
		    }
		    Workbook workbook = Workbook.getWorkbook(is);
		    Sheet sheet = workbook.getSheet(0);
		    // 行数
		    int rows = sheet.getRows();
		    // 列数
		    int columns = sheet.getColumns();
		    System.out.println("行数："+rows+" 列数："+columns);
		    int tot=0;
		    for (int i = 0; i < rows; i++) {
		        if (i == 0) {// 第一行是属性，不读取
		            continue;
		        }
		        Cell ce0 = ((jxl.Sheet) sheet).getCell(0, i);
		        Cell ce1 = ((jxl.Sheet) sheet).getCell(1, i);
		        Cell ce2 = ((jxl.Sheet) sheet).getCell(2, i);
		        Cell ce3 = ((jxl.Sheet) sheet).getCell(3, i);

		        String userName = ce0.getContents();
		        String userID = ce1.getContents();
		        String classNum = ce2.getContents();
		        String userPhone = ce3.getContents();
		        UserMapperImpl userMapperImpl = new UserMapperImpl();
		        User user = new User(userName,"0000",userID,classNum,userPhone);
		        int res = userMapperImpl.addOne(user);
		        if(res>0){
		        	tot++;
		            System.out.println(tot+":"+"添加用户成功"+user);
		        }
		    }
		    PrintWriter out = response.getWriter();
		    if(tot>0){
		        out.write("success"); 
		    }else {
		        out.write("errors"); 
		    }	
		} catch (FileUploadException e) {
		    e.printStackTrace();
		} catch (BiffException e) {
		    e.printStackTrace();
		}  catch (Exception e) {
		    e.printStackTrace();
		}
	
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
