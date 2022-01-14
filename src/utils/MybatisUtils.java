package utils;

import java.io.InputStream;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtils {
	private static SqlSessionFactory sqlSessionFactory;
	static{
		try {
			String resource="MyBatis-config.xml";
			InputStream inputStream=Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public static SqlSession getSqlSession() {
		//System.out.println(sqlSessionFactory.openSession());
		return sqlSessionFactory.openSession();	
/*		  SqlSession sqlSession = null;
	        if(sqlSessionFactory!=null){
	            sqlSession  = sqlSessionFactory.openSession(); //非自动提交
	        }
	        return sqlSession;*/

	}
}
