package junitTest;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.UserMapper;
import entity.User;
import utils.MybatisUtils;

public class UserMapperTest {
@Test
public void test(){
	//获取sqlSession对象
	SqlSession sqlSession = MybatisUtils.getSqlSession();
		//方式一：执行Sql
	UserMapper userDao = sqlSession.getMapper(UserMapper.class);
	List<User> userList = userDao.getAllList();
	sqlSession.close();	
	for (User user:userList) {
		System.out.println(user);
		
	}
	//关闭
	
	}

@Test
public void addUser(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper= sqlSession.getMapper(UserMapper.class);
	
	int res=mapper.addOne(new User("蔡瑾瑶","0000","919106840501","软工一班","12345678901"));
	if(res>0){
		System.out.println("success");
	}
	//增删改 需要提交事物
	sqlSession.commit();//这句话要写，否则数据库里面插入失败
	sqlSession.close();
	}

@Test
public void updateUser(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper= sqlSession.getMapper(UserMapper.class);
	int res=mapper.updateOne(new User("蔡瑾瑶","9999","919106840501","软工一班","98765432109"));
	if(res>0){
		System.out.println("success");
	}
	sqlSession.commit();
	sqlSession.close();
}
@Test
public void deleteUser(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper= sqlSession.getMapper(UserMapper.class);
	int res = mapper.deleteOneByPrimaryKey("919106840501");
	if(res==1){
		System.out.println("success");
	}
	sqlSession.commit();
	sqlSession.close();
	
}
@Test
public void testPage(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
	PageHelper.startPage(1, 3);
	List<User> list=mapper.getAllList();
	PageInfo<User> p=new PageInfo<User>(list);
	for (User user : list) {
		System.out.println(user);
	}
	System.out.println(p.getPages()+" "+p.getTotal());
	sqlSession.close();
}//test success
@Test
	public void testGetByClass(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> userList=mapper.getAllListByClass("软工一班");
		for (User user : userList) {
			System.out.println(user);
		}
		sqlSession.close();
}//ok
@Test
	public void getAllByS(){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		List<User> list = mapper.getAllByString("9191068408");
		for (User user : list) {
			System.out.println(user);
		}
		sqlSession.close();
}//okk
@Test
	public void queryP(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
	PageHelper.startPage(1, 2);
	List<User> list = mapper.getAllByString("软工一班");
	PageInfo<User> p=new PageInfo<User>(list);
	System.out.println(p);
}//okkk

}

