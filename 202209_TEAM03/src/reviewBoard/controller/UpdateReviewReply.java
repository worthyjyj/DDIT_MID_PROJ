package reviewBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewReplyVO;

@WebServlet("/updateReviewReply.do")
public class UpdateReviewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int rcom_no = Integer.parseInt(request.getParameter("rcom_no"));
		String rcom_content = request.getParameter("rcom_content");
		
		IReviewService service = ReviewServiceImpl.getService();
		
		ReviewReplyVO vo = new ReviewReplyVO();
		vo.setRcom_no(rcom_no);
		vo.setRcom_content(rcom_content);
		
		int res = service.updateReply(vo);
		
		
		if(res != 0) {
			System.out.println("댓글수정 성공!");
			response.setStatus(200); // 댓글수정 성공
			PrintWriter out = response.getWriter();
			out.write(res);
		}else {
			System.out.println("댓글수정 요청 실행실패");
			response.setStatus(400); // 댓글수정 실패
			PrintWriter out = response.getWriter();
			out.write(res);
		}
	}

}
