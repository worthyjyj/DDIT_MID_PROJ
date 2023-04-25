package freeBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;

/**
 * 통합검색(제목, 내용)해서 리스트 불러오기
 */
@WebServlet("/freeboard/selectBoardList.do")
public class SelectBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see 검색키워드로 불러온 리스트 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sword = request.getParameter("sword"); 
		String sort = request.getParameter("sort");

		System.out.println("sjf:"+sword);
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("sword", sword); // 컬럼값
		
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		List<FreeBoardVO> selectList = service.selectByTotal(map);
		System.out.println(selectList);
		request.setAttribute("boardList", selectList);
		request.setAttribute("sort", sort);
		
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
