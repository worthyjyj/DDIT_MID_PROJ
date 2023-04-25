package freeBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;


@WebServlet("/freeboard/deleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 게시글 삭제
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int bonum = Integer.parseInt(request.getParameter("bo_num"));
		System.out.println(bonum);
		
		// 서비스 객체
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 삭제 실행
		int res = service.deleteBoard(bonum);
		System.out.println(res +"dkjfdkjfkdf");
		
		if(res != 0) {
			System.out.println("삭제요청 성공!");
			response.sendRedirect(request.getContextPath() + "/freeboard/freeBoardList.do");
			
		}else {
			System.out.println("삭제요청 실패!");
			response.sendRedirect(request.getContextPath() + "/freeboard/freeboardArticle.do");
		}
		
	}

}
