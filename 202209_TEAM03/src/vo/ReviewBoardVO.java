package vo;

public class ReviewBoardVO {
	
	private int rev_no;					//후기게시글 번호
	private String rev_title;				//후기게시글 제목
	private String rev_content;		//후기게시글 내용
	private String rev_date;				//후기게시글 작성일자
	private String rev_pic;				//후기 사진
	private int rev_hit;					//후기게시글 조회수
	private String p_name;				//프로필이름
	private int reg_no;					//지역번호 하 이게 인트네;
	
	
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_pic() {
		return rev_pic;
	}
	public void setRev_pic(String rev_pic) {
		this.rev_pic = rev_pic;
	}
	public int getRev_hit() {
		return rev_hit;
	}
	public void setRev_hit(int rev_hit) {
		this.rev_hit = rev_hit;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getReg_no() {
		return reg_no;
	}
	public void setReg_no(int reg_no) {
		this.reg_no = reg_no;
	}
	
	
	
}
