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
import vo.MainBoardVO;

/**
 * 해당 게시글의 모집 상태를 반환하는 서블릿 
 */
@WebServlet("/mainboard/currentstatus.do")
public class Currentstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));		
	
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		MainBoardVO vo = service.currentstatus(mb_no);
		
		int mb_status = Integer.parseInt(vo.getMb_status()); 
		
		
		String result = ""; 
				
		// 결과값 저장 
		if(mb_status == 0) {
		  result = "모집중상태"; 
					
		}else {
		  result = "모집완료상태"; 
		}
				
		System.out.println("result ==> " + result);
				
		PrintWriter out = response.getWriter();
		out.write(result); // text데이터를 응답으로 보내준다. 
		response.flushBuffer();
		
	}

}
