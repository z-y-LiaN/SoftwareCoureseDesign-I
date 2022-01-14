package junitTest;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.ReportInMapper;
import entity.ReportIn;
import utils.MybatisUtils;

public class ReportInMapperTest {
@Test
public void testGetAll(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	
	ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
	List<ReportIn> riList = mapper.getAllList();
	for (ReportIn reportIn : riList) {
		System.out.println(reportIn);
	}
	sqlSession.close();
}

@Test
public void testAddOne(){
	SqlSession sqlSession = MybatisUtils.getSqlSession();
	ReportInMapper mapper= sqlSession.getMapper(ReportInMapper.class);
	Date dd=new Date();
	SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String time=sim.format(dd);
	System.out.println(time);
	ReportIn reportIn = new ReportIn("919106840501","36.2",0,time);
	int res=mapper.addOne(reportIn);
	if(res>0){
		System.out.println(reportIn);
		System.out.println("insert success");
	}
	sqlSession.commit();//这句话要写，否则数据库里面插入失败
	sqlSession.close();
}

@Test
	public void testPage(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
		PageHelper.startPage(1, 2);
		List<ReportIn> list=mapper.getAllList();
		PageInfo<ReportIn> p=new PageInfo<ReportIn>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
}
@Test
	public void testPageByTime(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
		PageHelper.startPage(1, 1);
		List<ReportIn> list = mapper.getAllListByTime("2021-09-15");
		PageInfo<ReportIn> p=new PageInfo<ReportIn>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
		sqlSession.close();
}//test success 2021-09-26
}
