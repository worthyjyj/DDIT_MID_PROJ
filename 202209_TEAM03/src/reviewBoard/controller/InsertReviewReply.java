package reviewBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;
import vo.ReviewReplyVO;

@WebServlet("/reviewboard/insertReviewReply.do")
public class InsertReviewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		int rev_no = Integer.parseInt(request.getParameter("rev_no").trim());
		
		String revNo = request.getParameter("rev_no");
		int rev_no = Integer.parseInt(revNo);
		
		String rcom_cont = request.getParameter("cont");
//		rcom_cont = rcom_cont.replace("\r\n", "<br>");
		
		String p_name = request.getParameter("pname");
		
		System.out.println("insertReply의 rev_no : " + rev_no);
		System.out.println("insertReply의 cont : " + rcom_cont);
		System.out.println("insertReply의 pname : " + p_name);
		
		// 정보를 DB에 저장
		ReviewReplyVO vo = new ReviewReplyVO();
		
		vo.setRcom_content(rcom_cont);
		vo.setRev_no(rev_no);
		vo.setP_name(p_name);
		
		// 서비스 객체 생성
		IReviewService service = ReviewServiceImpl.getService();
		
//		int res = service.insertReviewReply(vo);
		
		// 댓글 정보를 DB에 insert
		int a=service.insertReviewReply(vo);
		int count = service.getReplyCount(rev_no);
		System.out.println("insertReviewReply.do 에서 반환값 : "+a);
//		if(res != 0) {
//			response.setStatus(200);  // 댓글등록 성공
//			PrintWriter out = response.getWriter();
//			out.write(res);
//		}else {
//			System.out.println("등록요청 실행 실패");
//			response.setStatus(400);
//			PrintWriter out = response.getWriter();
//			out.write(res);
//					
//		}
		
//		ReviewBoardVO rvo = service.getDetailReview(rev_no);						여기서부터
//		List<ReviewReplyVO> replyList = service.replyList(rev_no);
		
		// 작업 완료 후 AfterReviewReply 서블릿으로 이동
		
		
//		System.out.println("rev_no : "+rev_no); //나옴
//		System.out.println(request.getContextPath()+"/afterReviewReply.do"); //형태 넘어옴 나옴
//		System.out.println("rvo: " + rvo.getReg_no()); //게시물 번호 정확하게 넘어옴 
//		System.out.println("replyList의 갯수 : " + replyList.size()); //나옴
//		
//		request.setAttribute("rev_no", rev_no);
//		request.setAttribute("rvo", rvo);
//		request.setAttribute("replyList", replyList);// 갯수 정확함 다 잘나옴
//		request.setAttribute("replyCount", count);
//		
//		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardDetail.jsp").forward(request, response);					여기까지
		
		
		ReviewBoardVO rvo = service.getDetailReview(rev_no);
		ReviewBoardVO2 rvo2= service.getDetailReview2(rev_no);
		
		
		// 후기게시판 댓글리스트
		List<ReviewReplyVO> replyList = service.replyList(rev_no);
		
		request.setAttribute("rvo", rvo);
		request.setAttribute("rvo2", rvo2);
		request.setAttribute("replyCount", count);
		request.setAttribute("replyList", replyList);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardDetail.jsp")
					.forward(request, response);
	}

}
