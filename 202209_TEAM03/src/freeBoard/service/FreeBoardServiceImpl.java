package freeBoard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import freeBoard.dao.FreeBoardDaoImpl;
import freeBoard.dao.IFreeBoardDao;
import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.FreeSelectOptionVO;

public class FreeBoardServiceImpl implements IFreeBoardService {
	
	private IFreeBoardDao dao;
	
	private static FreeBoardServiceImpl service;
	
	private FreeBoardServiceImpl() {
		dao = FreeBoardDaoImpl.getInstance();
	}
	public static FreeBoardServiceImpl getInstance() {
		if(service == null) {
			service = new FreeBoardServiceImpl();
		}
		return service;
	}
	

	// 전체 게시글 출력
	@Override
	public List<FreeBoardVO> getAllFreeBoard() {
		return dao.getAllFreeBoard();
	}
	  
	// 전체 게시글 조회수높은순으로 출력
	@Override
	public List<FreeBoardVO> OrderByHit() {
		return dao.OrderByHit();
	}
	
	// 게시글 삭제
	@Override
	public int deleteBoard(int num) {
		return dao.deleteBoard(num);
	}
	

	// 글 상세조회
	@Override
	public FreeBoardVO getArticle(int num) {
		return dao.getArticle(num);
	}
	
	
	// 조회수 증가
	@Override
	public int updateHit(int num) {
		return dao.updateHit(num);
	}

	
	//  제목, 지역 검색해서 출력
	@Override
	public List<FreeBoardVO> selectByTotal(Map<String, Object> map) {
		return dao.selectByTotal(map);
	}
	
	// 글 등록
	@Override
	public int insertBoard(FreeBoardVO vo) {
		return dao.insertBoard(vo);
	}
	
		// 대륙 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getContiList() {
			return dao.getContiList();
		}
		
		// 국가 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getCountryList(int conNo) {
			return dao.getCountryList(conNo);
		}
		
		// 도시 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getRegionList(int counNo) {
			return dao.getRegionList(counNo);
		}
		
		// 작성자 프로필 사진 가져오기
		@Override
		public FreeBoardVO getWProfileImg(String pName) {
			return dao.getWProfileImg(pName);
		}
		
		
	// 글 수정
	@Override
	public int updateBoard(FreeBoardVO vo) {
		return dao.updateBoard(vo);
	}
		


	//댓글 리스트
	@Override
	public List<FreeReplyVO> listReply(int num) {
		return dao.listReply(num);
	}
	
	//댓글 상태 --> 필요없어서 지움!!
//	@Override
//	public int ReplyStatus(int num) {
//		return dao.ReplyStatus(num);
//	}
	
	// 댓글 등록
	@Override
	public int insertReply(FreeReplyVO vo) {
		return dao.insertReply(vo);
	}
	
	// 댓글 수정
	@Override
	public int updateReply(FreeReplyVO vo) {
		return dao.updateReply(vo);
	}
	
	// 댓글 갯수
	@Override
	public int getReplyCount(int num) {
		return dao.getReplyCount(num);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(int num) {
		return dao.deleteReply(num);
	}
}
