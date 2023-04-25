package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.NoteVO;

/**
 * 자유게시판 상세보기에서 메세지 넘기는거!
 */
@WebServlet("/sendNote2.do")
public class SendNote2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		 
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String content = request.getParameter("sendContent");
		String title = request.getParameter("sendTitle");
		String people = request.getParameter("sendPeople");
		
		System.out.println("쪽지보내기에서 내id : "+id);
		System.out.println("쪽지보내기에서 내 내용 : "+content);
		System.out.println("쪽지보내기에서 내 제목  : "+title);
		System.out.println("쪽지보내기에서 받는사람 : "+people);

		IMemberService service = MemberServiceImpl.getService();
		
		
		String mem_id="";
		try {
			mem_id=service.searchMem_id(people);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		
		System.out.println(people+"의 아이디 : "+mem_id);
		NoteVO vo = new NoteVO();

		
		vo.setMem_id(mem_id);//받는사람
		vo.setNote_send(id);//보내는사람
		vo.setNote_content(content);
		vo.setNote_title(title);
		vo.setNote_status(0);

		Object obj = null;
		try {
			obj = service.insertNote(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int answer = 0;
		if (obj == null) {
			answer = 1;
		} else {
			answer = 0;
		}
		
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		
		System.out.println("no = "+bo_num);
		System.out.println("보낸 결과 값!(1이면 성공 0이면 실패!)" +answer);
		
		request.setAttribute("answer", answer);
		request.setAttribute("bo_num", bo_num);
		request.getRequestDispatcher("/myPage/noteAnswer.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/myPage/note.jsp");
//		response.sendRedirect(request.getContextPath()+"/freeboard/freeboardArticle.do?bo_num="+bo_num);
	}

}
