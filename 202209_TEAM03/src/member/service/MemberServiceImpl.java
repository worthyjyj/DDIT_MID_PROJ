package member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
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

public class MemberServiceImpl implements IMemberService {
	private static IMemberService service;
	private IMemberDao dao;
	
	
	
	private MemberServiceImpl() {
		dao=MemberDaoImpl.getDao();
	}
	
	public static IMemberService getService() {
		if(service==null) {
			service=new MemberServiceImpl();
		}
		return service;
	}
	
	@Override
	public String getId(String id) throws SQLException{
		
		String name=dao.getId(id);
		
		return name;
	}

	@Override
	public Object insertNote(NoteVO vo) throws SQLException {
		Object obj=dao.insertNote(vo);
		
		return obj;
	}


	@Override
	public List<NoteVO> getNoteList(String mem_id, String num) throws SQLException {
		List<NoteVO> list = new ArrayList<NoteVO>();
		if(Integer.parseInt(num) == 1) {
			list = dao.receiveNote(mem_id);
		}else {
			list = dao.sendNote(mem_id);
		}
		System.out.println("서비스 넘겨받은 아이디 : "+mem_id);
		return list;
	}

	@Override//로그인을 하기 위해 로그인 아이디와 로그인 비밀번호 받는 함수
	public int Join(Map<String, Object> map) throws SQLException {
		System.out.println(map.get("id"));
		System.out.println(map.get("pw"));
		int answer=dao.Join(map);
		
		return answer;
	}

	@Override//로그인 후 상단 풋터에 이름을 띄우기 위한 이름 가져오는 함수
	public String getName(String id) throws SQLException {
		String name=dao.getName(id);
		return name;
	}

	@Override
	public String searchId(Map<String, Object> map) throws SQLException {
		String answer=dao.searchId(map);
		return answer;
	}

	@Override //회원가입 시 중복확인용
	public int duplication(String id) throws SQLException {
		int answer=dao.duplication(id);
		
		return answer;
	}

	@Override
	public Object SignUp(MemberVO vo) throws SQLException {
		Object vo2=dao.SignUp(vo);
		return vo2;
	}

	@Override
	public int picduple(String picname) throws SQLException {
		int answer=dao.picduple(picname);
		return answer;
	}

	@Override
	public int searchReg(String id) throws SQLException {
		int answer=dao.searchReg(id);
		return answer;
	}

	@Override
	public Object proInsert(Profile pro) throws SQLException {
		Object obj=dao.proInsert(pro);
		
		return obj;
	}

	@Override
	public String searchIntro(String id) throws SQLException {
		String answer=dao.searchIntro(id);
		return answer;
	}

	@Override
	public int updateMember(Map<String, Object> map) throws SQLException {
		int answer=dao.updateMember(map);
		return answer;
	}

	@Override
	public int updateIntro(Map<String, Object> map2) throws SQLException {
		int answer=dao.updateIntro(map2);
		return answer;
	}

	@Override
	public int deleteMember(String id) throws SQLException {
		int answer=dao.deleteMember(id);
		return answer;
	}

	@Override
	public int deleteProfile(String id) throws SQLException {
		int answer=dao.deleteProfile(id);
		return answer;
	}

	@Override
	public List<NoteVO> sendNote(String id) throws SQLException {
		List<NoteVO> list=dao.sendNote(id);
		return list;
	}

	@Override
	public List<NoteVO> receiveNote(String id) throws SQLException {
		List<NoteVO> list=dao.receiveNote(id);
		return list;
	}

	@Override
	public NoteVO detailReceiveNote(String no) throws SQLException {
		NoteVO vo=dao.detailReceiveNote(no);
		return vo;
	}

	@Override
	public Profile getProfile(String id) throws SQLException {
		return dao.getProfile(id);
	}

	@Override
	public NoteVO receiveDetail(Map<String, Object> map) throws SQLException {
		
		return dao.receiveDetail(map);
	}

	@Override
	public NoteVO sendDetail(Map<String, Object> map) throws SQLException {
		
		return dao.sendDetail(map);
	}

	@Override
	public void updateColor(int no) throws SQLException {
		dao.updateColor(no);
	}

	@Override
	public int deleteNote(int no) throws SQLException {
		return dao.deleteNote(no);
	}

	@Override
	public String searchMem_id(String people) throws SQLException {
		return dao.searchMem_id(people);
	}
	
	@Override
	public List<ReviewReplyVO> getReviewReply(String P_NAME) throws SQLException {
		return dao.getReviewReply(P_NAME);
	}

	@Override
	public List<FreeReplyVO> getFreeReply(String P_NAME) throws SQLException {
		return dao.getFreeReply(P_NAME);
	}

	@Override
	public List<MainReplyVO> getMainReply(String P_NAME) throws SQLException {
		return dao.getMainReply(P_NAME);
	}

	@Override
	public int deleteReply(Map<String,Object> map) throws SQLException {
		return dao.deleteReply(map);
	}

	@Override
	public int deleteReplyReview(int parseInt) throws SQLException {
		return dao.deleteReplyReview(parseInt);
	}

	@Override
	public int deleteReplyMain(int parseInt) throws SQLException {
		return dao.deleteReplyMain(parseInt);
	}

	@Override
	public int deleteReplyFree(int parseInt) throws SQLException {
		return dao.deleteReplyFree(parseInt);
	}

	@Override
	public List<ReviewBoardVO2> getReviewBoard(String pNAME)  throws SQLException {
		return dao.getReviewBoard(pNAME);
	}

	@Override
	public List<MainBoardVO> getMainBoard(String pNAME)  throws SQLException {
		return dao.getMainBoard(pNAME);
	}

	@Override
	public List<FreeBoardVO> getFreeBoard(String pNAME) throws SQLException  {
		return dao.getFreeBoard(pNAME);
	}

	@Override
	public int getNoteState(String id) throws SQLException {
		return dao.getNoteState(id);
	}

	//댓글 총 갯수 가져오기
	@Override
	public int getTotalCount() {
		int   count = 0;
		
		try {
			count = dao.getTotalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override//했음
	public PageVO pageInfo(int page) throws SQLException {
		int count = this.getTotalCount();
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if(end > count)  end = count;
			
		//전체 페이지수 구하기 
		int totalPage =  (int)Math.ceil((double)count / PageVO.getPerList());
		
		int startPage = ((page-1) /PageVO.getPerPage() * PageVO.getPerPage() ) + 1;
		int endPage = startPage + PageVO.getPerPage() - 1;
		if(endPage > totalPage ) endPage = totalPage;
		
		PageVO  vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

	@Override//했음
	public List<NoteVO> selectByPage(Map<String, Object> map) throws SQLException {
		List<NoteVO> list=null;
		
		list=dao.selectByPage(map);
		return list;
	}

	@Override
	public int getMemberGrade(String id) throws SQLException {
		return dao.getMemberGrade(id);
	}

	@Override
	public Object withmejoininsert(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return dao.withmejoininsert(map);
	}

	@Override
	public String searchPw(Map<String, Object> map) throws SQLException {
		return dao.searchPw(map);
	}
	
}
