package withme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/withMeFriends.do")
public class WithMeFriedns extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(service.getWmFriends(request.getParameter("room")));
		
		System.out.println("room >>> " + request.getParameter("room"));
		System.out.println("jsonData >>> " + jsonData);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
