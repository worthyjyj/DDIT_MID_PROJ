package withme.service;

import java.util.List;
import java.util.Map;

import vo.AccountVO;
import vo.ChatVO;
import vo.Profile;
import vo.VoteVO;
import vo.WithMeVO;

public interface IWithMeChatService {
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
	
	// 투표 추가 / 파라미터 : 투표 : 투표 항목
	public void insertVote(VoteVO vote, String parameter);

	// 투표 전체 >> 투표 + 투표항목 + 투표참여자
	// jsonData로 변환해서 리턴
	public String getAllVote(int room);

	// 투표유저 테이블에 인서트
	// 만약 이미 투표를 했다면 기존값 삭제하고 인서트
	public void insertVoteUser(int vo_no, int vi_no, String pName);

	// 투표 삭제
	public void deleteVote(int vo_no);

	// 투표 title 수정
	public void updateVote(VoteVO voteVo);
}
