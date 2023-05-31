package bbs;

public class Complain {
	
	private int bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;
	private int count;
	private int like_count;
	private int category;
	
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public int getBbsCount() {
		return count;
	}
	public void setBbsCount(int count) {
		this.count = count;
	}
	public int getBbsLike_count() {
		return like_count;
	}
	public void setBbsLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getBbsCategory() {
		return category;
	}
	public void setBbsCategory(int category) {
		this.category = category;
	}
	
	

}