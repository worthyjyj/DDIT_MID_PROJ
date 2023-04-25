package reviewBoard.service;

import java.util.List;
import java.util.Map;

import reviewBoard.dao.IReviewDao;
import reviewBoard.dao.ReviewDaoImpl;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;
import vo.ReviewRegionInfoVO;
import vo.ReviewRegionVO;
import vo.ReviewReplyVO;


public class ReviewServiceImpl implements IReviewService {
	
	private IReviewDao dao;
	private static IReviewService service;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getDao();
	}
	
	public static IReviewService  getService() {
		if(service == null ) service = new ReviewServiceImpl();
		
		return service;
	}
	
	@Override
	public List<ReviewBoardVO> getAllReview() {
		// TODO Auto-generated method stub
		return dao.getAllReview();
	}
	
	@Override
	public List<ReviewBoardVO2> getAllReviewByHit() {
		// TODO Auto-generated method stub
		return dao.getAllReviewByHit();
	}

	@Override
	public ReviewBoardVO getDetailReview(int rev_no) {
		// TODO Auto-generated method stub
		return dao.getDetailReview(rev_no);
	}
	
	@Override
	public List<ReviewBoardVO> getReview(Map<String, Object> map) {
		
		System.out.println("시작날짜 : " +map.get("startDate"));
		System.out.println("반납날짜 : "+map.get("endDate"));
		return dao.getReview(map);
	}

	@Override
	public List<ReviewRegionVO> getContiList() {
		// TODO Auto-generated method stub
		return dao.getContiList();
	}
	
	@Override
	public List<ReviewRegionVO> getCountryList(int conNo) {
		// TODO Auto-generated method stub
		return dao.getCountryList(conNo);
	}
	
	@Override
	public List<ReviewRegionVO> getRegionList(int counNo) {
		// TODO Auto-generated method stub
		return dao.getRegionList(counNo);
	}
	
	@Override
	public int insertReview(ReviewBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateReview(vo);
	}
	
	@Override
	public int deleteReview(int rev_no) {
		// TODO Auto-generated method stub
		return dao.deleteReview(rev_no);
	}

	@Override
	public int updateHit(int rev_no) {
		// TODO Auto-generated method stub
		return dao.updateHit(rev_no);
	}

	@Override
	public ReviewRegionInfoVO getRegionInfo(int reg_no) {
		// TODO Auto-generated method stub
		return dao.getRegionInfo(reg_no);
	}

	
	@Override
	public int insertReviewReply(ReviewReplyVO vo) {
		return dao.insertReviewReply(vo);
	}

	@Override
	public int getReplyCount(int rev_no) {
		// TODO Auto-generated method stub
		return dao.getReplyCount(rev_no);
	}

	@Override
	public List<ReviewReplyVO> replyList(int rev_no) {
		// TODO Auto-generated method stub
		return dao.replyList(rev_no);
	}

	@Override
	public List<ReviewBoardVO2> getAllReview2() {
		return dao.getAllReview2();
	}

	@Override
	public ReviewBoardVO2 getDetailReview2(int rev_no) {
		return dao.getDetailReview2(rev_no);
	}

	@Override
	public int updateReply(ReviewReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(int rcom_no) {
		// TODO Auto-generated method stub
		return dao.deleteReply(rcom_no);
	}
	
	@Override
	public ReviewBoardVO2 getWProfileImg(String pName) {
		return dao.getWProfileImg(pName);
	}
	



	




}
