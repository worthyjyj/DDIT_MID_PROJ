package mainBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mainboard/HsearchList.do")
public class HsearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 파라미터로 넘어온 검색어(통합검색용)를 받는다
		String hword = request.getParameter("hword");
		
		// 검색어 데이터를 리스트jsp로 전달한다
		// 메인보드 리스트창으로 이동하는 서블릿 
		request.setAttribute("hword", hword);
		
		request.getRequestDispatcher("/WEB-INF/view/main/withBoardList.jsp")
		.forward(request, response); 
		
	}

	
	

}
