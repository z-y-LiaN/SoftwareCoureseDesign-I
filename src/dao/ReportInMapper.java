package dao;

import java.util.List;
import com.github.pagehelper.PageInfo;
import entity.ReportIn;

public interface ReportInMapper {
//获取全部在校打卡请假单
	List<ReportIn> getAllList();
//根据ID查询打卡记录
	ReportIn getOneByPrimaryKey(String userID);
//新增一条打卡记录
	int addOne(ReportIn reportIn);
//获取全部打卡记录数量
	public int  getAllAccount();
//根据时间获取打卡记录
	List<ReportIn> getAllListByTime(String timeString);
//全部分页
	PageInfo<ReportIn> riPageInfo(int pageNum,int pageSize);
//根据时间分页
	PageInfo<ReportIn> timeInPageInfo(int pageNum,int pageSize,String timeString);
}
