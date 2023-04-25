package vo;

public class PageVO {
	//이거는 typeAlias가 없음
	private int start;
	private int end;
	
	private int startPage;	//페이지 내에서 첫번째 페이지
	private int endPage;	//페이지 내에서 마지막 페이지
	
	private int totalPage;	//전체 몇패이지?
	private int count;		//전체 글 갯수
	
	//토탈 페이지 개수=count/perList (※실수로 계산을 해야 소숫점이 나머지 페이지임)
	
	private static int perList = 3;	//한 페이지당 몇개씩 나오게 하는지 나오는거
	
	private static int perPage=2;	//페이지 몇개 뜨나 보이게 하는거
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	
	
}

