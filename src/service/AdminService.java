package service;

import java.util.List;

import dao.AdminMapper;
import dao.impl.AdminMapperImpl;
import entity.Admin;

public class AdminService {
	
	//登录
		public Admin Login(String adminID, String adminPwd) {
			AdminMapper adminMapper=new AdminMapperImpl();
			List<Admin> admins=adminMapper.getAllList();
			System.out.println("获得的admins当前全部数量为 "+admins.size());
			for (Admin admin : admins) {
				//System.out.println(user);
				if(admin.getAdminID().equals(adminID)&&admin.getAdminPwd().equals(adminPwd)) {
					return admin;
				}
			}
			return null;
		}
	//注册，新增用户管理员
		public int Register(String adminName, String adminPwd, String adminID) {
			AdminMapper adminMapper=new AdminMapperImpl();
			int flag=ifAdmin(adminID);
			if(flag!=0)
				return flag;
			Admin admin=new Admin();
			admin.setAdminID(adminID);
			admin.setAdminName(adminName);
			admin.setAdminPwd(adminPwd);
			return adminMapper.addOne(admin);
		}
	//新增前判断改用户是否存在
		int ifAdmin(String adminID) {
			AdminMapper adminMapper=new AdminMapperImpl();
			List<Admin> admins=adminMapper.getAllList();
			for (Admin admin : admins) {
				if(admin.getAdminID().equals(adminID)){
					return -1;//ID已经存在，用户已经存在
				}
			}
			return 0;
		}
	//修改用户信息
		public int Update(Admin admin) {
			AdminMapper adminMapper=new AdminMapperImpl();
			int flag=ifAdmin(admin.getAdminID());
			if(flag==0)
				return flag; //表示改用户不存在需要注册
			return adminMapper.updateOne(admin);
		}
}
