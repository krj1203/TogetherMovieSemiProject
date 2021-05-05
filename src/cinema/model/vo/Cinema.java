package cinema.model.vo;

public class Cinema {
	private int cn_no;
	private String cn_name;
	private String cn_topic;
	private String cn_available;
	private String cn_adress;
	private String cn_sitelink;
	private String cn_maplink;
	private String cn_status;
	private String area;			
	private String cn_pConfirm;
	private String cn_pGuide;
	private String cn_pPay;
	private String cn_file_path;	//servlet생성자에 불필요
	private String cn_file_name;	//servlet생성자에 불필요
	private String cn_floor;
	private String cn_bus;
	private String cn_metro;
	private int code;
	
	public Cinema() {}

	public Cinema(int cn_no, String cn_name, String cn_topic, String cn_available, String cn_adress, String cn_sitelink,
			String cn_maplink, String cn_status, String area, String cn_file_path, String cn_file_name) {
		super();
		this.cn_no = cn_no;
		this.cn_name = cn_name;
		this.cn_topic = cn_topic;
		this.cn_available = cn_available;
		this.cn_adress = cn_adress;
		this.cn_sitelink = cn_sitelink;
		this.cn_maplink = cn_maplink;
		this.cn_status = cn_status;
		this.area = area;
		this.cn_file_path = cn_file_path;
		this.cn_file_name = cn_file_name;
	}

	public Cinema(int cn_no, String cn_name, String cn_topic, String cn_available, String cn_adress, String cn_sitelink,
			String cn_maplink, String cn_status, String area, String cn_pConfirm, String cn_pGuide, String cn_pPay,
			String cn_file_path, String cn_file_name, String cn_floor, String cn_bus, String cn_metro, int code) {
		super();
		this.cn_no = cn_no;
		this.cn_name = cn_name;
		this.cn_topic = cn_topic;
		this.cn_available = cn_available;
		this.cn_adress = cn_adress;
		this.cn_sitelink = cn_sitelink;
		this.cn_maplink = cn_maplink;
		this.cn_status = cn_status;
		this.area = area;
		this.cn_pConfirm = cn_pConfirm;
		this.cn_pGuide = cn_pGuide;
		this.cn_pPay = cn_pPay;
		this.cn_file_path = cn_file_path;
		this.cn_file_name = cn_file_name;
		this.cn_floor = cn_floor;
		this.cn_bus = cn_bus;
		this.cn_metro = cn_metro;
		this.code = code;
	}

	public Cinema(String name, String topic, String avail, String adress, String site, Object object, String string,
			String area2, String pConfirm, String pGuide, String pPay, String company, String floor, String bus,
			String metro, int i) {
		super();
		
		this.cn_name = name;
		this.cn_topic = topic;
		this.cn_available = avail;
		this.cn_adress = adress;
		this.cn_sitelink = site;
		this.cn_maplink = null;
		this.cn_status = string;
		this.area = area2;
		this.cn_pConfirm = pConfirm;
		this.cn_pGuide = pGuide;
		this.cn_pPay = pPay;
		this.cn_file_name = company;
		this.cn_floor = floor;
		this.cn_bus = bus;
		this.cn_metro = metro;
		this.code = i;
	}

	public int getCn_no() {
		return cn_no;
	}

	public void setCn_no(int cn_no) {
		this.cn_no = cn_no;
	}

	public String getCn_name() {
		return cn_name;
	}

	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}

	public String getCn_topic() {
		return cn_topic;
	}

	public void setCn_topic(String cn_topic) {
		this.cn_topic = cn_topic;
	}

	public String getCn_available() {
		return cn_available;
	}

	public void setCn_available(String cn_available) {
		this.cn_available = cn_available;
	}

	public String getCn_adress() {
		return cn_adress;
	}

	public void setCn_adress(String cn_adress) {
		this.cn_adress = cn_adress;
	}

	public String getCn_sitelink() {
		return cn_sitelink;
	}

	public void setCn_sitelink(String cn_sitelink) {
		this.cn_sitelink = cn_sitelink;
	}

	public String getCn_maplink() {
		return cn_maplink;
	}

	public void setCn_maplink(String cn_maplink) {
		this.cn_maplink = cn_maplink;
	}

	public String getCn_status() {
		return cn_status;
	}

	public void setCn_status(String cn_status) {
		this.cn_status = cn_status;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCn_pConfirm() {
		return cn_pConfirm;
	}

	public void setCn_pConfirm(String cn_pConfirm) {
		this.cn_pConfirm = cn_pConfirm;
	}

	public String getCn_pGuide() {
		return cn_pGuide;
	}

	public void setCn_pGuide(String cn_pGuide) {
		this.cn_pGuide = cn_pGuide;
	}

	public String getCn_pPay() {
		return cn_pPay;
	}

	public void setCn_pPay(String cn_pPay) {
		this.cn_pPay = cn_pPay;
	}

	public String getCn_file_path() {
		return cn_file_path;
	}

	public void setCn_file_path(String cn_file_path) {
		this.cn_file_path = cn_file_path;
	}

	public String getCn_file_name() {
		return cn_file_name;
	}

	public void setCn_file_name(String cn_file_name) {
		this.cn_file_name = cn_file_name;
	}

	public String getCn_floor() {
		return cn_floor;
	}

	public void setCn_floor(String cn_floor) {
		this.cn_floor = cn_floor;
	}

	public String getCn_bus() {
		return cn_bus;
	}

	public void setCn_bus(String cn_bus) {
		this.cn_bus = cn_bus;
	}

	public String getCn_metro() {
		return cn_metro;
	}

	public void setCn_metro(String cn_metro) {
		this.cn_metro = cn_metro;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Cinema [cn_no=" + cn_no + ", cn_name=" + cn_name + ", cn_topic=" + cn_topic + ", cn_available="
				+ cn_available + ", cn_adress=" + cn_adress + ", cn_sitelink=" + cn_sitelink + ", cn_maplink="
				+ cn_maplink + ", cn_status=" + cn_status + ", area=" + area + ", cn_pConfirm=" + cn_pConfirm
				+ ", cn_pGuide=" + cn_pGuide + ", cn_pPay=" + cn_pPay + ", cn_file_path=" + cn_file_path
				+ ", cn_file_name=" + cn_file_name + ", cn_floor=" + cn_floor + ", cn_bus=" + cn_bus + ", cn_metro="
				+ cn_metro + ", code=" + code + "]";
	}

	
	
}
