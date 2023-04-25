package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import member.service.IMemberService;
import member.service.MemberServiceImpl;

/**
 * withmejoin 테이블에 insert하는 서블릿 _ 영진 ㅎㅎ
 */
@WebServlet("/member/withmeinsert.do")
public class Withmeinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonData = null;

		String p_name = request.getParameter("p_name"); // 동행 신청자 프로필이름
		String withme=request.getParameter("withme_code");
		System.out.println(withme);
		int a=withme.indexOf("번");
		
		int answer=withme.indexOf(0,a);
		String answer2=withme.substring(0, a);
		int answer3=Integer.parseInt(answer2);
		
		int withme_code = answer3; // 게시물 번호

		System.out.println("withmeinsert에서 pname : "+p_name);
		int b=p_name.indexOf("님");
		
		String answer5=p_name.substring(0, b);
		System.out.println("answer5 : "+answer5);
		
		p_name=answer5;
		// map으로 설정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_name", p_name);
		System.out.println("p_name" + p_name);
		map.put("withme_code", withme_code);
		System.out.println("withme_code" + withme_code);

		// service객체 얻기
		IMemberService service = MemberServiceImpl.getService();

		// service메소드 호출 - 결과값 저장

		/* int res = 1; */
		Object ress =null;
		int res = 0;
		try {
			ress=service.withmejoininsert(map);
			if (ress == null) {
				res = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("1이면인서트성공" + res);
		String result = "";

		// 결과값 저장
		if (res > 0) {
			result = "성공";
		} else {
			result = "실패";

		}

		System.out.println("result ==> " + result);

		PrintWriter out = response.getWriter();
		out.write(result); // text데이터를 응답으로 보내준다.
		response.flushBuffer();
	}

}
