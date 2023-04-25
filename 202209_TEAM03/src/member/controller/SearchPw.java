package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchPw.do")
public class SearchPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		String confirmCode="naver";
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		
		
		request.setAttribute("confirmCode", confirmCode);
		request.setAttribute("id", id);
		request.setAttribute("email", email);
		
		request.getRequestDispatcher("/MailTest2.do").forward(request, response);
	}
}
