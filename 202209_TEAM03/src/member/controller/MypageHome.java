package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/**
 * 마이페이지에서 자기소개를 받아오기 위한 서블릿
 * @author 신동준
 *
 */
@WebServlet("/mypageHome.do")
public class MypageHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		System.out.println("현재 로그인된 아이디 : "+id);
		
		IMemberService service = MemberServiceImpl.getService();
		String intro="";
		try {
			intro=service.searchIntro(id);
			System.out.println("소개글 : "+intro);
			//소개글까지 완료!!!!
			request.setAttribute("intro", intro);
			request.getRequestDispatcher("myPage/myPageMain.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
