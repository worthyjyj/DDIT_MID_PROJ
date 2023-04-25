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
 * 회원탈퇴를 위한 아이디를 받고
 * 멤버에 DELETE를 함
 * 
 * @author 신동준
 *
 */

@WebServlet("/leaveGroup.do")
public class LeaveGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		System.out.println("아이디 넘겨 받은거(회원탈퇴) : "+id);
		
		
		IMemberService service=MemberServiceImpl.getService();
		
		int answer1=0;
		int answer2=0;
		try {
			answer1=service.deleteMember(id);
			answer2=service.deleteProfile(id);
			
			System.out.println("answer1 : "+answer1);
			
			request.setAttribute("answer", answer1);
			request.getRequestDispatcher("/WEB-INF/view/member/leaveGroup.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
