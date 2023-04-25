package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/**
 * Servlet implementation class Duple
 */
@WebServlet("/duple.do")
public class Duple extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		IMemberService service=MemberServiceImpl.getService();
		
		int answer=0;
		try {
			answer=service.duplication(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("do : "+answer);
		
		request.setAttribute("answer", answer);
		request.getRequestDispatcher("/WEB-INF/view/member/duple.jsp").forward(request, response);
		
		//response.sendRedirect("view/member/duple.jsp?answer="+answer);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id=request.getParameter("id");
//		IMemberService service=MemberServiceImpl.getService();
//		
//		int answer=0;
//		try {
//			answer=service.duplication(id);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//		response.sendRedirect("view/member/duple.jsp?answer="+answer);
	}

}
