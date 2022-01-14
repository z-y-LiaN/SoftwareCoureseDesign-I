package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import entity.User;

public class ExportExcelServlet extends HttpServlet {

	public ExportExcelServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		
		HttpSession session = request.getSession();
		List<User> userlist = (ArrayList<User>) session.getAttribute("nolist");
		
		ServletOutputStream out = response.getOutputStream(); // 响应输出流对象
		HSSFWorkbook wb = new HSSFWorkbook(); // 创建Excel表格
		HSSFSheet sheet = wb.createSheet("用户注册信息"); // 创建工作薄
		sheet.setColumnWidth(4, 5000); // 设置列宽

		HSSFRow titleRow = sheet.createRow(0); // 创建Excel中的标题栏,第1行

		HSSFCell titleCell1 = titleRow.createCell(0); // 在行中创建第1个单元格
		titleCell1.setCellValue("学生姓名"); // 设置第1个单元格的值
		HSSFCell titleCell2 = titleRow.createCell(1); // 在行中创建第2个单元格
		titleCell2.setCellValue("学号"); // 设置第2个单元格的值
		HSSFCell titleCell3 = titleRow.createCell(2); // 在行中创建第3个单元格
		titleCell3.setCellValue("班级"); // 设置第3个单元格的值
		HSSFCell titleCell4 = titleRow.createCell(3); // 在行中创建第4个单元格
		titleCell4.setCellValue("联系方式"); // 设置第4个单元格的值
		//导出数据
		for(int i=0;i<userlist.size();i++){
			 HSSFRow valueRow = sheet.createRow(i+1);                  //创建第i行
		        
		        HSSFCell nameCell = valueRow.createCell(0);             //在第i行中创建单元格
		        nameCell.setCellValue(userlist.get(i).getUserName());
		        HSSFCell idCell = valueRow.createCell(1);
		        idCell.setCellValue(userlist.get(i).getUserID());
		        HSSFCell classCell = valueRow.createCell(2);
		        classCell.setCellValue(userlist.get(i).getClassNum());
		        HSSFCell telCell = valueRow.createCell(3);
		        telCell.setCellValue(userlist.get(i).getUserPhone());
		}
		HSSFCellStyle cellStyle = wb.createCellStyle();
        wb.write(out);                                   //将响应流输入到Excel表格中
        out.flush();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
