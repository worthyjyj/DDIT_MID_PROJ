package freeBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;

/**
 * 자유게시판 댓글 삭제
 * 
 * @author 박지은
 *
 */
@WebServlet("/freeboard/delReply.do")
public class DelReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get방식으로 넘어온 정보로 댓글 삭제하기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 삭제할 댓글번호를 파싱
		int fcom_no = Integer.parseInt(request.getParameter("idx"));
		System.out.println(fcom_no);
		// 서비스 객체
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 댓글 정보를 받아 delete
		int res = service.deleteReply(fcom_no);
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
