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

/***
 * 
 * 프로필 이름 작성할때 별명도 중복확인할려고 만든거 
 * 
 * @author 신동준
 *
 */
@WebServlet("/picduple.do")
public class Picduple extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String picname=request.getParameter("picval");
		
		System.out.println(picname);
		IMemberService service=MemberServiceImpl.getService();
		
		int answer=0;
		try {
			answer=service.picduple(picname);
			
			System.out.println(answer);
			
			request.setAttribute("answer", answer);
			request.getRequestDispatcher("/WEB-INF/view/member/picduple.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
