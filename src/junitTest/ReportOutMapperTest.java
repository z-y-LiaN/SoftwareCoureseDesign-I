package junitTest;
import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.ReportInMapper;
import dao.ReportOutMapper;
import entity.ReportOut;
import utils.MybatisUtils;


public class ReportOutMapperTest {
@Test
	public void testGetAll(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
		List<ReportOut> roList = mapper.getAllList();
		for (ReportOut reportOut : roList) {
			System.out.println(reportOut);
		}
		sqlSession.close();
	}
@Test
	public void testGetAllListByTime(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
		String timeString="2021-09-16";
		List<ReportOut> rotList = mapper.getAllListByTime(timeString);
		System.out.println(rotList.size());
		for (ReportOut reportOut : rotList) {
			System.out.println(reportOut);
		}
		sqlSession.close();
	}
@Test
	public void testPage(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
		PageHelper.startPage(1, 3);
		List<ReportOut> list=mapper.getAllList();
		PageInfo<ReportOut> p=new PageInfo<ReportOut>(list);

		System.out.println(p.getPages()+" "+p.getTotal());
		sqlSession.close();
	}//test success


/*@Test
	public void testAddOne(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportOutMapper mapper= sqlSession.getMapper(ReportOutMapper.class);
		ReportOut reportOut = new ReportOut("919106840212","36.2",0,"2020-09-17 09:44:20","绿码",1,0,0,"四川省达州市","无");
		int res=mapper.addOne(reportOut);
		if(res>0){
			System.out.println("新增一条非在校学生打卡记录成功");
		}
		//增删改 需要提交事物
		sqlSession.commit();//这句话要写，否则数据库里面插入失败
		sqlSession.close();
}*/
@Test
	public void testPageByTime(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
		PageHelper.startPage(1, 2);
		List<ReportOut> list = mapper.getAllListByTime("");
		PageInfo<ReportOut> p=new PageInfo<ReportOut>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
		sqlSession.close();
}//test success 2021-09-26
	


}
