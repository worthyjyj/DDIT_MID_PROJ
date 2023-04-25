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
import vo.FreeBoardVO;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;
import vo.ReviewReplyVO;

@WebServlet("/reviewboard/reviewBoardDetail.do")
public class ReviewBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
//		String revno = request.getParameter("rev_no");
//		System.out.println(revno);
//		int rev_no = Integer.parseInt(revno);
		
//		int rev_no = Integer.parseInt(request.getParameter("rev_no").trim());
//		System.out.println("rev_no값 : " + rev_no);
		
		String revNo = request.getParameter("rev_no");
		System.out.println(revNo);
		int rev_no = Integer.parseInt(revNo);
		
		IReviewService service = ReviewServiceImpl.getService();
		
		//조회수 증가
		service.updateHit(rev_no);
		
		ReviewBoardVO rvo = service.getDetailReview(rev_no);
		String pname = rvo.getP_name();
		/* ReviewBoardVO2 rvo2= service.getDetailReview2(rev_no); */
		
		// 후기게시글 번호를 받아 댓글 수 조회
		int count = service.getReplyCount(rev_no);
		
		// 프로필 닉네임을 받아 작성자 프로필 조회
		ReviewBoardVO2 writerInfo = service.getWProfileImg(pname); 
		
		// 후기게시판 댓글리스트
		List<ReviewReplyVO> replyList = service.replyList(rev_no);
		
		request.setAttribute("rvo", rvo);
		/* request.setAttribute("rvo2", rvo2); */
		request.setAttribute("replyCount", count);
		request.setAttribute("replyList", replyList);
		request.setAttribute("writerInfo",writerInfo);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

	}

}
