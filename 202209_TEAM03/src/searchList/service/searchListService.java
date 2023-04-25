package searchList.service;

import java.util.List;

import vo.FreeBoardVO;
import vo.MainBoardVO;
import vo.ReviewBoardVO2;

public interface searchListService {
	
	public List<MainBoardVO> searchMainBoardList(String data);
	
	public List<FreeBoardVO> searchFreeBoardList(String data);
	
	public List<ReviewBoardVO2> searchReviewBoardList(String data);

}
