package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.NoteVO;

/**
 * Servlet implementation class MessageNum
 */
@WebServlet("/messageNum.do")
public class MessageNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		
		String messageNum=request.getParameter("num");
		String id=(String)session.getAttribute("id");
		//0 : 받은편지함
		//1 : 보낸편지함
		
		IMemberService service= MemberServiceImpl.getService();
		
		List<NoteVO> list=null;
		
		if(messageNum == null || messageNum.equals("1")) {
			
			messageNum="1";
			System.out.println("MessageNum에서 넘어온 값은 : "+messageNum);
			try {
				list=service.receiveNote(id); //내가 받은 편지함 확인
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(messageNum.equals("2")) {
			messageNum="2";
//			List<NoteVO> receiveList=null;
			System.out.println("MessageNum에서 넘어온 값은 : "+messageNum);
			try {
				
				list=service.sendNote(id); //내가 보낸 편지함 확인
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(list.size());
		Gson gson = new Gson();
		String jsondata = null;  // json으로 변환된 데이터가 저장될 변수 선언
		
		jsondata = gson.toJson(list);
		
		System.out.println(jsondata);
		
		PrintWriter out=response.getWriter();
		out.write(jsondata);
		response.flushBuffer();
		
		System.out.println("messageNum : "+messageNum);
		
	}

}
