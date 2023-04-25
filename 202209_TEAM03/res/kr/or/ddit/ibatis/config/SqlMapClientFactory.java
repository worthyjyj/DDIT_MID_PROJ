package kr.or.ddit.ibatis.config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {
	private static SqlMapClient smc=null;
	
	static { //실행되면 이거 먼저 메모리에 저장됨
		try {
			Charset charset=Charset.forName("UTF-8");
			Resources.setCharset(charset);
			Reader rd=
				Resources.getResourceAsReader("kr/or/ddit/ibatis/config/sqlMapConfig.xml");
			
			smc=SqlMapClientBuilder.buildSqlMapClient(rd);
			
			rd.close();
		} catch (IOException e) {
			System.out.println("iBatis 환경 설정 오류");
	         e.printStackTrace();
		}
	}//static 블럭 끝
	
	public static SqlMapClient getSqlMapClient() {
		return smc;
	}
	
}
