package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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

/***
 * 
 * 세션에 로그인 된 아이디 값을 받아서
 * 나한테 온 쪽지함 보는거
 * @author 신동준
 *
 */
@WebServlet("/getId.do")
public class GetId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("num");
		if(num == null)
			num = "1";	// 받은 편지함
		
		HttpSession session=request.getSession();
		
		
		String id=(String)session.getAttribute("id");//(여기에 세션이 들어와야함!)
		
		
		IMemberService service=MemberServiceImpl.getService();
		
		List<NoteVO> list=null;
		int statusCount=0;
		try {
			
			
			list = service.getNoteList(id, num);
			statusCount = service.getNoteState(id);
			
			
			request.setAttribute("statusCount", statusCount);
			request.setAttribute("list", list);
			request.setAttribute("num", num);
			RequestDispatcher rd=request.getRequestDispatcher("/myPage/message.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
