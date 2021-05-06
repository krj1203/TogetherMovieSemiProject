package board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; // 게시글 번호
	private int boardType; // 게시글 타입
	private String boardTitle; // 게시글 제목
	private String boardContent; // 게시글 내용
	private Date boardDate; // 게시글 작성 날짜
	private int boardView; // 조회수 
	private String boardCategory; // 카테고리
	private int boardCode; // 게시판 분류코드
	private String status;
	private int usersNo;	// 유저번호
	private String nickName; // 닉네임
	
	public Board() {}

	public Board(int boardNo, int boardType, String boardTitle, String boardContent, Date boardDate, int boardView,
			String boardCategory, int boardCode, String status, int usersNo, String nickName) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardView = boardView;
		this.boardCategory = boardCategory;
		this.boardCode = boardCode;
		this.status = status;
		this.usersNo = usersNo;
		this.nickName = nickName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardView=" + boardView
				+ ", boardCategory=" + boardCategory + ", boardCode=" + boardCode + ", status=" + status + ", usersNo="
				+ usersNo + ", nickName=" + nickName + "]";
	}

	
	
}
