package withmeSchedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import withmeSchedule.service.IScheduleService;
import withmeSchedule.service.ScheduleServiceImpl;

/**
 * Servlet implementation class DeleteData
 */
@WebServlet("/deleteData.do")
public class DeleteData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String sch_no = request.getParameter("sch_no");
		System.out.println("deleteData");
		System.out.println(sch_no);
		
		int no = Integer.parseInt(sch_no);
		
		System.out.println(no);
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		
		service.deleteData(no);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson("success");
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
