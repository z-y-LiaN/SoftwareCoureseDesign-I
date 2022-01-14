package service;

import java.util.List;

import dao.UserMapper;
import dao.impl.UserMapperImpl;
import entity.User;

public class UserService {
	
//登录
	public User Login(String userID, String userPwd) {
		UserMapper userMapper=new UserMapperImpl();
		List<User> users=userMapper.getAllList();
		System.out.println("获得的users当前全部数量为 "+users.size());
		for (User user : users) {
			//System.out.println(user);
			if(user.getUserID().equals(userID)&&user.getUserPwd().equals(userPwd)) {
				return user;
			}
		}
		return null;
	}
//注册，用户管理员新增学生
	public int Register(String userName, String userPwd, String userID, String classNum, String userPhone) {
		UserMapper userMapper=new UserMapperImpl();
		int flag=ifUser(userID,userPhone);
		if(flag!=0)
			return flag;
		User user=new User();
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		user.setUserID(userID);
		user.setClassNum(classNum);
		user.setUserPhone(userPhone);
		return userMapper.addOne(user);
	}
//新增前判断改用户是否存在
	int ifUser(String userID ,String userPhone) {
		UserMapper userMapper=new UserMapperImpl();
		List<User> users=userMapper.getAllList();
		for (User user : users) {
			if(user.getUserID().equals(userID)){
				return -1;//ID已经存在，用户已经存在
			}else if (user.getUserPhone().equals(userPhone)) {
				return -2;//电话已经存在
			}
		}
		return 0;
	}
//修改用户信息
	public int Update(User user) {
		UserMapper userMapper=new UserMapperImpl();
		int flag=ifUser(user.getUserID(),user.getUserPhone());
		if(flag==0)
			return flag; //表示改用户不存在需要注册
		return userMapper.updateOne(user);
	}
}
