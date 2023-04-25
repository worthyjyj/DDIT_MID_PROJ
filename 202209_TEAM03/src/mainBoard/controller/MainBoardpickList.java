package mainBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * pickList페이지로 이동하는 서블릿 
 */
@WebServlet("/mainboard/mainBoardpickList.do")
public class MainBoardpickList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메인보드 리스트창으로 이동하는 서블릿 
				request.getRequestDispatcher("/WEB-INF/view/main/withBoardPICKList.jsp")
				.forward(request, response); 
		
	}

	

}
