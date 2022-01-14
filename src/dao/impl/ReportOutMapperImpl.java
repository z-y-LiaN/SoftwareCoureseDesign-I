package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.ReportOutMapper;

import entity.ReportOut;
import utils.MybatisUtils;


public class ReportOutMapperImpl implements ReportOutMapper {
	//获取全部在校打卡请假单
			public List<ReportOut> getAllList(){
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				List<ReportOut> roList = mapper.getAllList();
				sqlSession.close();
				return roList;	
			}
		//根据ID查询打卡记录
			public ReportOut getOneByPrimaryKey(String userID){
				SqlSession sqlSession=MybatisUtils.getSqlSession();
			    ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				ReportOut reportIn=mapper.getOneByPrimaryKey(userID);
				sqlSession.close();
				return reportIn;
			}
		//根据时间模糊查询打卡记录
			public List<ReportOut> getAllListByTime(String timeString) {
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				List<ReportOut> rotList = mapper.getAllListByTime(timeString);
				sqlSession.close();
				return rotList;
			}
		
		//新增一条打卡记录
			public int addOne(ReportOut reportOut){
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper= sqlSession.getMapper(ReportOutMapper.class);
				int res=mapper.addOne(reportOut);
				if(res>0){
					System.out.println("新增一条非在校学生打卡记录成功");
				}
				//增删改 需要提交事物
				sqlSession.commit();//这句话要写，否则数据库里面插入失败
				sqlSession.close();
				return res;
				
			}
		//获取全部打卡记录数量
			public int  getAllAccount(){
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				List<ReportOut> roList = mapper.getAllList();
				int tot=roList.size();
				sqlSession.close();
				return tot;
				
			}
		//分页全部
			public PageInfo<ReportOut> roPageInfo(int pageNum,int pageSize){
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				PageHelper.startPage(pageNum, pageSize);
				List<ReportOut> list=mapper.getAllList();
				PageInfo<ReportOut> p=new PageInfo<ReportOut>(list);
				sqlSession.close();
				return p;
			}
		//根据时间分页
			public PageInfo<ReportOut> timePageInfo(int pageNum,int pageSize,String timeString){
				SqlSession sqlSession = MybatisUtils.getSqlSession();
				ReportOutMapper mapper = sqlSession.getMapper(ReportOutMapper.class);
				PageHelper.startPage(pageNum, pageSize);
				List<ReportOut> list = mapper.getAllListByTime(timeString);
				PageInfo<ReportOut> p=new PageInfo<ReportOut>(list);
				sqlSession.close();
				return p;
			}
}
