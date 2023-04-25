package noticeBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.noticeBoardVO;

public class NoticeBoardDAOImpl implements INoticeBoardDAO{
	
	private SqlMapClient smc;
	
	private static NoticeBoardDAOImpl dao;
	
	private NoticeBoardDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static NoticeBoardDAOImpl getInstance() {
		if(dao == null) dao = new NoticeBoardDAOImpl();
		return dao;
	}

	@Override
	public List<noticeBoardVO> getNoticeAll() {
		List<noticeBoardVO> noticeList = null;
		try {
			noticeList = smc.queryForList("notice.getNoticeAll");
		} catch (SQLException e) {
			noticeList = null;
			e.printStackTrace();
		}
		return noticeList;
	}

	@Override
	public int insertNotice(noticeBoardVO nvo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("notice.insertNotice",nvo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public noticeBoardVO detailNotice(int no) {
		noticeBoardVO nvo = null;
		
		try {
			nvo = (noticeBoardVO) smc.queryForObject("notice.detailNotice", no);
		} catch (SQLException e) {
			nvo = null;
			e.printStackTrace();
		}
		return nvo;
	}

	@Override
	public int updateNotice(noticeBoardVO nvo) {
		int cnt = 0;
		try {
			cnt = smc.update("notice.updateNotice", nvo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(int no) {
		int cnt = 0;
		try {
			cnt = smc.delete("notice.deleteNotice", no);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHit(int no) {
		int cnt = 0;
		try {
			cnt = smc.update("notice.updateHit", no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
