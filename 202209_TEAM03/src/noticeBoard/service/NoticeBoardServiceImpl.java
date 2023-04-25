package noticeBoard.service;

import java.util.List;

import noticeBoard.dao.INoticeBoardDAO;
import noticeBoard.dao.NoticeBoardDAOImpl;
import vo.noticeBoardVO;

public class NoticeBoardServiceImpl implements INoticeBoardService {

	private static NoticeBoardServiceImpl service;
	
	private INoticeBoardDAO dao;
	
	private NoticeBoardServiceImpl() {
		dao = NoticeBoardDAOImpl.getInstance();
	}
	
	public static NoticeBoardServiceImpl getInstance() {
		if(service==null) service = new NoticeBoardServiceImpl();
		return service;
	}
	
	@Override
	public List<noticeBoardVO> getNoticeAll() {
		return dao.getNoticeAll();
	}

	@Override
	public int insertNotice(noticeBoardVO nvo) {
		return dao.insertNotice(nvo);
	}

	@Override
	public noticeBoardVO detailNotice(int no) {
		return dao.detailNotice(no);
	}

	@Override
	public int updateNotice(noticeBoardVO nvo) {
		return dao.updateNotice(nvo);
	}

	@Override
	public int deleteNotice(int no) {
		return dao.deleteNotice(no);
	}

	@Override
	public int updateHit(int no) {
		return dao.updateHit(no);
	}

}
