package noticeBoard.dao;

import java.util.List;

import vo.noticeBoardVO;

public interface INoticeBoardDAO {
	
	public List<noticeBoardVO> getNoticeAll();
	
	public int insertNotice(noticeBoardVO nvo);
	
	public noticeBoardVO detailNotice(int no);
	
	public int updateNotice(noticeBoardVO nvo);
	
	public int deleteNotice(int no);
	
	public int updateHit(int no);

}
