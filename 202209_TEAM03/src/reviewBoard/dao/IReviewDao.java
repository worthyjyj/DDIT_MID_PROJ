package reviewBoard.dao;

import java.util.List;
import java.util.Map;

import vo.FreeBoardVO;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;
import vo.ReviewRegionInfoVO;
import vo.ReviewRegionVO;
import vo.ReviewReplyVO;

public interface IReviewDao {
	
	//리스트 출력-최신순
	public List<ReviewBoardVO> getAllReview();
	
	//리스트 출력-조회수순
	public List<ReviewBoardVO2> getAllReviewByHit();
	
	
	//리스트 출력-조회수순(도시정보 포함)
//		public List<ReviewBoardVO2> getAllReviewByHit2();
	
	//리스트 출력-후기번호 기준
	public ReviewBoardVO getDetailReview(int rev_no);
	
	//리스트 출력(날짜, 도시 입력)
	public List<ReviewBoardVO> getReview(Map<String, Object> map);
	
	//지역정보 출력
//	public ReviewRegionInfoVO getRegionInfo(String reg_name);
	
			// 대륙 리스트 가져오기
			public List<ReviewRegionVO> getContiList();
			
			// 국가 리스트 가져오기
			public List<ReviewRegionVO> getCountryList(int conNo);
			
			// 도시 리스트 가져오기
			public List<ReviewRegionVO> getRegionList(int counNo);
			
			// 도시 정보 가져오기      ???
			public ReviewRegionInfoVO getRegionInfo(int reg_no);
	
	//등록
	public int insertReview(ReviewBoardVO vo);
	
	//수정
	public int updateReview(ReviewBoardVO vo);
	
	//삭제
	public int deleteReview(int rev_no);
	
	//조회수 증가
	public int updateHit(int rev_no);
	
	
	// 댓글 등록
	public int insertReviewReply(ReviewReplyVO vo);
	
	// 댓글 수정
	public int updateReply(ReviewReplyVO vo);
	
	// 댓글 삭제
	public int deleteReply(int rcom_no);
	
	// 댓글 갯수
	public int getReplyCount(int rev_no);
	
	// 댓글 리스트
	public List<ReviewReplyVO> replyList(int rev_no);
	
	//전체 리스트 출력 - 최신순인데 join으로 도시명으로 가져오는거 테스트용도임!
	public List<ReviewBoardVO2> getAllReview2();
	
	//리스트 출력-후기번호 기준 이거는 조인해서 지역번호 숫자를 문자로 바꾸는거
	public ReviewBoardVO2 getDetailReview2(int rev_no);
	
	
	// 작성자 프로필 사진 가져오기
	public ReviewBoardVO2 getWProfileImg(String pName);
}
