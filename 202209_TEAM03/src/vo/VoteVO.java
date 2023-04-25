package vo;

import java.util.List;

public class VoteVO {
	private int vote_no;
	private String vote_title;
	private String vote_sdate;
	private String vote_edate;
	private int withme_code;
	private List<VoteItemVO> viList;
	
	public List<VoteItemVO> getViList() {
		return viList;
	}
	public void setViList(List<VoteItemVO> viList) {
		this.viList = viList;
	}
	public int getVote_no() {
		return vote_no;
	}
	public void setVote_no(int vote_no) {
		this.vote_no = vote_no;
	}
	public String getVote_title() {
		return vote_title;
	}
	public void setVote_title(String vote_title) {
		this.vote_title = vote_title;
	}
	public String getVote_sdate() {
		String date = vote_sdate;
		int index = vote_sdate.indexOf(" ");
		if(date != null && index != -1) date = date.substring(0, index);
		return date;
	}
	public void setVote_sdate(String vote_sdate) {
		this.vote_sdate = vote_sdate;
	}
	public String getVote_edate() {
		String date = vote_edate;
		int index = vote_edate.indexOf(" ");
		if(date != null && index != -1) date = date.substring(0, index);
		return date;
	}
	public void setVote_edate(String vote_edate) {
		this.vote_edate = vote_edate;
	}
	public int getWithme_code() {
		return withme_code;
	}
	public void setWithme_code(int withme_code) {
		this.withme_code = withme_code;
	}
	
	@Override
	public String toString() {
		return "VoteVO [vote_no=" + vote_no + ", vote_title=" + vote_title + ", vote_sdate=" + vote_sdate
				+ ", vote_edate=" + vote_edate + ", withme_code=" + withme_code + "]";
	}
	
}
