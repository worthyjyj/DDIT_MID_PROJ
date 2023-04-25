package searchList.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.FreeBoardVO;
import vo.MainBoardVO;
import vo.ReviewBoardVO2;

public class searchListDAOImpl implements searchListDAO{
	
	private SqlMapClient smc;
	
	private static searchListDAOImpl dao;
	
	private searchListDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static searchListDAOImpl getInstance() {
		if(dao == null) dao = new searchListDAOImpl();
		return dao;
	}

	@Override
	public List<MainBoardVO> searchMainBoardList(String data) {
		List<MainBoardVO> mainList = null;
		try {
			mainList = smc.queryForList("search.searchMain", data);
		} catch (SQLException e) {
			mainList = null;
			e.printStackTrace();
		}
		return mainList;
	}

	@Override
	public List<FreeBoardVO> searchFreeBoardList(String data) {
		List<FreeBoardVO> freeList = null;
		try {
			freeList = smc.queryForList("search.searchFree", data);
		} catch (SQLException e) {
			freeList = null;
			e.printStackTrace();
		}
		return freeList;
	}

	@Override
	public List<ReviewBoardVO2> searchReviewBoardList(String data) {
		List<ReviewBoardVO2> reviewList = null;
		try {
			reviewList = smc.queryForList("search.searchReview", data);
		} catch (SQLException e) {
			reviewList = null;
			e.printStackTrace();
		}
		return reviewList;
	}

}
