package reviewBoard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;
import vo.ReviewRegionInfoVO;
import vo.ReviewRegionVO;
import vo.ReviewReplyVO;

public class ReviewDaoImpl implements IReviewDao {
	
	private SqlMapClient client;
	private static IReviewDao dao;
	
	 private ReviewDaoImpl() {
		 client = SqlMapClientFactory.getSqlMapClient();
	 }
	 
	 public static IReviewDao getDao() {
		 if(dao == null) dao = new ReviewDaoImpl();
		 
		 return dao;
	 }

	@Override
	public List<ReviewBoardVO> getReview(Map<String, Object> map) {
		List<ReviewBoardVO> reviewList2 = null;
		
		try {
			reviewList2 = client.queryForList("review.getReview",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviewList2;
	}
	
	@Override
	public List<ReviewBoardVO> getAllReview() {
		
		List<ReviewBoardVO> reviewList = null;
		
		try {
			reviewList = client.queryForList("review.getAllReview");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviewList;
	}
	
	@Override
	public List<ReviewBoardVO2> getAllReviewByHit() {
		
		List<ReviewBoardVO2> reviewList = null;
		
			try {
				reviewList = client.queryForList("review.getAllReviewByHit");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return reviewList;
	}
	
	@Override
	public ReviewBoardVO getDetailReview(int rev_no) {
		
		ReviewBoardVO rvo = null;
		
			try {
				rvo = (ReviewBoardVO) client.queryForObject("review.getDetailReview", rev_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return rvo;
	}
	
//	@Override
//	public ReviewRegionInfoVO getRegionInfo(String reg_name) {
//		
//		ReviewRegionInfoVO rvo = null;
//		
//			try {
//				rvo = (ReviewRegionInfoVO) client.queryForObject("reviewRI.getRegionInfo", reg_name);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		return rvo;
//	}

	@Override
	public List<ReviewRegionVO> getContiList() {

		List<ReviewRegionVO> regionList = null;
			try {
				regionList = client.queryForList("review-region.getContiList");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return regionList;
	}
	
	@Override
	public List<ReviewRegionVO> getCountryList(int conNo) {
		
		List<ReviewRegionVO> regionList = null;
		
			try {
				regionList = client.queryForList("review-region.getCountryList", conNo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return regionList;
	}
	
	@Override
	public List<ReviewRegionVO> getRegionList(int counNo) {
		
		List<ReviewRegionVO> regionList = null;
			try {
				regionList = client.queryForList("review-region.getRegionList", counNo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return regionList;
	}
	
	@Override
	public int insertReview(ReviewBoardVO vo) {
		int cnt = 0;
		
		try {
			Object obj = client.insert("review.insertReview", vo);
			if(obj==null) cnt = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteReview(int rev_no) {
		int cnt = 0;
		
		try {
			cnt = client.delete("review.deleteReview", rev_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateReview(ReviewBoardVO vo) {
		int cnt = 0;
		
		try {
			cnt = client.update("review.updateReview", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}


	@Override
	public int updateHit(int rev_no) {
		int cnt = 0;
		
		try {
			cnt = client.update("review.updateHit", rev_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public ReviewRegionInfoVO getRegionInfo(int reg_no) {
		
		ReviewRegionInfoVO rivo = null;
			try {
				rivo = (ReviewRegionInfoVO) client.queryForObject("review-region.getRegionInfo", reg_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return rivo;
	}

	
	@Override
	public int insertReviewReply(ReviewReplyVO vo) {
		int cnt = 0;
		
			try {
				Object obj = client.insert("reviewReply.insertReviewReply", vo);
				if(obj == null) cnt = 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return cnt;
	}

	@Override
	public int getReplyCount(int rev_no) {
		int cnt = 0;
		
			try {
				cnt = (int) client.queryForObject("reviewReply.getReplyCount", rev_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return cnt;
	}

	@Override
	public List<ReviewReplyVO> replyList(int rev_no) {
		List<ReviewReplyVO> replyList = null;
		
			try {
				replyList = client.queryForList("reviewReply.replyList", rev_no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return replyList;
	}

	@Override
	public List<ReviewBoardVO2> getAllReview2() {
		List<ReviewBoardVO2> reviewList = null;
		
		try {
			reviewList = client.queryForList("review.getAllReview2");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviewList;
	}

	@Override
	public ReviewBoardVO2 getDetailReview2(int rev_no) {
		
		ReviewBoardVO2 rvo = null;
		
			try {
				rvo = (ReviewBoardVO2) client.queryForObject("review.getDetailReview2", rev_no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return rvo;
	}

	@Override
	public int updateReply(ReviewReplyVO vo) {
		
		int cnt = 0;
		
			try {
				cnt = client.update("reviewReply.updateReply", vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return cnt;
	}

	@Override
	public int deleteReply(int rcom_no) {
		int cnt = 0;
		
			try {
				cnt = client.update("reviewReply.deleteReply", rcom_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return cnt;
	}

	@Override
	public ReviewBoardVO2 getWProfileImg(String pName) {
		ReviewBoardVO2 vo = null;
		 
		try {
			vo = (ReviewBoardVO2)client.queryForObject("review.getWProfileImg", pName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}


}
