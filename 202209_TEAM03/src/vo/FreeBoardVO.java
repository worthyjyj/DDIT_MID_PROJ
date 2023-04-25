package vo;

public class FreeBoardVO {
	
	private int fb_no          ;       // 자유게시글 번호
	private String fb_title    ;       // 자유게시글 제목
	private String fb_content  ;       // 자유게시글 내용
	private String fb_date     ;       // 자유게시글 작성일자
	private String fb_pic      ;       // 자유게시글 업로드 사진
	private int fb_hit         ;       // 자유게시글 조회수
	private String p_name      ;       // 자유게시글 작성자
	private String fb_reg      ;       // 자유게시글 자유지역
	private String p_pic	   ;       // 자유게시글 작성자 프로필 사진
	
	public int getFb_no() {
		return fb_no;
	}
	
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getFb_date() {
		return fb_date;
	}
	public void setFb_date(String fb_date) {
		this.fb_date = fb_date;
	}

	public String getFb_pic() {
		return fb_pic;
	}

	public void setFb_pic(String fb_pic) {
		this.fb_pic = fb_pic;
	}

	public int getFb_hit() {
		return fb_hit;
	}
	public void setFb_hit(int fb_hit) {
		this.fb_hit = fb_hit;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getFb_reg() {
		return fb_reg;
	}

	public void setFb_reg(String fb_reg) {
		this.fb_reg = fb_reg;
	}

	public String getP_pic() {
		return p_pic;
	}

	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}

	
	
	
	
}
