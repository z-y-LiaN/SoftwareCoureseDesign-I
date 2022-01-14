package dao;

import java.util.List;

import com.github.pagehelper.PageInfo;

import entity.User;

public interface UserMapper {

//查询全部用户
	List<User> getAllList();
	
//根据id查询用户
	User getOneByPrimaryKey(String userID);
	
//根据班级查询用户
	List<User> getAllListByClass(String classNum);
	
//模糊查询
	List<User> getAllByString(String infoString);
	
//新增一个学生用户
	int addOne(User user);
	
//修改用户
	int updateOne(User user);
	
//删除用户
	int deleteOneByPrimaryKey(String userID);
	
//获取全部用户数量
	public int getAllAccout();
	
//分页全部
	PageInfo<User> userPageInfo(int pageNum,int pageSize);
	
//根据查询分页
	PageInfo<User> queryPageInfo(int pageNum,int pageSize,String infoString);
}
