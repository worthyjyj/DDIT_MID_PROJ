package withme.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Profile;
import vo.WithMeVO;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/withMeMain.do")
public class WithMeMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 로그인 한 내 프로필 세션 받아오기
		HttpSession session = request.getSession();
		Profile pVo = (Profile) session.getAttribute("profile");
		
//		MemberDao dao = MemberDao.getInstance();
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		
		// 내가 참여중인 윗미방 코드들
		List<WithMeVO> wmList = service.getWmCode(pVo.getP_name());
		
		request.setAttribute("wmList", wmList);
		
		request.getRequestDispatcher("/myPage/myPage_WithMe.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String room = request.getParameter("room");
		String page = request.getParameter("page");
		request.setAttribute("room", room);
		
		// 접속한 유저의 방 등급 가져오기
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		HttpSession session = request.getSession();
		String pName = ((Profile) session.getAttribute("profile")).getP_name();
		
		Map<String, String> param = new HashMap<>();
		param.put("room", room);
		param.put("pName", pName);
		
		session.setAttribute("grade2", service.getWmGrade(param));
		
		
		if(page == null || "".equals(page)) 
			page = "main";
		
		switch(page) {
		case "withme friends":
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeFriedns.jsp").forward(request, response);
			break;
		case "스케줄러":
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeSche.jsp").forward(request, response);
			break;
		case "투표":
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeVote.jsp").forward(request, response);
			break;
		case "가계부":
			request.setAttribute("accList", service.getAccList(room));
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeAccount.jsp").forward(request, response);
			break;
		case "공지사항":
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeNotice.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("/WEB-INF/view/withme/withmeMain.jsp").forward(request, response);
		}
	}

}
