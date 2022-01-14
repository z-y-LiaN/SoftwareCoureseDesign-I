package entity;

public class Notice {
	private int noticeID;
	private String noticeTitle;
	private String noticeContent;
	private String outTime;
	
	public Notice() {
	}
	public Notice (int noticeID,String noticeTitle,String noticeContent,String outTime) {
		this.noticeID=noticeID;
		this.noticeTitle=noticeTitle;
		this.noticeContent=noticeContent;
		this.outTime=outTime;
	}
	public Notice(String noticeTitle,String noticeContent,String outTime){
		this.noticeTitle=noticeTitle;
		this.noticeContent=noticeContent;
		this.outTime=outTime;
	}
	public int getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		/*Date NowDate = new Date();
		SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		currentTime = formatter.format(NowDate);*/
		this.outTime=outTime;
	}
	@Override
	public String toString() {
		return "Notice [noticeID=" + noticeID + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", outTime=" + outTime + "]";
	}
}
