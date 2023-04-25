package searchList.service;

import java.util.List;

import searchList.dao.searchListDAO;
import searchList.dao.searchListDAOImpl;
import vo.FreeBoardVO;
import vo.MainBoardVO;
import vo.ReviewBoardVO2;

public class searchListServiceImpl implements searchListService {
	
	private static searchListServiceImpl service;
	
	private searchListDAO dao;
	
	private searchListServiceImpl() {
		dao = searchListDAOImpl.getInstance();
	}
	
	public static searchListServiceImpl getInstance() {
		if(service==null) service = new searchListServiceImpl();
		return service;
	}

	@Override
	public List<MainBoardVO> searchMainBoardList(String data) {
		return dao.searchMainBoardList(data);
	}

	@Override
	public List<FreeBoardVO> searchFreeBoardList(String data) {
		return dao.searchFreeBoardList(data);
	}

	@Override
	public List<ReviewBoardVO2> searchReviewBoardList(String data) {
		return dao.searchReviewBoardList(data);
	}

}
