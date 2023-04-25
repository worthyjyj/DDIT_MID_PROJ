package withme.dao;

import java.util.List;
import java.util.Map;

import vo.AccountVO;
import vo.ChatVO;
import vo.Profile;
import vo.VoteItemVO;
import vo.VoteUserVO;
import vo.VoteVO;
import vo.WithMeVO;

public interface IWithMeChatDao {
	// 채팅방 가져오기
	public List<WithMeVO> getWmCode(String pName);
	
	// 채팅 내역 가져오기
	public List<ChatVO> getChatList(ChatVO chatVo);
	
//	// 채팅 텍스트 내역 저장
//	public int insertChat(Map<String, String> param);
	
	// 채팅 텍스트 내역 저장
	public int insertChat(ChatVO chatVo);
	
	// 윗미방 등급 가져오기
	public String getWmGrade(Map<String, String> param);

	// 윗미방 참가자 리스트
	public List<Profile> getWmFriends(String room);


	// 가계부----------------------------------
	
	// 가계부 목록
	public List<AccountVO> getAccList(String room);
	
	// 가계부 insert
	public int insertAcc(AccountVO aVo);

	// 가계부 delete
	public int deleteAcc(int no);

	// 가계부 update
	public int updateAcc(AccountVO accVo);

	
	// 투표------------------------------------
	
	// 투표 추가
	public int insertVote(VoteVO vote);

	// 투표 항목 추가
	public void insertVoteItem(VoteItemVO vivo);

	// 투표 리스트
	public List<VoteVO> getVoteList(int room);

	// 유저가 이미 투표를 했는지 확인하는 메서드
	public int checkVoteUser(Map<String, Object> vo_pn);

	// 이미 투표를 했다면 삭제
	public void deleteVoteUser(Map<String, Object> vo_pn);

	// 투표 유저 테이블에 인서트
	public void insertVoteUser(Map<String, Object> vi_pn);

	// 투표 삭제
	public void deleteVote(int vo_no);

	// 투표 title 수정
	public void updateVote(VoteVO voteVo);
}
