package freeBoard.service;

import java.util.List;
import java.util.Map;

import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.FreeSelectOptionVO;

public interface IFreeBoardService {

	// 전체 게시글 출력
	public List<FreeBoardVO> getAllFreeBoard();

	// 전체 게시글 조회수높은순으로 출력
	public List<FreeBoardVO> OrderByHit();
	
	// 제목, 지역 검색해서 출력
	public List<FreeBoardVO> selectByTotal(Map<String, Object> map); 
	 
	// 글 등록
	public  int insertBoard(FreeBoardVO vo);
	
	// 글 수정
	public int updateBoard(FreeBoardVO vo);
		
	// 글 삭제
	public int deleteBoard(int num);
	
	// 글 상세조회
	public FreeBoardVO getArticle(int num);

	// 조회수 증가
	public int updateHit(int num);
	
	// 대륙 리스트 가져오기
	public List<FreeSelectOptionVO> getContiList();
	
	// 국가 리스트 가져오기
	public List<FreeSelectOptionVO> getCountryList(int conNo);
	
	// 도시 리스트 가져오기
	public List<FreeSelectOptionVO> getRegionList(int counNo);

	// 작성자 프로필 사진 가져오기
	public FreeBoardVO getWProfileImg(String pName);
		
		
		
		
			
	//댓글 리스트
	public List<FreeReplyVO> listReply(int num); 
	
	//댓글 상태 --> 필요없어서 지움!!
	//public int ReplyStatus(int num);
	
	//댓글 등록 
	public int insertReply(FreeReplyVO vo);
	
	//댓글 수정
	public int updateReply(FreeReplyVO vo);
	
	//댓글 삭제
	public int deleteReply(int num);
	
	//댓글 갯수
	public int getReplyCount(int num);
			
}
