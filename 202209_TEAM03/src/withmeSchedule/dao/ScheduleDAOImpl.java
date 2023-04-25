package withmeSchedule.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.ScheduleVO;

public class ScheduleDAOImpl implements IScheduleDAO {
	
	private SqlMapClient smc;
	
	private static ScheduleDAOImpl dao;
	
	private ScheduleDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ScheduleDAOImpl getInstance() {
		if(dao==null) dao = new ScheduleDAOImpl();
		return dao;
	}

	@Override
	public List<ScheduleVO> getAllData() {
		List<ScheduleVO> schList = null;
		try {
			schList = smc.queryForList("schedule.getAllData");
		} catch (SQLException e) {
			schList = null;	
			e.printStackTrace();
		}
		return schList;
	}
	
	@Override
	public List<ScheduleVO> getSelectData(int no) {
		List<ScheduleVO> schList = null;
		try {
			schList = smc.queryForList("schedule.getSelectData", no);
		} catch (SQLException e) {
			schList = null;
			e.printStackTrace();
		}
		return schList;
	}	

	@Override
	public int insertData(ScheduleVO svo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("schedule.insertData", svo);
			if(obj==null) cnt = 1;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateData(ScheduleVO svo) {
		int cnt = 0;
		try {
			cnt = smc.update("schedule.updateData", svo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteData(int no) {
		int cnt = 0;
		try {
			cnt = smc.delete("schedule.deleteData", no);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}



}
