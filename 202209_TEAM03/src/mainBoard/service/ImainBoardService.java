package mainBoard.service;

import java.util.List;
import java.util.Map;

import vo.MainBoardVO;
import vo.MainJoinVO;
import vo.MainRegionVO;
import vo.MainReplyVO;
import vo.PickVO;



public interface ImainBoardService {
	
	/**
	 * 검색어 없이 최신순으로 모든 게시글 데이터를 가져오는 메서드
	 * @return List<MainBoardVO>
	 * 
	 */
	public List<MainJoinVO> mainBoardListN();
	
	/**
	 * 메인보드 넘버를 인자로 받아 해당 게시글 하나의 모든 데이터를 가져오는 메서드 
	 * 
	 * @param <MainBoardVO>
	 * @param mb_no
	 * @return 
	 */
	public MainJoinVO getOneMainBoard(int mb_no);
	
	/**
	 * 해당 게시글의 조회수를 1 더해주는 메서드 
	 * @param mb_no
	 * @return update하고 성공 1, 실패 0
	 */
	public int getMbUphit(int mb_no);
	
	/**
	 * Mb_no와 댓글 내용을 입력받아 DB에 인서트하는 메서드 
	 * @param map
	 * @return 성공 null, 실패 오류  (성공하면 dao에서 1로 변환)
	 */
	public int insertMainReply(Map<String, Object> map); 
	
	/**
	 * Mb_no를 입력받아 해당 게시글의 댓글 목록을 가져오는 메서드 
	 * @param mb_no
	 * @return List<MainReplyVO>
	 */
	public List<MainReplyVO> getMBreplyList(int mb_no);
	

	/**
	 * 모든 대륙 리스트를 반환하는 메서드 
	 * @return continum과 대륙이름이 포함된 리스트를 반환
	 */
	public List<MainRegionVO> getallcontinent();
	
	
	/**
	 * 대륙번호를 인수로 받아 그에 해당하는 나라들을 반환하는 메서드 
	 * @param conti_no
	 * @return List<MainRegionVO>
	 */
	public List<MainRegionVO> getallcountry(int conti_no);
	
	
	/**
	 * 나라번호를 인수로 받아 그에 해당하는 지역들을 반환하는 메서드
	 * @param coun_no
	 * @return 지역 리스트 
	 */
	public List<MainRegionVO> getallregion(int coun_no);
	
	/**
	 * 메인 게시판 글 등록하는 메서드 
	 * @param vo
	 * @return
	 */
	public int maininsert(MainBoardVO vo);
	
	/**
	 * 메인게시판 정렬 탭에 검색어를 받아 조건검색된 리스트를 반환하는 메서드 
	 * @param map
	 * @return
	 */
	public List<MainJoinVO> mainBoardListsort(Map<String, Object> map); 
	
	/**
	 * 파라미터 없이 조회수순으로 모든 리스트를 불러오는 메서드 
	 * @return
	 */
	public List<MainJoinVO> hitList();
	
	/**
	 * 지역 변수를 매개로하여 그에 해당하는 대륙과 나라를 반환하는 메서드 
	 * @param reg_no
	 * @return
	 */
	public MainJoinVO getContiCoun(int reg_no);
	
	/**
	 * 해당하는 게시글을 수정하는 메서드 
	 * @param vo
	 * @return
	 */
	public int updateMainBoard(MainJoinVO vo);
	
	/**
	 * 댓글 넘버와 댓글 내용을 인수로 받아 데이터를 수정하여 0 이나 1을 리턴하는 메서드
	 * @param map
	 * @return
	 */
	public int modifyReply(Map<String, Object> map);
	
	
	/**
	 * 해당 댓글 번호를 인수로 받아 해당 댓글을 삭제하는 메서드 
	 * @param mcom_no
	 * @return
	 */
	public int DeleteReply(int mcom_no);
	
	/**
	 * vo를 인수로 받아 윗미 테이블에 데이터 넣어주는 메서드 
	 * @param vo
	 * @return
	 */
	public int withmeinsert(MainBoardVO vo); 
	
	/**
	 * vo를 인수로 받아 참여중인 윗미 테이블에 데이터 넣어주는 메서드 
	 * @param vo
	 * @return
	 */
	public int withmejoininsert(MainBoardVO vo);
	
	/**
	 * 쪽지함에 insert해주는 메서드 
	 * @return
	 */
	public int noteinsert(Map<String, Object> map);
	
	/**
	 * 찜하기 테이블에 해당 게시글 정보와 세션 정보를 저장하는 메서드 
	 * @param map
	 * @return
	 */
	public int insertpick(Map<String, Object> map); 
	
	/**
	 * 찜하기 테이블에서 삭제하는 메서드 
	 * @param map
	 * @return
	 */
	public int cancelpick(Map<String, Object> map); 
	
	public int deletemainboard(int mb_no);
	
	public int getreplycount(int mb_no);
	
	public int withmecheck(Map<String, Object> map);
	
	public List<PickVO> pickList(String PNAME);
	
	public int pickcheck(Map<String, Object> map); 
	
	public int changestatus2(int mb_no); 
	
	public int changestatus1(int mb_no);
	
	public MainBoardVO currentstatus(int mb_no);
	
	public List<MainJoinVO> mainBoardpickList(String p_name);
}
