package mainBoard.service;

import java.util.List;
import java.util.Map;

import mainBoard.dao.ImainBoardDao;
import mainBoard.dao.MainBoardDaoImpl;
import vo.MainBoardVO;
import vo.MainJoinVO;
import vo.MainRegionVO;
import vo.MainReplyVO;
import vo.PickVO;

public class MainBoardServiceImpl implements ImainBoardService {
	
		private static MainBoardServiceImpl service;
		
		private ImainBoardDao dao;	
		
		private MainBoardServiceImpl() {
			dao = MainBoardDaoImpl.getInstance(); 
		}
		
		public static MainBoardServiceImpl getInstance() {
			if(service==null) service = new MainBoardServiceImpl();
			
			return service;
		}

	@Override
	public List<MainJoinVO> mainBoardListN() {
		return dao.mainBoardListN();
	}

	@Override
	public MainJoinVO getOneMainBoard(int mb_no) {
		
		return dao.getOneMainBoard(mb_no);
	}

	@Override
	public int getMbUphit(int mb_no) {
		// TODO Auto-generated method stub
		return dao.getMbUphit(mb_no);
	}

	@Override
	public int insertMainReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertMainReply(map);
	}

	@Override
	public List<MainReplyVO> getMBreplyList(int mb_no) {
		// TODO Auto-generated method stub
		return dao.getMBreplyList(mb_no);
	}

	@Override
	public List<MainRegionVO> getallcontinent() {
		// TODO Auto-generated method stub
		return dao.getallcontinent();
	}

	@Override
	public List<MainRegionVO> getallcountry(int conti_no) {
		// TODO Auto-generated method stub
		return dao.getallcountry(conti_no);
	}

	@Override
	public List<MainRegionVO> getallregion(int coun_no) {
		// TODO Auto-generated method stub
		return dao.getallregion(coun_no);
	}

	@Override
	public int maininsert(MainBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.maininsert(vo);
	}

	@Override
	public List<MainJoinVO> mainBoardListsort(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.mainBoardListsort(map);
	}

	@Override
	public List<MainJoinVO> hitList() {
		// TODO Auto-generated method stub
		return dao.hitList();
	}

	@Override
	public MainJoinVO getContiCoun(int reg_no) {
		// TODO Auto-generated method stub
		return dao.getContiCoun(reg_no);
	}

	@Override
	public int updateMainBoard(MainJoinVO vo) {
		// TODO Auto-generated method stub
		return dao.updateMainBoard(vo);
	}

	@Override
	public int modifyReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.modifyReply(map);
	}

	@Override
	public int DeleteReply(int mcom_no) {
		// TODO Auto-generated method stub
		return dao.DeleteReply(mcom_no);
	}

	@Override
	public int withmeinsert(MainBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.withmeinsert(vo);
	}

	@Override
	public int withmejoininsert(MainBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.withmejoininsert(vo);
	}

	@Override
	public int noteinsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.noteinsert(map);
	}

	@Override
	public int insertpick(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertpick(map);
	}

	@Override
	public int cancelpick(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.cancelpick(map);
	}

	@Override
	public int deletemainboard(int mb_no) {
		// TODO Auto-generated method stub
		return dao.deletemainboard(mb_no);
	}

	@Override
	public int getreplycount(int mb_no) {
		// TODO Auto-generated method stub
		return dao.getreplycount(mb_no);
	}

	@Override
	public int withmecheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.withmecheck(map);
	}

	@Override
	public List<PickVO> pickList(String PNAME) {
		// TODO Auto-generated method stub
		return dao.pickList(PNAME);
	}

	@Override
	public int pickcheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.pickcheck(map);
	}

	@Override
	public int changestatus2(int mb_no) {
		// TODO Auto-generated method stub
		return dao.changestatus2(mb_no);
	}

	@Override
	public int changestatus1(int mb_no) {
		// TODO Auto-generated method stub
		return dao.changestatus1(mb_no);
	}

	@Override
	public MainBoardVO currentstatus(int mb_no) {
		// TODO Auto-generated method stub
		return dao.currentstatus(mb_no);
	}

	@Override
	public List<MainJoinVO> mainBoardpickList(String p_name) {
		// TODO Auto-generated method stub
		return dao.mainBoardpickList(p_name);
	}



	

}
