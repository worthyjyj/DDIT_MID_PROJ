package member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.NoteVO;

@WebServlet("/detailNote.do")
public class DetailNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		
		String noo = request.getParameter("no");	//게시글 번호
		String numm = request.getParameter("num");	//1인지 2인지
		String id=(String)session.getAttribute("id");		//세션아이디
		
		
	
		System.out.println("detailNote no : "+noo);
		System.out.println("detailNote num : "+numm);
		
		int no = Integer.parseInt(noo);
		int num = Integer.parseInt(numm);
		
		
		
		
		Map<String,Object> map=new HashMap<>();
		
		map.put("no", no);
		map.put("id", id);
		
		NoteVO vo=null;
		IMemberService sevice=MemberServiceImpl.getService();
		if(num==1) {//받은편지함
			try {
				vo=sevice.receiveDetail(map);
				sevice.updateColor(no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(num==2) {//보낸편지함
			try {
				vo=sevice.sendDetail(map);
				sevice.updateColor(no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/*
		 * System.out.println("로그인 아이디 : "+vo.getMem_id());
		 * System.out.println("내용 : "+vo.getNote_content());
		 * System.out.println("읽은 시간 : "+vo.getNote_edate());
		 * System.out.println("게시물 번호  :"+vo.getNote_no());
		 * System.out.println("보낸 시간 : "+vo.getNote_sdate());
		 * System.out.println("보낸사람 : "+vo.getNote_send());
		 * System.out.println("제목 : "+vo.getNote_title());
		 */
		
		request.setAttribute("vo", vo);
		request.setAttribute("num", num);
		request.getRequestDispatcher("myPage/detailNote.jsp").forward(request, response);
	
//		response.sendRedirect("myPage/detailNote.jsp?num="+num+"&id="+URLEncoder.encode(vo.getMem_id(),"utf-8")+"&title="+URLEncoder.encode(vo.getNote_title(),"utf-8")
//							  +"&content="+URLEncoder.encode(vo.getNote_content(),"utf-8")+"&edate="+URLEncoder.encode(vo.getNote_edate(),"utf-8")+"&sender="+URLEncoder.encode(vo.getNote_send(),"utf-8"));
	}

}
