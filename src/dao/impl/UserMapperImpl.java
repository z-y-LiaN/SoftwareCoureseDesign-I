package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


import dao.UserMapper;

import entity.User;
import utils.MybatisUtils;

public class UserMapperImpl implements dao.UserMapper{
@Override
//获取全部学生用户
	public List<User> getAllList(){
		//获取sqlSession对象
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		
		//执行Sql 这里的mapper就相当于曾经的userDao
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> userList = mapper.getAllList();
		sqlSession.close();
		return userList;	
	}	
@Override
//根据班级查询用户
	public List<User> getAllListByClass(String classNum){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> list = mapper.getAllListByClass(classNum);
		sqlSession.close();
		return list;
	}
@Override
//模糊查询
	public List<User> getAllByString(String infoString){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> list = mapper.getAllByString(infoString);
		sqlSession.close();
		return list;
}
@Override
//根据ID获取学生
	public User getOneByPrimaryKey(String userID){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		User user=mapper.getOneByPrimaryKey(userID);
		sqlSession.close();
		return user;
	}
@Override
//增加一个学生
	public int addOne(User user){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		UserMapper mapper= sqlSession.getMapper(UserMapper.class);
		
		int res=mapper.addOne(user);
		if(res>0){
			System.out.println("insert success");
		}
		//增删改 需要提交事物
		sqlSession.commit();//这句话要写，否则数据库里面插入失败
		sqlSession.close();
		return res;
	}

@Override
//修改学生
	public int updateOne(User user){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper= sqlSession.getMapper(UserMapper.class);
	int res=mapper.updateOne(user);
	if(res>0){
		System.out.println("update success");
	}
	sqlSession.commit();
	sqlSession.close();
	return res;
	}
@Override
//删除学生
	public int deleteOneByPrimaryKey(String userID){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper= sqlSession.getMapper(UserMapper.class);
	int res = mapper.deleteOneByPrimaryKey(userID);
	if(res==1){
		System.out.println("delete success");
	}
	sqlSession.commit();
	sqlSession.close();
	return res;
	}

@Override
//获取全部学生数量
	public int getAllAccout(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> userList = mapper.getAllList();
		int tot=userList.size();
		sqlSession.close();
		return tot;	
	}
//分页全部
	public PageInfo<User> userPageInfo(int pageNum,int pageSize){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		PageHelper.startPage(pageNum, pageSize);
		List<User> list=mapper.getAllList();
		PageInfo<User> p=new PageInfo<User>(list);
		sqlSession.close();
		return p;
	}
//根据查询分页
		public PageInfo<User> queryPageInfo(int pageNum,int pageSize,String infoString){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<User> list = mapper.getAllByString(infoString);
			PageInfo<User> p=new PageInfo<User>(list);
			sqlSession.close();
			return p;
		}
}
