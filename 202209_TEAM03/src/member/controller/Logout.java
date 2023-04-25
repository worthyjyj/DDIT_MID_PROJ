package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 모든 로그아웃은 이 경로로 감
 * 관리자든, 회원이든
 * 
 * 
 * !!!!!!!!!!!주의사항!!!!!!!!!!
 * session을 비울때는 무조건 post방식에 form으로 받아야 비울수있음(이거는 자바정책!!!!!)     
 * @author 신동준
 */
@WebServlet("/logout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		if(session !=null) {
			session.removeAttribute("id");
			session.removeAttribute("name");
			response.sendRedirect(request.getContextPath()+"/log/loginMain.jsp");
			//request.getRequestDispatcher("/log/login.jsp").forward(request, response);
		}
	}

}
