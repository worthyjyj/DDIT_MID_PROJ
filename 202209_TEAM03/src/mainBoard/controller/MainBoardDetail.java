package mainBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainJoinVO;

/**
 * 메인 상세보기창으로 이동하는 서블릿
 */
@WebServlet("/mainboard/mainBoardDetail.do")

public class MainBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		System.out.println(request.getParameter("mb_no"));
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		
//      상세보기창에 mb_no만 넘길것이 아니라 vo전체를 넘겨서 바로 출력하도록 하면 될 것 같다. 
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		MainJoinVO vo = service.getOneMainBoard(mb_no);
		int replycount = service.getreplycount(mb_no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("replycount", replycount);
		
		request.getRequestDispatcher("/WEB-INF/view/main/mainBoardDetail.jsp")
		.forward(request, response); 
	}


}
