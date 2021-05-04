package mainpage.model.vo;

public class MainPage {
	//메인페이지에 들어갈 것들을 기술
	//FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, STATUS, MOVIE_SCORE, MOVIE_TITLE
	int fileNo;
	String originName;
	String changeName;
	String filePath;
	String movieScore;
	String movieTitle;
	
	public MainPage() {}

	public MainPage(int fileNo, String originName, String changeName, String filePath, String movieScore,
			String movieTitle) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.movieScore = movieScore;
		this.movieTitle = movieTitle;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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

	public String getMovieScore() {
		return movieScore;
	}

	public void setMovieScore(String movieScore) {
		this.movieScore = movieScore;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	@Override
	public String toString() {
		return "MainPage [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", movieScore=" + movieScore + ", movieTitle=" + movieTitle + "]";
	}
	
	
}
