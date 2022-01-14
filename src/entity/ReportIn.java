package entity;

//在学校的同学的打卡单
public class ReportIn {
	private String userID;
	private String temperature;
	private int isSick;
	private String reportTime;

	public ReportIn(String userID,String temperatue,int isSick,String reportTime) {
		this.userID=userID;
		this.temperature=temperatue;
		this.isSick=isSick;
		this.reportTime=reportTime;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public int getIsSick() {
		return isSick;
	}
	public void setIsSick(int isSick) {
		this.isSick = isSick;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	@Override
	public String toString() {
		return "ReportIn [userID=" + userID + ", temperature=" + temperature + ", isSick=" + isSick + ", reportTime="
				+ reportTime + "]";
	}
	
}
