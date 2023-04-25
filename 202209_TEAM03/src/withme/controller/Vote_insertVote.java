package withme.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.VoteItemVO;
import vo.VoteVO;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/insertVote.do")
public class Vote_insertVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		
		VoteVO vote = new VoteVO();
		vote.setVote_title(request.getParameter("title"));
		vote.setVote_edate(request.getParameter("date"));
		vote.setWithme_code(Integer.parseInt(request.getParameter("room")));
		
		service.insertVote(vote, request.getParameter("items"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
