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
 * 메인게시판 글 삭제 
 */
@WebServlet("/mainboard/mainBoardDelete.do")
public class MainBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		service.deletemainboard(mb_no);
		
		request.getRequestDispatcher("/WEB-INF/view/main/withBoardList.jsp")
		.forward(request, response); 
	}

}
