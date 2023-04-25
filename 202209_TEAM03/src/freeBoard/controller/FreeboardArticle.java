package freeBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;
import vo.FreeReplyVO;

/**
 * Servlet implementation class FreeboardArticle
 */
@WebServlet("/freeboard/freeboardArticle.do")
public class FreeboardArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("bo_num");
		
		
		System.out.println("freeboardArticle의 num = "+num);
		
		// 서비스 객체 생성
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 글 선택 시 조회수 증가
		service.updateHit(Integer.parseInt(num));
			
		// 게시글 번호를 받아 상세조회
		FreeBoardVO vo = service.getArticle(Integer.parseInt(num));
		String pname = vo.getP_name();
		
//		if(vo!=null) {
//			System.out.println("서비스에서 넘겨받은 vo는 널이 아님!!");
//		}

		// 게시글 번호를 받아 댓글 수 조회
		int count = service.getReplyCount(Integer.parseInt(num));
		
		// 프로필 닉네임을 받아 작성자 프로필 조회
		FreeBoardVO writerInfo = service.getWProfileImg(pname);
		 
		// 댓글리스트 -> 댓글 상태 확인 가능
		List<FreeReplyVO> list = service.listReply(Integer.parseInt(num));
		
		
		// 댓글상태체크
		if(list == null || list.size() == 0 ) {
			System.out.println("아직 답변이 없습니다.");
		}else {
			System.out.println("답변이 있습니다. 답변완료!");
		}
		
		request.setAttribute("getArticle", vo);
		request.setAttribute("reply", list);
		request.setAttribute("replyCount", count);
		request.setAttribute("writerInfo", writerInfo);
		
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardDetail.jsp").forward(request, response);
	}

}



