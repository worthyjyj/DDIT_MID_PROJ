package member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.MainBoardVO;
import vo.MainReplyVO;
import vo.MemberVO;
import vo.NoteVO;
import vo.Profile;
import vo.ReviewBoardVO2;
import vo.ReviewReplyVO;

public class MemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao;
	private SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getDao() {
		if(dao==null) {
			dao=new MemberDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public String getId(String id) throws SQLException{
		
		String name=(String) smc.queryForObject("board.getId",id);
		
		return name;
	}


	@Override
	public Object insertNote(NoteVO vo) throws SQLException {
		Object obj=smc.insert("note.insertNote", vo);
		return obj;
	}

	@Override//로그인을 하기 위해 로그인 아이디와 로그인 비밀번호 받는 함수
	public List<NoteVO> getNoteList(String mem_id) throws SQLException {
		List<NoteVO> list=smc.queryForList("note.getNoteList",mem_id);
		
		return list;
	}

	@Override//로그인 후 상단 풋터에 이름을 띄우기 위한 이름 가져오는 함수
	public int Join(Map<String, Object> map) throws SQLException {
		int answer=(int) smc.queryForObject("member.Join",map);
		return answer;
	}

	@Override
	public String getName(String id) throws SQLException {
		String name=(String) smc.queryForObject("member.getName",id);
		return name;
	}

	@Override
	public String searchId(Map<String, Object> map) throws SQLException {
		String answer=(String) smc.queryForObject("member.searchId",map);
		
		return answer;
	}

	@Override
	public int duplication(String id) throws SQLException {
		System.out.println(id);
		int answer=(int) smc.queryForObject("member.duplication",id);
		return answer;
	}

	@Override
	public Object SignUp(MemberVO vo) throws SQLException {
		Object vo2=(MemberVO) smc.insert("member.SignUp",vo);
		return vo2;
	}

	@Override
	public int picduple(String picname) throws SQLException {
		int answer=(int) smc.queryForObject("member.picduple",picname);
		return answer;
	}

	@Override
	public int searchReg(String id) throws SQLException {
		int answer=(int) smc.queryForObject("member.searchReg",id);
		return answer;
	}

	
	@Override
	public Object proInsert(Profile pro) throws SQLException {
		Object obj=smc.insert("member.proInsert",pro);
		return obj;
	}

	@Override
	public String searchIntro(String id) throws SQLException {
		String answer=(String) smc.queryForObject("member.searchIntro",id);
		return answer;
	}

	@Override
	public int updateMember(Map<String, Object> map) throws SQLException {
		int answer=(int) smc.update("member.updateMember",map);
		return answer;
	}
	
	@Override
	public int updateIntro(Map<String, Object> map2) throws SQLException {
		int answer=(int) smc.update("member.updateIntro",map2);
		return answer;
	}

	@Override
	public int deleteMember(String id) throws SQLException {
		int answer = smc.delete("member.deleteMember",id);
		return answer;
	}
	
	@Override
	public int deleteProfile(String id) throws SQLException {
		int answer = smc.delete("member.deleteProfile",id);
		return answer;
	}

	@Override
	public List<NoteVO> sendNote(String id) throws SQLException {
		List<NoteVO> list=smc.queryForList("note.sendNote",id);
		return list;
	}

	@Override
	public List<NoteVO> receiveNote(String id) throws SQLException {
		List<NoteVO> list=smc.queryForList("note.reciveNote",id);
		return list;
	}

	@Override
	public NoteVO detailReceiveNote(String no) throws SQLException {
		int number=Integer.parseInt(no);
		NoteVO vo = (NoteVO) smc.queryForObject("note.detailReceiveNote",number);
		return vo;
	}

	@Override
	public Profile getProfile(String id) {
		Profile vo = null;
		try {
			vo = (Profile) smc.queryForObject("member.getProfile", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public NoteVO receiveDetail(Map<String, Object> map) throws SQLException {
		System.out.println("dao에서의 map의 id 정보 : "+map.get("id"));
		System.out.println("dao에서의 map의 no 정보 : "+map.get("no"));
		return (NoteVO) smc.queryForObject("note.receiveDetail",map);
	}

	@Override
	public NoteVO sendDetail(Map<String, Object> map) throws SQLException {
		
		return (NoteVO) smc.queryForObject("note.sendDetail",map);
	}

	@Override
	public void updateColor(int no) throws SQLException {
		smc.update("note.updateColor",no);
	}

	@Override
	public int deleteNote(int no) throws SQLException {
		return smc.delete("note.deleteNote",no);
	}

	@Override
	public String searchMem_id(String people) throws SQLException {
		return (String) smc.queryForObject("member.searchMem_id",people);
	}
	
	@Override
	public List<ReviewReplyVO> getReviewReply(String P_NAME) throws SQLException {
		return smc.queryForList("member.getReviewReply",P_NAME);
	}

	@Override
	public List<FreeReplyVO> getFreeReply(String P_NAME) throws SQLException {
		return smc.queryForList("member.getFreeReply",P_NAME);
	}

	@Override
	public List<MainReplyVO> getMainReply(String P_NAME) throws SQLException {
		return smc.queryForList("member.getMainReply",P_NAME);
	}

	@Override
	public int deleteReply(Map<String, Object> map) throws SQLException {
		System.out.println("dao에서 table 이름 : "+map.get("table"));
		System.out.println("dao에서 no 이름 : "+map.get("no"));
		System.out.println("dao에서 num 이름 : "+map.get("num"));
		return smc.delete("member.deleteReply",map);
	}
	
	@Override
	public int deleteReplyReview(int parseInt) throws SQLException {
		return smc.delete("member.deleteReplyReview",parseInt);
	}

	@Override
	public int deleteReplyMain(int parseInt) throws SQLException {
		return smc.delete("member.deleteReplyMain",parseInt);
	}

	@Override
	public int deleteReplyFree(int parseInt) throws SQLException {
		return smc.delete("member.deleteReplyFree",parseInt);
	}

	@Override
	public List<ReviewBoardVO2> getReviewBoard(String pNAME)  throws SQLException {
		return smc.queryForList("member.getReviewBoard",pNAME);
	}
	
	@Override
	public List<MainBoardVO> getMainBoard(String pNAME) throws SQLException  {
		return smc.queryForList("member.getMainBoard",pNAME);
	}

	@Override
	public List<FreeBoardVO> getFreeBoard(String pNAME)  throws SQLException {
		return smc.queryForList("member.getFreeBoard",pNAME);
	}

	@Override
	public int getNoteState(String id) throws SQLException {
		
		return (int) smc.queryForObject("note.getNoteState",id);
	}

	//댓글 총 갯수 가져오기 했음
	@Override
	public int getTotalCount() throws SQLException {
		return (int) smc.queryForObject("note.getTotalCount");
	}

	//했음
	@Override 
	public List<NoteVO> selectByPage(Map<String, Object> map) throws SQLException {
		return smc.queryForList("note.selectByPage", map);
	}

	@Override
	public int getMemberGrade(String id) throws SQLException {
		return (int) smc.queryForObject("member.getMemberGrade",id);
	}

	@Override
	public Object withmejoininsert(Map<String, Object> map) throws SQLException {
		System.out.println("dao에서 : "+map.get("p_name"));
		System.out.println("dao에서 : "+map.get("withme_code"));
		return  smc.insert("note.withmejoininsert", map);
	}

	@Override
	public String searchPw(Map<String, Object> map) throws SQLException {
		return (String) smc.queryForObject("member.searchPw",map);
	}
}
