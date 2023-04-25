package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/***
 * 
 * 내정보에서 회원 수정폼에서
 * 일단 기존의 비밀번호를 알아야만 바꾸게 할려고
 * 비동기식으로 데이터 뺄려고 하는거
 * @author 신동준
 *
 */

@WebServlet("/confirmPw.do")
public class ConfirmPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		HttpSession session= request.getSession();//
		String id=(String) session.getAttribute("id");
		System.out.println("가져온 아이디값  :"+id);
		System.out.println("가져온 비밀번호 값  : "+pw);
		
		IMemberService service=MemberServiceImpl.getService();
		
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		
		int answer=0;
		try {
			answer=service.Join(map);
			
				if(answer==1) {
					System.out.println("아이디와 비밀번호 일치!!!");
				}else {
					System.out.println("아이디와 비밀번호 불일치!!!");
				}
			
				
				request.setAttribute("answer", answer);
				
				request.getRequestDispatcher("/WEB-INF/view/member/confirmPw.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
