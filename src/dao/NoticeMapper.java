package dao;

import java.util.List;
import com.github.pagehelper.PageInfo;
import entity.Notice;

public interface NoticeMapper {
	//获取全部通知
		List<Notice> getAllList();
	//获取最新通知
		Notice getNewOne();
	//根据keywords获取通知
		List<Notice> getAllByKeywords(String keywords);
	//新增一个通知
		int addOne(Notice notice);
	//删除一个通知
		int deleteOneByPrimaryKey(int noticeID);
	//根据noticeID获取通知
		Notice getOneByPrimaryKey(int noticeID);
	//分页
		PageInfo<Notice> noticePageInfo(int pageNum,int pageSize);
	//根据查询结果分页
		PageInfo<Notice> queryPageInfo(int pageNum,int pageSize,String keywords);
}
