package mainBoard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.MainBoardVO;
import vo.MainJoinVO;
import vo.MainRegionVO;
import vo.MainReplyVO;
import vo.PickVO;

public class MainBoardDaoImpl implements ImainBoardDao {

private SqlMapClient smc;
	
	private static MainBoardDaoImpl dao;
	
	private MainBoardDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();  
	}
	
	public static MainBoardDaoImpl getInstance() {
		if(dao==null) dao = new MainBoardDaoImpl();
		
		return dao;
	}
	

	@Override
	public List<MainJoinVO> mainBoardListN() {
		
		List<MainJoinVO> list = null;
		
		try {
			list = (List<MainJoinVO>) smc.queryForList("mainboard.mainBoardListN");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public MainJoinVO getOneMainBoard(int mb_no) {
		MainJoinVO vo = null;
		
		try {
			vo = (MainJoinVO) smc.queryForObject("mainboard.getOneMainBoard",mb_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; 
	}

	@Override
	public int getMbUphit(int mb_no) {
		int cnt = 0;
		
		try {
			cnt = (int) smc.update("mainboard.getMbUphit",mb_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt; 
	}

	@Override
	public int insertMainReply(Map<String, Object> map) {

		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.insertMainReply", map);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<MainReplyVO> getMBreplyList(int mb_no) {
		List<MainReplyVO> list = null;
		
		try {
			list = (List<MainReplyVO>) smc.queryForList("mainboard.getMBreplyList",mb_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public List<MainRegionVO> getallcontinent() {
		List<MainRegionVO> list = null;
		
		try {
			list = (List<MainRegionVO>) smc.queryForList("mainboard.getallcontinent");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public List<MainRegionVO> getallcountry(int conti_no) {
		List<MainRegionVO> list = null;
		
		try {
			list = (List<MainRegionVO>) smc.queryForList("mainboard.getallcountry",conti_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public List<MainRegionVO> getallregion(int coun_no) {
		List<MainRegionVO> list = null;
		
		try {
			list = (List<MainRegionVO>) smc.queryForList("mainboard.getallregion",coun_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public int maininsert(MainBoardVO vo) {
		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.maininsert", vo);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<MainJoinVO> mainBoardListsort(Map<String, Object> map) {
		List<MainJoinVO> list = null;
		
		try {
			list = (List<MainJoinVO>) smc.queryForList("mainboard.mainBoardListsort", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public List<MainJoinVO> hitList() {
		List<MainJoinVO> list = null;
		
		try {
			list = (List<MainJoinVO>) smc.queryForList("mainboard.hitList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public MainJoinVO getContiCoun(int reg_no) {
		MainJoinVO vo = null;
		
		try {
			vo = (MainJoinVO) smc.queryForObject("mainboard.getContiCoun",reg_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; 
	}

	@Override
	public int updateMainBoard(MainJoinVO vo) {
		int cnt = 0;  
		
		try {
			cnt = smc.update("mainboard.updateMainBoard", vo);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int modifyReply(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
			cnt = smc.update("mainboard.modifyReply",map);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int DeleteReply(int mcom_no) {
		int cnt = 0;  
		
		try {
			cnt = smc.delete("mainboard.DeleteReply",mcom_no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int withmeinsert(MainBoardVO vo) {
		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.withmeinsert", vo);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int withmejoininsert(MainBoardVO vo) {
		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.withmejoininsert", vo);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int noteinsert(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.noteinsert", map);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertpick(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
			Object obj = smc.insert("mainboard.insertpick", map);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int cancelpick(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
			cnt = smc.delete("mainboard.cancelpick",map);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int deletemainboard(int mb_no) {
		int cnt = 0;  
		
		try {
			cnt = smc.delete("mainboard.deletemainboard", mb_no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int getreplycount(int mb_no) {
		int cnt = 0;  
		
		try {
		cnt = (int) smc.queryForObject("mainboard.getreplycount", mb_no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int withmecheck(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
		cnt = (int) smc.queryForObject("mainboard.withmecheck", map);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public List<PickVO> pickList(String PNAME) {
		List<PickVO> list = null;
		
		try {
			list = (List<PickVO>) smc.queryForList("mainboard.pickList",PNAME);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}

	@Override
	public int pickcheck(Map<String, Object> map) {
		int cnt = 0;  
		
		try {
		cnt = (int) smc.queryForObject("mainboard.pickcheck", map);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int changestatus2(int mb_no) {
		int cnt = 0;  
		
		try {
		cnt = smc.update("mainboard.changestatus2",mb_no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int changestatus1(int mb_no) {
		int cnt = 0;  
		
		try {
		cnt = smc.update("mainboard.changestatus1",mb_no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public MainBoardVO currentstatus(int mb_no) {
		MainBoardVO vo = null;
		
		try {
			vo = (MainBoardVO) smc.queryForObject("mainboard.currentstatus",mb_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; 
	}

	@Override
	public List<MainJoinVO> mainBoardpickList(String p_name) {
		List<MainJoinVO> list = null;
		
		try {
			list = (List<MainJoinVO>) smc.queryForList("mainboard.mainBoardpickList",p_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}


}
