package dao;

import java.util.List;
import com.github.pagehelper.PageInfo;
import entity.ReportOut;
public interface ReportOutMapper {
	//获取全部非在校打卡请假单
		List<ReportOut> getAllList();
	//根据ID查询打卡记录
		ReportOut getOneByPrimaryKey(String userID);
	//根据时间查找打卡记录
		List<ReportOut> getAllListByTime(String timeString);
 	//新增一条打卡记录
		int addOne(ReportOut reportOut);
	//获取全部打卡记录数量
		public int  getAllAccount();
	//分页全部
		PageInfo<ReportOut> roPageInfo(int pageNum,int pageSize);
	//根据时间分页
		PageInfo<ReportOut> timePageInfo(int pageNum,int pageSize,String timeString);
}
