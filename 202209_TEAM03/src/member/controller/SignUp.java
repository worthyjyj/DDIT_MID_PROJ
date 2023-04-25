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
import vo.MemberVO;
@WebServlet("/signUp.do")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		String id=request.getParameter("idval");
		String pw=request.getParameter("pwval");
		String name=request.getParameter("nameval");
		String reg=request.getParameter("regval");
		String email=request.getParameter("emailval");
		String tel=request.getParameter("telval");
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(reg);
		System.out.println(email);
		System.out.println(tel);
		
		
		
		String reg1=reg.substring(0, 6);
		String reg2=reg.substring(7);
		
		reg2=reg2.substring(0, 1);
		String reg3=reg1+reg2;
		System.out.println("reg2 : "+reg2);
		System.out.println("reg3 : "+reg3);
		int reg4=Integer.parseInt(reg3);
		
		MemberVO vo=new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pass(pw);
		vo.setMem_name(name);
		vo.setMem_reg(reg4);
		vo.setMem_mail(email);
		vo.setMem_tel(tel);
//		vo.setMem_status(0);
//		vo.setMem_grade(0);
		
		IMemberService service=MemberServiceImpl.getService();
		String answer="";
		try {
			Object answerVO=service.SignUp(vo);
			
			if(answerVO==null) {
				answer="1";
			}else {
				answer="0";
			}
			
			HttpSession session=request.getSession();
			System.out.println(answer);
			request.setAttribute("answer", answer);
			session.setAttribute("mem_id", id);
			request.getRequestDispatcher("/log/join.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
