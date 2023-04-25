package withme.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.AccountVO;
import vo.ChatVO;
import vo.Profile;
import vo.VoteItemVO;
import vo.VoteUserVO;
import vo.VoteVO;
import vo.WithMeVO;

public class WithMeDaoImpl implements IWithMeChatDao {
	private SqlMapClient smc;
	private static IWithMeChatDao dao;
	public WithMeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static IWithMeChatDao getInstance() {
		if(dao == null) dao = new WithMeDaoImpl();
		return dao;
	}

	@Override
	public List<WithMeVO> getWmCode(String pName) {
		List<WithMeVO> list = null;
		try {
			list = smc.queryForList("withme.getWmCode", pName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ChatVO> getChatList(ChatVO chatVo) {
		List<ChatVO> chatList = null;
		try {
			chatList = smc.queryForList("withme.getChatList", chatVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chatList;
	}

//	@Override
//	public int insertChat(Map<String, String> param) {
//		int cnt = 0;
//		try {
//			cnt = smc.update("withme.insertChat", param);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return cnt;
//	}
	@Override
	public int insertChat(ChatVO chatVo) {
		int cnt = 0;
		try {
			cnt = smc.update("withme.insertChat", chatVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public String getWmGrade(Map<String, String> param) {
		String g = "";
		try {
			g = (String) smc.queryForObject("withme.getWmGrade", param);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return g;
	}
	
	@Override
	public List<AccountVO> getAccList(String room) {
		List<AccountVO> list = null;
		try {
			list = smc.queryForList("withme.getAccList", room);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int insertAcc(AccountVO aVo) {
		try {
			smc.update("withme.insertAcc", aVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public int deleteAcc(int no) {
		int res = 0;
		try {
			res = smc.delete("withme.deleteAcc", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int updateAcc(AccountVO accVo) {
		int cnt = 0;
		try {
			cnt = smc.update("withme.updateAcc", accVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int insertVote(VoteVO vote) {
		int vo_no = 0;
		try {
			vo_no = (int) smc.insert("withme.insertVote", vote);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo_no;
	}
	
	@Override
	public void insertVoteItem(VoteItemVO vivo) {
		try {
			smc.insert("withme.insertVoteItem", vivo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<VoteVO> getVoteList(int room) {
		List<VoteVO> voList = null;
		try {
			voList = smc.queryForList("withme.getVoteList", room);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return voList;
	}
	
	@Override
	public int checkVoteUser(Map<String, Object> vo_pn) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("withme.checkVoteUser", vo_pn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public void deleteVoteUser(Map<String, Object> vo_pn) {
		try {
			smc.delete("withme.deleteVoteUser", vo_pn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insertVoteUser(Map<String, Object> vi_pn) {
		try {
			smc.insert("withme.insertVoteUser", vi_pn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteVote(int vo_no) {
		try {
			smc.delete("withme.deleteVote", vo_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void updateVote(VoteVO voteVo) {
		try {
			smc.update("withme.updateVote", voteVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Profile> getWmFriends(String room) {
		List<Profile> list = null;
		try {
			list = smc.queryForList("withme.getWmFriends", room);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
