package goods.model.vo;

public class Pay {
	private int payNo;
	private int goodsNo;
	private String title;
	private String userId;
	private int amount;
	private int count;
	private String email;
	private String status;
	
	public Pay() {};
	
	
	public Pay(int payNo, int goodsNo, String title, String userId, int amount, int count, String email,
			String status) {
		super();
		this.payNo = payNo;
		this.goodsNo = goodsNo;
		this.title = title;
		this.userId = userId;
		this.amount = amount;
		this.count = count;
		this.email = email;
		this.status = status;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", goodsNo=" + goodsNo + ", title=" + title + ", userId=" + userId + ", amount="
				+ amount + ", count=" + count + ", email=" + email + ", status=" + status + "]";
	}
	
	

}
