package board.model.vo;

public class BoardInfo {
	private int fileNo;
	private int boardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private int downloadCount;
	private String status;
	
	public BoardInfo() {}
	
	public BoardInfo(int boardNo, String changeName) {
		this.boardNo = boardNo;
		this.changeName = changeName;
	}
	public BoardInfo(int fileNo, int boardNo, String originName, String changeName, String filePath, int fileLevel,
			int downloadCount, String status) {
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getfileNo() {
		return fileNo;
	}

	public void setfileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getboardNo() {
		return boardNo;
	}

	public void setboardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardInfo [fileNo=" + fileNo + ", boardNo=" + boardNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	
}
