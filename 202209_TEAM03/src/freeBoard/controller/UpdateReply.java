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
import vo.FreeReplyVO;

/**
 * 자유게시판 댓글 수정
 * 
 *  author 박지은
 */
@WebServlet("/freeboard/updateReply.do")
public class UpdateReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int fcom_no = Integer.parseInt(request.getParameter("fcom_no"));
		String fcom_content = request.getParameter("fcom_content");
		
		// 서비스 객체 
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 댓글객체에 수정한 데이터 담아주기
		FreeReplyVO rvo = new FreeReplyVO();
		rvo.setFcom_no(fcom_no);
		rvo.setFcom_content(fcom_content);
		
		int res = service.updateReply(rvo);
		
		
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
