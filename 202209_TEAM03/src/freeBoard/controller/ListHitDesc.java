package freeBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;


@WebServlet("/freeboard/listHitDesc.do")
public class ListHitDesc extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String sort = request.getParameter("sort");
		
		// 서비스 객체 
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();

		// 리스트요청
		List<FreeBoardVO> boardListHit = service.OrderByHit();
		
		// 키에 담아
		request.setAttribute("boardList", boardListHit);
		request.setAttribute("sort", sort);
		
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardList.jsp").forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
