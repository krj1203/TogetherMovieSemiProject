package Attachment.model.vo;

import java.sql.Date;

public class Attachment {
	private int file_no;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date upload_date;
	private int file_level;
	private int dounload_count;
	private String status;
	private String goods_no;
	private int recom_no;
	
	public Attachment() {}
	
	

	public Attachment(int goods_noString, String change_name) {
		super();
		this.goods_no = goods_no;
		this.change_name = change_name;
	}



	public Attachment(int file_no, String origin_name, String change_name, String file_path, Date upload_date,
			int file_level, int dounload_count, String status, String goods_no, int recom_no) {
		super();
		this.file_no = file_no;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.file_level = file_level;
		this.dounload_count = dounload_count;
		this.status = status;
		this.goods_no = goods_no;
		this.recom_no = recom_no;
	}



	public int getFile_no() {
		return file_no;
	}



	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}



	public String getOrigin_name() {
		return origin_name;
	}



	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}



	public String getChange_name() {
		return change_name;
	}



	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}



	public String getFile_path() {
		return file_path;
	}



	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}



	public Date getUpload_date() {
		return upload_date;
	}



	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}



	public int getFile_level() {
		return file_level;
	}



	public void setFile_level(int file_level) {
		this.file_level = file_level;
	}



	public int getDounload_count() {
		return dounload_count;
	}



	public void setDounload_count(int dounload_count) {
		this.dounload_count = dounload_count;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getGoods_no() {
		return goods_no;
	}



	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}



	public int getRecom_no() {
		return recom_no;
	}



	public void setRecom_no(int recom_no) {
		this.recom_no = recom_no;
	}



	@Override
	public String toString() {
		return "Attachment [file_no=" + file_no + ", origin_name=" + origin_name + ", change_name=" + change_name
				+ ", file_path=" + file_path + ", upload_date=" + upload_date + ", file_level=" + file_level
				+ ", dounload_count=" + dounload_count + ", status=" + status + ", goods_no=" + goods_no + ", recom_no="
				+ recom_no + "]";
	}

	
}
