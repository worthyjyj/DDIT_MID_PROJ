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

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/***
 * 
 * 마이페이지에 있는
 * 소개글 업뎃, 비밀번호 업뎃
 * 
 * @author 신동준
 *
 */

@WebServlet("/updateMypage.do")
public class UpdateMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String intro=request.getParameter("intro");
		String rePw=request.getParameter("newPw");
		
		System.out.println(id);
		System.out.println(intro);
		System.out.println(rePw);
		
		IMemberService service=MemberServiceImpl.getService();
		Map<String , Object> map=new HashMap<>();
		map.put("id", id);
		map.put("rePw", rePw);
		
		Map<String, Object> map2=new HashMap<>();
		map2.put("id", id);
		map2.put("intro", intro);
		int answer1=0;
		int answer2=0;
		try {
			answer1=service.updateMember(map);
			answer2=service.updateIntro(map2);
			
			System.out.println("비밀번호업뎃 : "+answer1);
			System.out.println("자기소개업뎃 : "+answer2);
			
			
			response.sendRedirect(request.getContextPath()+"/mypageHome.do");
			//request.getRequestDispatcher(request.getContextPath()+"/mypageHome.do").forward(request, response);
			//response.sendRedirect("myPage/myPageMain.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
