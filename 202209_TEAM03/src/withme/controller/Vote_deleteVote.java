package withme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/deleteVote.do")
public class Vote_deleteVote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		service.deleteVote(Integer.parseInt(request.getParameter("vo_no")));
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
