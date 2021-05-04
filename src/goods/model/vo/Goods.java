package goods.model.vo;

public class Goods {
	
	private int goods_no; // 상품번호
	private String goods_title; // 상품 제목
	private int goods_price; // 상품 가격
	private int goods_count; // 상품 갯수
	private String goods_contents; // 상풍 내용
	private String status;
	
	
	public Goods() {}


	public Goods(int goods_no, String goods_title, int goods_price, int goods_count, String goods_contents,
			String status) {
		super();
		this.goods_no = goods_no;
		this.goods_title = goods_title;
		this.goods_price = goods_price;
		this.goods_count = goods_count;
		this.goods_contents = goods_contents;
		this.status = status;
	}


	public int getGoods_no() {
		return goods_no;
	}


	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}


	public String getGoods_title() {
		return goods_title;
	}


	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}


	public int getGoods_price() {
		return goods_price;
	}


	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}


	public int getGoods_count() {
		return goods_count;
	}


	public void setGoods_count(int goods_count) {
		this.goods_count = goods_count;
	}


	public String getGoods_contents() {
		return goods_contents;
	}


	public void setGoods_contents(String goods_contents) {
		this.goods_contents = goods_contents;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Goods [goods_no=" + goods_no + ", goods_name=" + goods_title + ", goods_price=" + goods_price
				+ ", goods_count=" + goods_count + ", goods_contents=" + goods_contents + ", status=" + status + "]";
	}

}
