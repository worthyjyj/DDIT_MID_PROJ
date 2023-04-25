package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/***
 * 
 * 마이게시판에서 내가 쓴 댓글들 구분별로
 * 제거하는거
 * @author 신동준
 *
 */
@WebServlet("/deleteReply.do")
public class DeleteReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//checkArray
		String[] names=request.getParameterValues("checkArray");
		int num=Integer.parseInt(request.getParameter("num"));
		
		
		System.out.println("deleteReply에서 num값 : "+num);
		if(names==null) {
			return;
		}
		
		
		
		
		for(int i=0; i<names.length; i++) {
			System.out.println("names[i]의 값 : "+names[i]);
		}
		IMemberService service = MemberServiceImpl.getService();
		
		String list="";
		String no="";
		int count=0;
		int answer=0;
		for(int i=0; i<names.length; i++) {
			try {
				//상위로 넘어가서 스키마에서 테이블 명
				if(num==1) {
					list="리뷰게시판";
					answer=service.deleteReplyReview(Integer.parseInt(names[i]));
				}else if(num==2) {
					list="메인게시판";
					answer=service.deleteReplyMain(Integer.parseInt(names[i]));
				}else if(num==3) {
					list="자유게시판";
					answer=service.deleteReplyFree(Integer.parseInt(names[i]));
				}
				
				if(answer>0) {
					System.out.println(list+" 댓글 "+names[i]+"번 댓글 삭제!!");
					count+=answer;
				}
				System.out.println("count : "+count);
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/view/member/deleteReply.jsp");
	}
}
