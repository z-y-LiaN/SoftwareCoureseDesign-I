package junitTest;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import dao.AdminMapper;
import entity.Admin;
import utils.MybatisUtils;

public class AdminMapperTest {
@Test
public void testOfGetAll(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
	List<Admin> adminList = mapper.getAllList();
	sqlSession.close();
	for (Admin admin : adminList) {
		System.out.println(admin);
	}
}
@Test
public void testUpdate(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
	Admin admin = new Admin("C姐姐","0000","1111");
	int res = mapper.updateOne(admin);
	if(res>0){
		System.out.println("update admin in AdminMapperImpl success");
	}
	sqlSession.commit();
	sqlSession.close();
}//okkk
}
