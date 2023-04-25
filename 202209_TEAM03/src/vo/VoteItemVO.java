package vo;

import java.util.List;

public class VoteItemVO {
	private int vi_no;
	private String vi_content;
	private int vote_no;
	private List<VoteUserVO> vuList;
	
	public List<VoteUserVO> getVuList() {
		return vuList;
	}
	public void setVuList(List<VoteUserVO> vuList) {
		this.vuList = vuList;
	}
	public int getVi_no() {
		return vi_no;
	}
	public void setVi_no(int vi_no) {
		this.vi_no = vi_no;
	}
	public String getVi_content() {
		return vi_content;
	}
	public void setVi_content(String vi_content) {
		this.vi_content = vi_content;
	}
	public int getVote_no() {
		return vote_no;
	}
	public void setVote_no(int vote_no) {
		this.vote_no = vote_no;
	}
}
