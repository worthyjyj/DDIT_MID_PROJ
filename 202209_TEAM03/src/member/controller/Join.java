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
import vo.Profile;

/**
 * 로그인 할때 아이디하고 비밀번호를 받고
 * 상대방의 이름과 id를 가져와서
 * 내 정보함에서 사용할 것들
 * 
 * session의 이름은 name, id이다
 * @author 신동준
 *
 */
@WebServlet("/join.do")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");//아이디 입력받은거
		String pw=request.getParameter("pw");//비밀번호 입력받은거
		String checkbox = request.getParameter("checkbox"); //체크박스 on인지 null인지 체크
		System.out.println("contextpath : "+request.getContextPath());
		if(checkbox==null) {
			checkbox="널";
		}
		
		System.out.println("checkbox값 : "+checkbox);
		
		Map<String, Object> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		
		IMemberService service=MemberServiceImpl.getService();
		
		int answer=0;
		try {
			answer=service.Join(map);
			
			if(answer==1) {	//아이디와 비밀번호가 일치할때 메인페이지로 넘어간다!
				
				String name=service.getName(id);
				
				Profile pVo = service.getProfile(id);
				
				
				
				HttpSession session=request.getSession();
				
				session.setAttribute("name", name);
				session.setAttribute("id", id);
				session.setAttribute("PNAME", pVo.getP_name());
				session.setAttribute("profile", pVo);
				session.setAttribute("grade", service.getMemberGrade(id));
				
				System.out.println("join.do 에서 PNAME : "+pVo.getP_name());
				
				if(checkbox.equals("on")) {
					session.removeAttribute("idcheck");
					session.setAttribute("idcheck", id);
					session.removeAttribute("onoff");
					session.setAttribute("onoff", "on");
				}else{
					session.removeAttribute("idcheck");
					session.setAttribute("idcheck", null);
					session.removeAttribute("onoff");
					session.setAttribute("onoff", null);
				}
				System.out.println("세션에 담긴 값 : "+session.getAttribute("idcheck"));

				//request.getRequestDispatcher("myPage/leaveGroup.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/mainIndex.jsp");
				//request.getRequestDispatcher("/headerfooter.jsp").forward(request, response);
				
			}else if(answer==0){//그게 아닐시 로그인 페이지에서 실패했다고 알려준다.
				String error="에러";
				request.setAttribute("error", error);
				
				request.getRequestDispatcher("/log/loginMain.jsp").
				forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
