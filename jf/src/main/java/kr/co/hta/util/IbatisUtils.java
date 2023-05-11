package kr.co.hta.util;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtils {

	private static SqlMapClient sqlMapClient;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("kr/co/hta/ibatis/config.xml");
			sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlMapClient getSqlMap() {
		return sqlMapClient;
	}
}
