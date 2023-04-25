package reviewBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;

@WebServlet("/reviewboard/reviewBoardDelete.do")
public class ReviewBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int rev_no = Integer.parseInt(request.getParameter("revNo"));
	
		IReviewService service = ReviewServiceImpl.getService();
		service.deleteReview(rev_no);
		
//		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardList.jsp")
//					.forward(request, response);
		response.sendRedirect(request.getContextPath() + "/reviewboard/reviewBoardList.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
