package member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.MainBoardVO;
import vo.MainReplyVO;
import vo.MemberVO;
import vo.NoteVO;
import vo.PageVO;
import vo.Profile;
import vo.ReviewBoardVO2;
import vo.ReviewReplyVO;

public interface IMemberService {
	public String getId(String id) throws SQLException;
	public Object insertNote(NoteVO vo) throws SQLException;
	public List<NoteVO> getNoteList(String mem_id, String num) throws SQLException;
	public int Join(Map<String, Object> map)  throws SQLException;
	public String getName(String id)  throws SQLException;
	public String searchId(Map<String, Object> map)  throws SQLException;
	public int duplication(String id) throws SQLException;
	public Object SignUp(MemberVO vo) throws SQLException;
	public int picduple(String picname) throws SQLException;
	public int searchReg(String id)throws SQLException;
	public Object proInsert(Profile pro)throws SQLException;
	public String searchIntro(String id)throws SQLException;
	public int updateMember(Map<String, Object> map) throws SQLException;
	public int updateIntro(Map<String, Object> map2)throws SQLException;
	public int deleteMember(String id)throws SQLException;
	public int deleteProfile(String id)throws SQLException;
	public List<NoteVO> sendNote(String id) throws SQLException;
	public List<NoteVO> receiveNote(String id) throws SQLException;
	public NoteVO detailReceiveNote(String no)throws SQLException;
	
	// 프로필VO 가져오기
	public Profile getProfile(String id) throws SQLException;
	public NoteVO receiveDetail(Map<String, Object> map)throws SQLException;
	public NoteVO sendDetail(Map<String, Object> map)throws SQLException;
	public void updateColor(int no)throws SQLException;
	public int deleteNote(int parseInt)throws SQLException;
	public String searchMem_id(String people)throws SQLException;
	public List<ReviewReplyVO> getReviewReply(String P_NAME)throws SQLException;
	public List<FreeReplyVO> getFreeReply(String P_NAME)throws SQLException;
	public List<MainReplyVO> getMainReply(String P_NAME)throws SQLException;
	public int deleteReply(Map<String, Object> map)throws SQLException;
	
	//댓글들 삭제
	public int deleteReplyReview(int parseInt)throws SQLException;
	public int deleteReplyMain(int parseInt)throws SQLException;
	public int deleteReplyFree(int parseInt)throws SQLException;
	
	//게시판 싹다 가져오기
	public List<ReviewBoardVO2> getReviewBoard(String pNAME)throws SQLException;
	public List<MainBoardVO> getMainBoard(String pNAME)throws SQLException;
	public List<FreeBoardVO> getFreeBoard(String pNAME)throws SQLException;
	
	//읽지 않은 메세지 가져오기
	public int getNoteState(String id)throws SQLException;
	
	//총 댓글 갯수
	public int getTotalCount()throws SQLException;
	public PageVO pageInfo(int page)throws SQLException;
	public List<NoteVO> selectByPage(Map<String, Object> map)throws SQLException;

	//회원 status 가져오는거
	public int getMemberGrade(String id)throws SQLException;
	
	//join_withme 테이블에 데이터 인서트해주는거 
	public Object withmejoininsert(Map<String, Object> map)throws SQLException;
	
	public String searchPw(Map<String, Object> map)throws SQLException;
	
}
