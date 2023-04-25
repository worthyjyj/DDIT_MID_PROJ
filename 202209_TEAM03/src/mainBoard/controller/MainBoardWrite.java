package mainBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mainboard/mainBoardWrite.do")
public class MainBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인보드 글쓰기 창으로 이동하는 서블릿 
		request.getRequestDispatcher("/WEB-INF/view/main/withBoardWrite.jsp")
		.forward(request, response); 

//		response.sendRedirect(request.getContextPath()+"/WEB-INF/view/main/withBoardWrite.jsp");
	}


}
