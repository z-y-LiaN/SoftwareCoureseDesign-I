package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import dao.AdminMapper;
import entity.Admin;
import utils.MybatisUtils;

public class AdminMapperImpl implements AdminMapper {
	@Override
	//获取全部管理员
		public List<Admin> getAllList(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
			List<Admin> adminList = mapper.getAllList();
			sqlSession.close();
			return adminList;	
		}	
	@Override
	//根据ID获取管理员
		public Admin getOneByPrimaryKey(String adminID){
			SqlSession sqlSession=MybatisUtils.getSqlSession();
			AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
			Admin admin=mapper.getOneByPrimaryKey(adminID);
			sqlSession.close();
			return admin;
		}
	@Override
	//增加一个管理员
		public int addOne(Admin admin){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			AdminMapper mapper= sqlSession.getMapper(AdminMapper.class);
			
			int res=mapper.addOne(admin);
			if(res>0){
				System.out.println("insert success");
			}
			//增删改 需要提交事物
			sqlSession.commit();//这句话要写，否则数据库里面插入失败
			sqlSession.close();
			return res;
		}

	@Override
	//修改管理员
		public int updateOne(Admin admin){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			AdminMapper mapper= sqlSession.getMapper(AdminMapper.class);
			int res=mapper.updateOne(admin);
			if(res>0){
				System.out.println("update admin in AdminMapperImpl success");
			}
			sqlSession.commit();
			sqlSession.close();
			return res;
		}
	@Override
	//删除管理员
		public int deleteOneByPrimaryKey(String adminID){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		AdminMapper mapper= sqlSession.getMapper(AdminMapper.class);
		int res = mapper.deleteOneByPrimaryKey(adminID);
		if(res==1){
			System.out.println("delete success");
		}
		sqlSession.commit();
		sqlSession.close();
		return res;
		}

	@Override
	//获取全部管理员数量
		public int getAllAccout(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
			List<Admin> adminList = mapper.getAllList();
			int tot=adminList.size();
			sqlSession.close();
			return tot;	
		}
}
