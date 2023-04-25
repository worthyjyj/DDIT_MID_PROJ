package searchList.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchList.service.searchListService;
import searchList.service.searchListServiceImpl;
import vo.FreeBoardVO;
import vo.MainBoardVO;
import vo.ReviewBoardVO2;

@WebServlet("/searchAllList.do" )
public class searchAllList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("searchAllList servlet start!");
		
		String data = request.getParameter("sdata");
		data = '%' + data + '%'; 
		
		System.out.println("data : " + data);
		
		searchListService service = searchListServiceImpl.getInstance();
		
		List<MainBoardVO> mainList = service.searchMainBoardList(data);
		List<FreeBoardVO> freeList = service.searchFreeBoardList(data);
		List<ReviewBoardVO2> reviewList = service.searchReviewBoardList(data);
		
		request.setAttribute("mainList", mainList);
		request.setAttribute("freeList", freeList);
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("WEB-INF/view/search/searchList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
	}

}
