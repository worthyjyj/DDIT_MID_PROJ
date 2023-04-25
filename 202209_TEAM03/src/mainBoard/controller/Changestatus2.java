package mainBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainJoinVO;

/**
 * 해당 게시물의 모집상태를 0에서 1로 변경하는 서블릿 
 */
@WebServlet("/mainboard/changestatus2.do")
public class Changestatus2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("넘어오니??" +request.getParameter("mb_no"));
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));		
	
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		int res = service.changestatus2(mb_no);
		
		String result = ""; 
		
		// 결과값 저장 
		if(res > 0) {
		  result = "성공"; 
					
		}else {
		  result = "실패"; 
		}
				
		System.out.println("result ==> " + result);
				
		PrintWriter out = response.getWriter();
		out.write(result); // text데이터를 응답으로 보내준다. 
		response.flushBuffer();

	}

}
