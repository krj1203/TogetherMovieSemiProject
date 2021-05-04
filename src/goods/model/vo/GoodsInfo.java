package goods.model.vo;

public class GoodsInfo {
	private int fileId;
	private int goodsNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private int downloadCount;
	private String status;
	
	public GoodsInfo() {}

	public GoodsInfo(int goodsNo, String changeName) {
		super();
		this.goodsNo = goodsNo;
		this.changeName = changeName;
	}

	public GoodsInfo(int fileId, int goodsNo, String originName, String changeName, String filePath, int fileLevel,
			int downloadCount, String status) {
		super();
		this.fileId = fileId;
		this.goodsNo = goodsNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
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
		return "GoodsInfo [fileId=" + fileId + ", goodsNo=" + goodsNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	
}
