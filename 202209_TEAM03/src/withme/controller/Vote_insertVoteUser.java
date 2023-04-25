package withme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/insertVoteUser.do")
public class Vote_insertVoteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int vo_no = Integer.parseInt(request.getParameter("vo_no"));
		int vi_no = Integer.parseInt(request.getParameter("vi_no"));
		String pName = request.getParameter("pName");
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		service.insertVoteUser(vo_no, vi_no, pName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
