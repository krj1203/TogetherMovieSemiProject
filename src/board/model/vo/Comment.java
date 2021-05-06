package board.model.vo;

import java.sql.Date;

public class Comment {
	private int commentNo;
	private int boardNo;
	private int userNo;
	private String nickName;
	private String commentContent;
	private Date commentDate;
	private String status;
	
	public Comment() {}

	public Comment(int commentNo, int boardNo, int userNo, String nickName, String commentContent, Date commentDate,
			String status) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.nickName = nickName;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.status = status;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", nickName="
				+ nickName + ", commentContent=" + commentContent + ", commentDate=" + commentDate + ", status="
				+ status + "]";
	}

	
	
}
