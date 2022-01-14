package dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.LeaveSheetMapper;
import entity.Leavesheet;
import utils.MybatisUtils;

public class LeaveSheetMapperImpl implements LeaveSheetMapper {
	//查询全部请假单
	 public	List<Leavesheet> getAllList(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> lsList = mapper.getAllList();
			sqlSession.close();
			return lsList;	
		}
	//根据请假单状态查询请假单
		public List<Leavesheet> getAllListByState(String state){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> stList=mapper.getAllListByState(state);
			sqlSession.close();
			return stList;
		}
	//根据请假类型查询请假单
		public List<Leavesheet> getAllListByKind(String outThing){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> allListByKind = mapper.getAllListByKind(outThing);
			sqlSession.close();
			return allListByKind;
		}
		//根据id获取历史全部请假单
		public List<Leavesheet> getOneByPrimaryKey(String userID){
			SqlSession sqlSession=MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> sheets = mapper.getOneByPrimaryKey(userID);
			sqlSession.close();
			return sheets;
		}
	//新增一个请假单
		public int addOne(Leavesheet sheet){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper= sqlSession.getMapper(LeaveSheetMapper.class);
			int res=mapper.addOne(sheet);
			if(res>0){
				System.out.println("新增一条在校学生请假单成功");
			}
			//增删改 需要提交事物
			sqlSession.commit();//这句话要写，否则数据库里面插入失败
			sqlSession.close();
			return res;
		}
		
	//删除请假单
	public	int deleteOneByPrimaryKey(String userID){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper= sqlSession.getMapper(LeaveSheetMapper.class);
			int res = mapper.deleteOneByPrimaryKey(userID);
			if(res==1){
				System.out.println("删除一条请假单成功");
			}
			sqlSession.commit();
			sqlSession.close();
			return res;
		}
		
	//获取全部请假单数量
		public int getAllAccout(){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> lsList = mapper.getAllList();
			int tot=lsList.size();
			sqlSession.close();
			return tot;	
		}
	//根据stata 和id查询请假单
		public List<Leavesheet> getOneByKeyState(String userID,String state){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			List<Leavesheet> list = mapper.getOneByKeyState(userID, state);
			sqlSession.close();
			return list;
		}
	//更新请假单审核状态
		public int updateState(String userID,String oldState,String newState){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			int res = mapper.updateState(userID,oldState,newState);
			sqlSession.commit();///////一定要加这句，不然没法更新！！！！！！！！！！
			sqlSession.close();
			return res;
		}
	//分页
		public PageInfo<Leavesheet> leavePageInfo(int pageNum,int pageSize){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<Leavesheet> list=mapper.getAllList();
			PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
			sqlSession.close();
			return p;
		}
		//根据请假单状态进行分页
		public PageInfo<Leavesheet> statePageInfo(int pageNum,int pageSize,String state){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<Leavesheet> list=mapper.getAllListByState(state);
			PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
			sqlSession.close();
			return p;
		}
		//根据用户ID进行分页
		public PageInfo<Leavesheet> idPageInfo(int pageNum,int pageSize,String userID){
			SqlSession sqlSession = MybatisUtils.getSqlSession();
			LeaveSheetMapper mapper = sqlSession.getMapper(LeaveSheetMapper.class);
			PageHelper.startPage(pageNum, pageSize);
			List<Leavesheet> list = mapper.getOneByPrimaryKey(userID);
			PageInfo<Leavesheet> p=new PageInfo<Leavesheet>(list);
			sqlSession.close();
			return p;
		}
}
