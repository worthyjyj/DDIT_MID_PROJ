package reviewBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO2;

@WebServlet("/reviewBoardListHit.do")
public class ReviewBoardListHit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewBoardListHit() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IReviewService service = ReviewServiceImpl.getService();
		List<ReviewBoardVO2> reviewList = service.getAllReviewByHit();
//		List<ReviewBoardVO2> reviewList2 = service.getAllReview2();//
		
		request.setAttribute("reviewList", reviewList);
//		request.setAttribute("reviewList2", reviewList2);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardListHit.jsp")
					.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
