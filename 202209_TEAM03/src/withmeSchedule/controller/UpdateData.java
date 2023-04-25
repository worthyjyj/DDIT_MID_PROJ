package withmeSchedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UpdateData
 */
@WebServlet("/updateData.do")
public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 실행");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String allDay = request.getParameter("allDay");//나옴
		String title = request.getParameter("title");//나옴
		String start = request.getParameter("start");//나옴
		String end = request.getParameter("end");//나옴
		String backgroundColor = request.getParameter("backgroundColor");//나옴
		String textColor = request.getParameter("textColor");//안나옴
		String description = request.getParameter("description");//나옴
		String _id = request.getParameter("id");//나옴
		String username = request.getParameter("username");//안나옴 필요없음
		String sch_no = request.getParameter("sch_no");

		ScheduleVO svo = new ScheduleVO();
		svo.setTitle(title);
		svo.setDescription(description);
		svo.setStart(start);
		svo.setEnd(end);
		svo.setBackgroundColor(backgroundColor);
		svo.setCal_no(Integer.parseInt(sch_no));
		
		System.out.println(svo.toString());
		
		
		
		if(allDay.equals("true")) {
			svo.setAllDay("1");
		}else {
			svo.setAllDay("0");
		}
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		int a=service.updateData(svo);
		
		System.out.println("성공하면 1이상 1 : "+a);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson("success");
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
				
		
		
	}

}
