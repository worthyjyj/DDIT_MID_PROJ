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
/***
 * 
 * 이 서블릿 안씀 필요없음
 * 
 * @author 신동준
 *
 */

@WebServlet("/afterReviewReply.do")
public class AfterReviewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String revNo= (String) request.getAttribute("rev_no");
//		String revNo = request.getParameter("rev_no");
		int rev_no = Integer.parseInt(revNo);
		System.out.println("AfterReviewReply의 rev_no : " + rev_no);
//		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		IReviewService service = ReviewServiceImpl.getService();
		
		ReviewBoardVO rvo = service.getDetailReview(rev_no);
		
		request.setAttribute("rvo", rvo);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardDetail.jsp")
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
