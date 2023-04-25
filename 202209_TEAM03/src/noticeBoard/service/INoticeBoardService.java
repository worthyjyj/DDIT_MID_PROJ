package noticeBoard.service;

import java.util.List;

import vo.noticeBoardVO;

public interface INoticeBoardService {
	
	public List<noticeBoardVO> getNoticeAll();
	
	public int insertNotice(noticeBoardVO nvo);
	
	public noticeBoardVO detailNotice(int no);
	
	public int updateNotice(noticeBoardVO nvo);
	
	public int deleteNotice(int no);
	
	public int updateHit(int no);

}
