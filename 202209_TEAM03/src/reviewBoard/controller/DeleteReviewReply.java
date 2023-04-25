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

@WebServlet("/deleteReviewReply.do")
public class DeleteReviewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		int rcom_no = Integer.parseInt(request.getParameter("idx"));
		System.out.println(rcom_no);
		
		IReviewService service = ReviewServiceImpl.getService();
		
		int res = service.deleteReply(rcom_no);
		
		String result = "";
		if(res > 0) {
			result = "댓글삭제성공";
		}else {
			result = "댓글삭제실패";
		}
		
		System.out.println("result =>"+ result);
		
		PrintWriter out = response.getWriter();
		out.write(result); 
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
