package junitTest;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.ReportInMapper;
import dao.impl.ReportInMapperImpl;
import entity.ReportIn;
import utils.MybatisUtils;

public class TestTemp {
@Test
public void test01(){
	 
     //查询
	 SqlSession sqlSession = MybatisUtils.getSqlSession();
	 ReportInMapper mapper = sqlSession.getMapper(ReportInMapper.class);
	 PageHelper.startPage(1, 2);
     List<ReportIn> reportIns=mapper.getAllList();
     
     //创建PageInfo对象，保存查询出的结果，PageInfo是pageHelper中的对象
     PageInfo<ReportIn> p=new PageInfo<ReportIn>(reportIns);
     System.out.println(p.getPages());
     sqlSession.close();
}

}
