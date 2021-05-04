package movieInfo.model.vo;

public class MovieInfo {
	private int movieNo;
	private int movieCode;
	private String movieDate;
	private String movieTitle;
	private String director;
	private String actor; 
	private String genre;
	private String runningTime;
	private String age;
	private String content;
	
	public MovieInfo() {}
	
	public MovieInfo(int movieNo, int movieCode, String movieDate, String movieTitle, String director, String actor,
			String genre, String runningTime, String age, String content) {
		super();
		this.movieNo = movieNo;
		this.movieCode = movieCode;
		this.movieDate = movieDate;
		this.movieTitle = movieTitle;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.runningTime = runningTime;
		this.age = age;
		this.content = content;
	}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public int getMovieCode() {
		return movieCode;
	}


	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}


	public String getMovieDate() {
		return movieDate;
	}


	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}


	public String getMovieTitle() {
		return movieTitle;
	}


	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public String getActor() {
		return actor;
	}


	public void setActor(String actor) {
		this.actor = actor;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getRunningTime() {
		return runningTime;
	}


	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "MovieInfo [movieNo=" + movieNo + ", movieCode=" + movieCode + ", movieDate=" + movieDate
				+ ", movieTitle=" + movieTitle + ", director=" + director + ", actor=" + actor + ", genre=" + genre
				+ ", runningTime=" + runningTime + ", age=" + age + ", content=" + content + "]";
	}
	
	
	
}
