package withme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/voteList.do")
public class Vote_voteList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		int room = Integer.parseInt(request.getParameter("room"));
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		
		String jsonData = service.getAllVote(room);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
