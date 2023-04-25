package vo;

public class ReviewReplyVO {
	
	private int rcom_no;					//후기댓글 번호
	private String rcom_content;		//후기댓글 내용
	private String rcom_date;			//후기댓글 작성일자
	private int rev_no;					//후기게시글 번호
	private String p_name;				//프로필 이름
	
	public int getRcom_no() {
		return rcom_no;
	}
	public void setRcom_no(int rcom_no) {
		this.rcom_no = rcom_no;
	}
	public String getRcom_content() {
		return rcom_content;
	}
	public void setRcom_content(String rcom_content) {
		this.rcom_content = rcom_content;
	}
	public String getRcom_date() {
		return rcom_date;
	}
	public void setRcom_date(String rcom_date) {
		this.rcom_date = rcom_date;
	}
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


}
