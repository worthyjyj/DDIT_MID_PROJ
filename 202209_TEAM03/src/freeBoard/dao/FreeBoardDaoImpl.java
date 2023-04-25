package freeBoard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.FreeSelectOptionVO;

public class FreeBoardDaoImpl implements IFreeBoardDao {
	
	private SqlMapClient smc; // iBatis 처리용 객체 변수 선언

	//1번 
	private static FreeBoardDaoImpl dao;
	
	//2번
	private FreeBoardDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	//3번
	public static FreeBoardDaoImpl getInstance() {
		if(dao == null)
			dao = new FreeBoardDaoImpl();
		return dao;
	}
	
	
	
	
	// 전체 게시글 출력
	@Override
	public List<FreeBoardVO> getAllFreeBoard() {
		List<FreeBoardVO> boardList = null;
		
		try {
			boardList = smc.queryForList("freeboard.getAllFreeBoard");
		} catch (SQLException e) {
			boardList = null;
			e.printStackTrace();
		}
		return boardList;
	}
	
	
	// 전체 게시글 조회수높은순으로 출력 
	@Override
	public List<FreeBoardVO> OrderByHit() {
		List<FreeBoardVO> boardList = null;
		
		try {
			boardList = smc.queryForList("freeboard.OrderByHit");
		} catch (SQLException e) {
			boardList = null;
			e.printStackTrace();
		}
		return boardList;
	}
	
	
	// 게시글 삭제
	@Override
	public int deleteBoard(int num) {
		int res = 0; 
		
		try {
			res = smc.delete("freeboard.deleteBoard", num);
		} catch (SQLException e) {
			res=0;
			e.printStackTrace();
		}
		
		return res;
	}

	// 제목, 지역 검색해서 출력(통합검색)
	@Override
	public List<FreeBoardVO> selectByTotal(Map<String, Object> map) {
		List<FreeBoardVO> list = null;
		
		try {
			list = smc.queryForList("freeboard.selectByTotal", map);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}
	
	// 글 상세조회
	@Override
	public FreeBoardVO getArticle(int num) {
		FreeBoardVO vo = null;
		
		try {
			vo = (FreeBoardVO) smc.queryForObject("freeboard.getArticle", num);
		} catch (SQLException e) {
			vo = null;
			e.printStackTrace();
		}
		
		return vo;
	}
	
	// 글 등록
	@Override
		public int insertBoard(FreeBoardVO vo) {
			
			int res = 0;
			 
			try {
				Object	obj = smc.insert("freeboard.insertBoard", vo);
				
				if(obj == null) {
					res = 1; // insert 성공
				}
				
			} catch (SQLException e) {
				res = 0;
				e.printStackTrace();
			}
			return res;
		}
	
		// 대륙 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getContiList() {
			List<FreeSelectOptionVO> list = null;
			
			try {
				list = smc.queryForList("freeboard-option.getContiList");
			} catch (SQLException e) {
				list = null;
				e.printStackTrace();
			}
			
			return list;
		}
		
		// 국가 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getCountryList(int conNo) {
			List<FreeSelectOptionVO> list = null;
			
			try {
				list = smc.queryForList("freeboard-option.getCountryList", conNo);
				
			} catch (SQLException e) {
				list = null;
				e.printStackTrace();
			}
			return list;
		}
		
		// 도시 리스트 가져오기
		@Override
		public List<FreeSelectOptionVO> getRegionList(int counNo) {
			List<FreeSelectOptionVO> list = null;
			
			try {
				list = smc.queryForList("freeboard-option.getRegionList", counNo);
			} catch (SQLException e) {
				list = null;
				e.printStackTrace();
			}
			
			
			return list;
		}
		

		// 작성자 프로필 사진 가져오기
		@Override
		public FreeBoardVO getWProfileImg(String pName) {
			FreeBoardVO vo = null;
			
			try {
				vo = (FreeBoardVO) smc.queryForObject("freeboard.getWProfileImg", pName);
			} catch (SQLException e) {
				vo = null;
				e.printStackTrace();
			}
			
			return vo;
		}
		
		
		
		
		
		
	// 글 수정
	@Override
	public int updateBoard(FreeBoardVO vo) {
		int res = 0; 
		
		try {
			res = smc.update("freeboard.updateBoard", vo);
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}
		
	
	// 조회수 증가
	@Override
	public int updateHit(int num) {
		int res = 0;
		
		try {
			res = smc.update("freeboard.updateHit", num);
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		return res;
	}

	//댓글 리스트
	@Override
	public List<FreeReplyVO> listReply(int num) {
		List<FreeReplyVO> list = null;
		
		try {
			list = smc.queryForList("freeboard-reply.listReply", num);
			System.out.println(list);
		} catch (SQLException e) {
			list= null;
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 답변상태 -> 필요없어서 지움!
//	@Override
//	public int ReplyStatus(int num) {
//		int res = 0;
//		
//		try {
//			res = (int) smc.queryForObject("freeboard.replyStatus", num);
//		} catch (SQLException e) {
//			res= 0;
//			e.printStackTrace();
//		}
//		
//		return res;
//	}
	
	// 댓글등록
	@Override
	public int insertReply(FreeReplyVO vo) {
		int res = 0;
		
		try {
			Object obj = smc.insert("freeboard-reply.insertReply", vo);
			
			if(obj == null) {
				res = 1; // insert 성공
			}
			
		} catch (SQLException e) {
			res= 0;
			e.printStackTrace();
		}
		return res;
	}
	
	// 댓글 갯수
	@Override
	public int getReplyCount(int num) {
		int res = 0;
		
		try {
			res = (int) smc.queryForObject("freeboard.getReplyCount", num);
			 
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 댓글 수정
	@Override
	public int updateReply(FreeReplyVO vo) {
		int res = 0; 
		
		try {
			res = smc.update("freeboard-reply.updateReply", vo);
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}

	
	// 댓글 삭제
	@Override
	public int deleteReply(int num) {
		int res = 0;
		
		try {
			res = (int)smc.delete("freeboard-reply.deleteReply", num);
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}
	
	

}
