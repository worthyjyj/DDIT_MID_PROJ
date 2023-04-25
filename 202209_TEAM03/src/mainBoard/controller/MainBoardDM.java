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
 * 해당 게시글 수정 삭제창으로 이동하는 서블릿 
 */
@WebServlet("/mainboard/mainBoardDM.do")
public class MainBoardDM extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("mb_no"));
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		int reg_no = Integer.parseInt(request.getParameter("reg_no"));
		
		
		System.out.println("mb_no" + mb_no);
		System.out.println("reg_no" + reg_no);
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		MainJoinVO vo = service.getOneMainBoard(mb_no);
		MainJoinVO vo2 = service.getContiCoun(reg_no);
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("vo2", vo2);
		
		request.getRequestDispatcher("/WEB-INF/view/main/withBoardDM.jsp")
		.forward(request, response); 
	}


}
