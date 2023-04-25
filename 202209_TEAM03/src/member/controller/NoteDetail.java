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
import vo.NoteVO;

/**
 * Servlet implementation class NoteDetail
 */
@WebServlet("/noteDetail.do")
public class NoteDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no=request.getParameter("no");
		String num=request.getParameter("num");
		
		System.out.println("(NoteDetail)번호 : "+no);
		System.out.println("(NoteDetail) 0아니면 1 나와야함 : "+num);
		
		
		IMemberService service=MemberServiceImpl.getService();
		if(num.equals("0")) {
			try {
				NoteVO vo=service.detailReceiveNote(no);
				
				
				request.setAttribute("NoteVO", vo);
				response.sendRedirect("myPage/detailNote.jsp?vo="+vo);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
