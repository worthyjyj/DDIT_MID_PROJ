package withmeSchedule.service;

import java.util.List;

import vo.ScheduleVO;
import withmeSchedule.dao.IScheduleDAO;
import withmeSchedule.dao.ScheduleDAOImpl;

public class ScheduleServiceImpl implements IScheduleService{
	
	private static ScheduleServiceImpl service;
	
	private IScheduleDAO dao;
	
	private ScheduleServiceImpl() {
		dao = ScheduleDAOImpl.getInstance();
	}
	
	public static ScheduleServiceImpl getInstance() {
		if(service==null) service = new ScheduleServiceImpl();
		return service;
	}

	@Override
	public List<ScheduleVO> getAllData() {
		return dao.getAllData();
	}
	
	@Override
	public List<ScheduleVO> getSelectData(int no) {
		return dao.getSelectData(no);
	}

	@Override
	public int insertData(ScheduleVO svo) {
		return dao.insertData(svo);
	}

	@Override
	public int updateData(ScheduleVO svo) {
		return dao.updateData(svo);
	}

	@Override
	public int deleteData(int no) {
		return dao.deleteData(no);
	}



}
