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
 * Servlet implementation class InsertData
 */
@WebServlet("/insertData.do")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String backgroundColor = request.getParameter("backgroundColor");
		String textColor = request.getParameter("textColor");
		String allDay = request.getParameter("allDay");
		int id = Integer.parseInt(request.getParameter("_id"));
		String username = request.getParameter("username");
		
		System.out.println("인서트서블릿 실행");
		System.out.println("방번호 : " + id);
		System.out.println("username : " + username);
		System.out.println("allday : " + allDay);
		System.out.println(start);
		
		ScheduleVO svo = new ScheduleVO();
		svo.set_id(id);
		svo.setTitle(title);
		svo.setDescription(description);
		svo.setStart(start);
		svo.setEnd(end);
		svo.setBackgroundColor(backgroundColor);
		svo.setTextColor(textColor);
		svo.setType("");
		svo.setUsername(username);
		
		if(allDay.equals("true")) {
			svo.setAllDay("1");
		}else {
			svo.setAllDay("0");
		}
		System.out.println("svo.getAllday : " + svo.getAllDay());
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		service.insertData(svo);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson("success");
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
		
	}

}
