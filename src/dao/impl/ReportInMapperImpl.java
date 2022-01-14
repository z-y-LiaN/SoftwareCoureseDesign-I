package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.ReportInMapper;

import entity.ReportIn;
import entity.User;
import utils.MybatisUtils;

public class ReportInMapperImpl implements ReportInMapper{
	//获取全部在校打卡请假单
		public List<ReportIn> getAllList(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			List<ReportIn> riList = mapper.getAllList();
			sqlSession.close();
			return riList;	
		}
	//根据ID查询打卡记录
		public ReportIn getOneByPrimaryKey(String userID){
			SqlSession sqlSession=MybatisUtils.getSqlSession();
		    ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			ReportIn reportIn=mapper.getOneByPrimaryKey(userID);
			sqlSession.close();
			return reportIn;
		}
	//新增一条打卡记录
		public int addOne(ReportIn reportIn){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper= sqlSession.getMapper(ReportInMapper.class);
			int res=mapper.addOne(reportIn);
			if(res>0){
				System.out.println("insert success");
			}
			//增删改 需要提交事物
			sqlSession.commit();//这句话要写，否则数据库里面插入失败
			sqlSession.close();
			return res;
			
		}
	//获取全部打卡记录数量
		public int  getAllAccount(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			List<ReportIn> riList = mapper.getAllList();
			int tot=riList.size();
			sqlSession.close();
			return tot;
			
		}
	//全部分页
		public PageInfo<ReportIn> riPageInfo(int pageNum,int pageSize){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<ReportIn> list=mapper.getAllList();
			PageInfo<ReportIn> p=new PageInfo<ReportIn>(list);
				return p;
		}
	//根据时间获取打卡记录
		public List<ReportIn> getAllListByTime(String timeString){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			List<ReportIn> riList = mapper.getAllListByTime(timeString);
			sqlSession.close();
			return riList;
		}
	//根据时间分页
		public PageInfo<ReportIn> timeInPageInfo(int pageNum,int pageSize,String timeString){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<ReportIn> list = mapper.getAllListByTime(timeString);
			PageInfo<ReportIn> p=new PageInfo<ReportIn>(list);
			sqlSession.close();
			return p;
		}	
		
}
