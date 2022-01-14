package dao;

import java.util.List;
import entity.Admin;

public interface AdminMapper {
	//查询全部管理员
		List<Admin> getAllList();
		
	//根据id查询管理员
		Admin getOneByPrimaryKey(String adminID);
		
	//新增一个学生管理员
		int addOne(Admin admin);
		
	//修改管理员
		int updateOne(Admin admin);
		
	//删除管理员
		int deleteOneByPrimaryKey(String adminID);
		
	//获取全部管理员数量
		public int getAllAccout();
}
