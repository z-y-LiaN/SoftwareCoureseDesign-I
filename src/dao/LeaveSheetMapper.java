package dao;

import java.util.List;
import com.github.pagehelper.PageInfo;
import entity.Leavesheet;

public interface LeaveSheetMapper {
	//查询全部请假单
	List<Leavesheet> getAllList();
	//根据请假单状态 查询请假单
	List<Leavesheet> getAllListByState(String state);	
	//根据请假类型查询请假单
	List<Leavesheet> getAllListByKind(String outThing);
	//根据id查询  全部请假单
	List<Leavesheet> getOneByPrimaryKey(String userID);	
	//根据state和id查询请假单
	List<Leavesheet> getOneByKeyState(String userID,String state);
	//更新请假单审核状态
	int updateState(String userID,String oldState,String newState);
	//新增一个请假单
	int addOne(Leavesheet sheet);
	//删除请假单
	int deleteOneByPrimaryKey(String userID);
	//获取全部请假单数量
	public int getAllAccout();
	//全部分页
	PageInfo<Leavesheet> leavePageInfo(int pageNum,int pageSize);
	//根据请假单状态进行分页
	PageInfo<Leavesheet> statePageInfo(int pageNum,int pageSize,String state);
	//根据用户ID进行分页
	PageInfo<Leavesheet> idPageInfo(int pageNum,int pageSize,String userID);
}
