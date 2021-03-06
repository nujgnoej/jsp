package pds;

public class PdsVO {
	private int idx;
	private String mid;
	private int midIdx;
	private String nickName;
	private String fName;
	private String fSName;
	private int fSize;
	private String title;
	private String part;
	private String pwd;
	private String fDate;
	private int downNum;
	private String openSw;
	private String content;
	
	// 날짜형식필드를 '문자'와 '숫자'로 저장시켜주기 위한 변수를 선언
	private String wCdate;
	private int wNdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMidIdx() {
		return midIdx;
	}
	public void setMidIdx(int midIdx) {
		this.midIdx = midIdx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwCdate() {
		return wCdate;
	}
	public void setwCdate(String wCdate) {
		this.wCdate = wCdate;
	}
	public int getwNdate() {
		return wNdate;
	}
	public void setwNdate(int wNdate) {
		this.wNdate = wNdate;
	}
	
	@Override
	public String toString() {
		return "PdsVO [idx=" + idx + ", mid=" + mid + ", midIdx=" + midIdx + ", nickName=" + nickName + ", fName="
				+ fName + ", fSName=" + fSName + ", fSize=" + fSize + ", title=" + title + ", part=" + part + ", pwd="
				+ pwd + ", fDate=" + fDate + ", downNum=" + downNum + ", openSw=" + openSw + ", content=" + content
				+ ", wCdate=" + wCdate + ", wNdate=" + wNdate + "]";
	}
}
