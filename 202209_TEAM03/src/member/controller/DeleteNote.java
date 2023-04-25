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

/**
 * 메시지 삭제하는거!!
 */
@WebServlet("/deleteNote.do")
public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//checkArray
		String[] names=request.getParameterValues("checkArray");
		
		if(names==null) {
			return;
		}
		for(int i=0; i<names.length; i++) {
			System.out.println(names[i]);
		}
		IMemberService service = MemberServiceImpl.getService();
		
		
		int count=0;
		for(int i=0; i<names.length; i++) {
			try {
				int answer=service.deleteNote(Integer.parseInt(names[i]));
				
				if(answer>0) {
					System.out.println(names[i]+"번 쪽지 삭제!!");
					
					count+=answer;
			
					
				}
				System.out.println("count : "+count);
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/view/member/deleteNote.jsp");
	}

}
