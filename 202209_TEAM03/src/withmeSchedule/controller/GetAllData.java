package withmeSchedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import vo.ScheduleVO;
import withmeSchedule.service.IScheduleService;
import withmeSchedule.service.ScheduleServiceImpl;

/**
 * Servlet implementation class GetAllData
 */
@WebServlet("/getAllData.do")
public class GetAllData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		
		List<ScheduleVO> calList = service.getAllData();
		System.out.println(calList);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(calList);
		
		System.out.println(jsonData);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
	}

}
