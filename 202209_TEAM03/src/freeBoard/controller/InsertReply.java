package freeBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeReplyVO;

/**
 * 댓글 등록
 * 
 * @author 박지은
 *
 */
@WebServlet("/freeboard/insertReply.do")
public class InsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		String content = request.getParameter("vc");
		String pname = request.getParameter("pname");
		
		FreeReplyVO vo = new FreeReplyVO();
		vo.setFb_no(bonum);
		vo.setFcom_content(content);
		vo.setP_name(pname);
		
		
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
	
		int res = service.insertReply(vo);
		
		if(res != 0) {
			response.setStatus(200); // 댓글등록 성공
			PrintWriter out = response.getWriter();
			out.write(res);
			
		}else { 
			System.out.println("등록요청 실행실패");
			response.sendError(400);
			PrintWriter out = response.getWriter();
			out.write(res);
		}
		
		
	}

}
