package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.NoticeMapper;
import entity.Notice;
import utils.MybatisUtils;

public class NoticeMapperImpl implements NoticeMapper {
//获取全部通知
	public List<Notice> getAllList(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		List<Notice> noList = mapper.getAllList();
		sqlSession.close();
		return noList;	
		
	}
//获取最新通知
	public Notice getNewOne(){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		Notice notice=mapper.getNewOne();
		sqlSession.close();
		return notice;
		
	}
//根据keywords获取通知
	public List<Notice> getAllByKeywords(String keywords){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		List<Notice> allByKeywords = mapper.getAllByKeywords(keywords);
		return allByKeywords;
		
	}
//新增一条通知
	public int addOne(Notice notice) {
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
		int res=mapper.addOne(notice);
		if(res>0){
			System.out.println("数据库中新增一条通知成功");
		}else{
			System.out.println("数据库中新增一条通知失败");
		}
		//增删改 需要提交事物
		sqlSession.commit();//这句话要写，否则数据库里面插入失败
		sqlSession.close();
		return res;
		
	}
//删除一条通知
	public int deleteOneByPrimaryKey(int noticeID){
		SqlSession sqlSession = MybatisUtils.getSqlSession();
		NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
		int res = mapper.deleteOneByPrimaryKey(noticeID);
		if(res==1){
			System.out.println("数据库中删除一条通知成功");
		}else{
			System.out.println("数据库中删除一条通知失败");
		}
		sqlSession.commit();
		sqlSession.close();
		return res;
	}
//根据noticeID获取通知
		public Notice getOneByPrimaryKey(int noticeID){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			NoticeMapper mapper= sqlSession.getMapper(NoticeMapper.class);
			Notice notice = mapper.getOneByPrimaryKey(noticeID);
			sqlSession.close();
			return notice;
		}
//PageHelper分页
		public PageInfo<Notice> noticePageInfo(int pageNum,int pageSize){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<Notice> list=mapper.getAllList();
			PageInfo<Notice> p=new PageInfo<Notice>(list);
			
			sqlSession.close();
			return p;
		}
//根据查询结果分页
		public PageInfo<Notice> queryPageInfo(int pageNum,int pageSize,String keywords){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
			
			PageHelper.startPage(pageNum, pageSize);
			List<Notice> list=mapper.getAllByKeywords(keywords);
			PageInfo<Notice> p=new PageInfo<Notice>(list);
			
			sqlSession.close();
			return p;
		}
}
