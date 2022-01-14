package junitTest;
import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.NoticeMapper;
import entity.Notice;
import utils.MybatisUtils;

public class NoticeMapperTest {

@Test
	public void testAddOne(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
		Notice notice = new Notice("这是一个通知标题啊","这是通知内容啊","2020-09-20 09:22:21");
		int res=mapper.addOne(notice);
		if(res>0){
			System.out.println("数据库中新增一条通知成功");
		}else{
			System.out.println("数据库中新增一条通知失败");
		}
		System.out.println("当前新增的是第"+notice.getNoticeID()+"条通知");
		//增删改 需要提交事物
		sqlSession.commit();//这句话要写，否则数据库里面插入失败
		sqlSession.close();
	}//test success
@Test
	public void testGetNewOne(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
		Notice notice=mapper.getNewOne();
		System.out.println(notice);
		
	}
@Test
	public void testGetOneByKey(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
		Notice notice = mapper.getOneByPrimaryKey(2);
		System.out.println(notice);
		sqlSession.close();
	}
@Test
	public void testPage(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		PageHelper.startPage(1, 3);
		List<Notice> list=mapper.getAllList();
		PageInfo<Notice> p=new PageInfo<Notice>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
	}//test success
@Test
	public void testAll(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		List<Notice> allList = mapper.getAllList();
		for (Notice notice : allList) {
			System.out.print(notice);
		}
	}
@Test
	public void testQuery(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		List<Notice> allByKeywords = mapper.getAllByKeywords("数学竞赛");
		for (Notice notice : allByKeywords) {
			System.out.println(notice);
		}
		sqlSession.close();
	}//success
@Test
	public void testPQ(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		PageHelper.startPage(1, 2);
		List<Notice> list=mapper.getAllByKeywords("遴选");
		for (Notice notice : list) {
			System.out.println(notice);
		}
		PageInfo<Notice> p=new PageInfo<Notice>(list);
		System.out.println(p.getPages()+" "+p.getTotal());
		sqlSession.close();
}//ok
}




