package withme.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.VoteVO;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/updateVote.do")
public class Vote_updateVote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		VoteVO voteVo = new VoteVO();
		voteVo.setVote_no(Integer.parseInt(request.getParameter("vo_no")));
		voteVo.setVote_title(request.getParameter("mtitle"));
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		service.updateVote(voteVo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
