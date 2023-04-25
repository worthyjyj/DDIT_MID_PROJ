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

import member.service.IMemberService;
import member.service.MemberServiceImpl;

/***
 * 아이디 찾기를 위한 페이지
 * 
 * @author PC-21
 *
 */
@WebServlet("/SearchId.do")
public class SearchId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_name = request.getParameter("name");
		String mem_tel = request.getParameter("phone");
		
		System.out.println("memname(searchId) : "+mem_name);
		System.out.println("memname(searchTel) : "+mem_tel);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_name", mem_name);
		map.put("mem_tel", mem_tel);

		IMemberService service = MemberServiceImpl.getService();
		
		int answer=0;
		try {
			String mem_id = service.searchId(map);
			
			if (mem_id != null) {
				answer=1;
			} else if (mem_id == null) {
				answer=0;
			}
			   
			request.setAttribute("mem_id", mem_id);
			request.getRequestDispatcher("/WEB-INF/view/member/searchIdConfirm.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
