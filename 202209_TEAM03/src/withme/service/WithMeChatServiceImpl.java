package withme.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import vo.AccountVO;
import vo.ChatVO;
import vo.Profile;
import vo.VoteItemVO;
import vo.VoteUserVO;
import vo.VoteVO;
import vo.WithMeVO;
import withme.dao.IWithMeChatDao;
import withme.dao.WithMeDaoImpl;

public class WithMeChatServiceImpl implements IWithMeChatService {
	private IWithMeChatDao dao;
	private static IWithMeChatService service;
	private WithMeChatServiceImpl() {
		dao = WithMeDaoImpl.getInstance();
	}
	public static IWithMeChatService getInstance() {
		if(service == null) service = new WithMeChatServiceImpl();
		return service;
	}

	@Override
	public List<WithMeVO> getWmCode(String pName) {
		return dao.getWmCode(pName);
	}

	@Override
	public List<ChatVO> getChatList(ChatVO chatVo) {
		return dao.getChatList(chatVo);
	}

//	@Override
//	public int insertChat(Map<String, String> param) {
//		return dao.insertChat(param);
//	}
	
	@Override
	public int insertChat(ChatVO chatVo) {
		return dao.insertChat(chatVo);
	}
	@Override
	public String getWmGrade(Map<String, String> param) {
		return dao.getWmGrade(param);
	}
	
	@Override
	public List<AccountVO> getAccList(String room) {
		List<AccountVO> accList = dao.getAccList(room);
		if(accList != null && accList.size() > 0) {
			for(AccountVO aVo : accList) {
				if(aVo.getAcc_date() != null)
					aVo.setAcc_date(aVo.getAcc_date().split(" ")[0]);
			}
		}
		return accList;
	}
	
	@Override
	public int insertAcc(AccountVO aVo) {
		return dao.insertAcc(aVo);
	}
	
	@Override
	public int deleteAcc(int no) {
		return dao.deleteAcc(no);
	}
	
	@Override
	public int updateAcc(AccountVO accVo) {
		return dao.updateAcc(accVo);
	}
	@Override
	public void insertVote(VoteVO vote, String parameter) {
		int vo_no = dao.insertVote(vote);
		
		String[] viArr = parameter.split("\\|\\|");
		for(int i = 0; i < viArr.length; i++) {
			System.out.println(viArr[i]);
			VoteItemVO vivo = new VoteItemVO();
			vivo.setVote_no(vo_no);
			vivo.setVi_content(viArr[i]);
			dao.insertVoteItem(vivo);
		}
	}
	
	@Override
	public String getAllVote(int room) {
		List<VoteVO> vList = dao.getVoteList(room);
		
		Gson gson = new Gson();
		
		return gson.toJson(vList);
	}
	
	@Override
	public void insertVoteUser(int vo_no, int vi_no, String pName) {
		Map<String, Object> vo_pn = new HashMap<String, Object>();
		vo_pn.put("vo_no", vo_no);
		vo_pn.put("pName", pName);
		
		int cnt = dao.checkVoteUser(vo_pn);
		
		if(cnt > 0) {
			dao.deleteVoteUser(vo_pn);
		}
		
		Map<String, Object> vi_pn = new HashMap<String, Object>();
		vi_pn.put("vi_no", vi_no);
		vi_pn.put("pName", pName);
		
		dao.insertVoteUser(vi_pn);
	}
	
	@Override
	public void deleteVote(int vo_no) {
		dao.deleteVote(vo_no);
	}
	
	@Override
	public void updateVote(VoteVO voteVo) {
		dao.updateVote(voteVo);
	}
	
	@Override
	public List<Profile> getWmFriends(String room) {
		return dao.getWmFriends(room);
	}
}
;