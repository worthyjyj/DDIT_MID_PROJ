package withmeSchedule.service;

import java.util.List;

import vo.ScheduleVO;

public interface IScheduleService {
	
	public List<ScheduleVO> getAllData();
	
	public List<ScheduleVO> getSelectData(int no);
	
	public int insertData(ScheduleVO svo);
	
	public int updateData(ScheduleVO svo);
	
	public int deleteData(int no);

}
