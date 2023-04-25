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

@WebServlet("/sendNote.do")
public class SendNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	//sendPeopleID,sendTitle,sendContent
	//sendPeople,sendTitle,sendContent
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		
		vo.setMem_id(people);//받는사람
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
		
		
		System.out.println("보낸 결과 값!(1이면 성공 0이면 실패!)" +answer);
		
		request.setAttribute("answer", answer);
		
		RequestDispatcher rd=request.getRequestDispatcher("/myPage/note.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
