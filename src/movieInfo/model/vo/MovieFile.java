package movieInfo.model.vo;

import java.sql.Date;

public class MovieFile {
	private int filedId;
	private int movieNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private int downloadCount;
	private String status;
	
	public MovieFile() {}
	
	
	public MovieFile(int movieNo, String changeName) {
		super();
		this.movieNo = movieNo;
		this.changeName = changeName;
	}


	public MovieFile(int filedId, int movieNo, String originName, String changeName, String filePath, int fileLevel,
			int downloadCount, String status) {
		super();
		this.filedId = filedId;
		this.movieNo = movieNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
	}


	public int getFiledId() {
		return filedId;
	}


	public void setFiledId(int filedId) {
		this.filedId = filedId;
	}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
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
		return "MovieFile [filedId=" + filedId + ", movieNo=" + movieNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	
	
	
}
