package junitTest;
import java.util.List;
import java.util.logging.Level;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.LeaveSheetMapper;
import dao.impl.LeaveSheetMapperImpl;
import entity.Leavesheet;
import utils.MybatisUtils;

public class LeaveSheetMapperTest {
@Test
	public void testAddOne(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		LeaveSheetMapper mapper= sqlSession.getMapper(LeaveSheetMapper.class);
		Leavesheet sheet = new Leavesheet("919106840501","2020-09-19 08:30:00","2020-09-20 20:30:00","审批通过","请假回家","无","当天无法返校","蔡瑾瑶");
		int res=mapper.addOne(sheet);
		if(res>0){
			System.out.println("新增一条在校学生请假单成功");
		}
		//增删改 需要提交事物
		sqlSession.commit();//这句话要写，否则数据库里面插入失败
		sqlSession.close();
	}//test success
@Test
	public void testPage(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
	PageHelper.startPage(1, 1);
	List<Leavesheet> list=mapper.getAllList();
	PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
	System.out.println(p.getPages()+" "+p.getTotal());
	}//test success
@Test
	public void testPageByState(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
		PageHelper.startPage(1, 1);
		List<Leavesheet> list=mapper.getAllListByState("待审批");
		PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
	}//test success
@Test
	public void testGetOneByKey(){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
		List<Leavesheet> sheets = mapper.getOneByPrimaryKey("919106840212");
		for (Leavesheet leavesheet : sheets) {
			System.out.println(leavesheet);
		}
	}//test success
@Test 
	public void testPageByKey(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
		PageHelper.startPage(1, 1);
		List<Leavesheet> list = mapper.getOneByPrimaryKey("919106840212");
		PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
		sqlSession.close();
	}//test success
@Test
	public void testTwoString(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
		List<Leavesheet> list = mapper.getOneByKeyState("919106840212", "待审核");
		for (Leavesheet leavesheet : list) {
			System.out.println(leavesheet);
		}
		sqlSession.close();
	}//ok
@Test
	public void testUpdate(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
	LeaveSheetMapperImpl leaveSheetMapperImpl = new LeaveSheetMapperImpl();
	
	List<Leavesheet> list = leaveSheetMapperImpl.getOneByKeyState("919106840212", "待审核");
	for (Leavesheet leavesheet : list) {
		System.out.println(leavesheet);
	}
	
	int res = mapper.updateState("919106840212", "待审核", "审核通过");
	if(res>0){
		System.out.print("success");
		System.out.print(res);
	}else{
		//System.out.println();
		System.out.print("error");
	}
	sqlSession.commit();
	List<Leavesheet> lista = leaveSheetMapperImpl.getOneByKeyState("919106840212", "待审核");
	System.out.println(lista.size());
	for (Leavesheet leavesheet : lista) {
		System.out.println(leavesheet);
	}
	sqlSession.close();
}//ok
@Test
	public void testGetByKind(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
	List<Leavesheet> allListByKind = mapper.getAllListByKind("请假返家");
	for (Leavesheet leavesheet : allListByKind) {
		System.out.println(leavesheet);
	}
	
}//ok
}



