package vo;

public class FreePageVO {

	private int start;
	private int end;
	
	private int startPage; // 페이지번호 12345  => 1
	private int endPage;   // 페이지번호 12345  => 5
	private int totalPage; // (double)totalPage = (double)count / perList; 
	private int count;     // 전체 글 갯수
	
	private static int perList = 3;  // 페이지당 글 갯수(글이 많아지면 늘릴수있다.)
	private static int perPage = 2;  // 페이지 갯수 
	
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
		FreePageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		FreePageVO.perPage = perPage;
	}
	
	
}
