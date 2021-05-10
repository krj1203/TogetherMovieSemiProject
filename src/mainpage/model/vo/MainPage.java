package mainpage.model.vo;

public class MainPage {
	//메인페이지에 들어갈 것들을 기술
	//FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, STATUS, MOVIE_SCORE, MOVIE_TITLE
	private int movieNo;
	private String movieTitle;
	private String changeName;
	
	public MainPage() {}

	public MainPage(int movieNo, String movieTitle, String changeName) {
		super();
		this.movieNo = movieNo;
		this.movieTitle = movieTitle;
		this.changeName = changeName;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "MainPage [movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", changeName=" + changeName + "]";
	}

	
	
	
}
