package entity;

public class ReportOut{
	private String userID;
	private String temperature;
	private int isSick;
	private String reportTime;
	private String codeState;
	private int dosage;
	private int isIsolated;
	private int isDangerous;
	private String address;
	private String extraInfo;
	
	public ReportOut() {
		
	}
	public ReportOut(String userID,String temperature,int isSick,String reportTime,String codeState,int dosage,
			int isIsolated,int isDangerous,String address,String extraInfo){
		this.userID=userID;
		this.temperature=temperature;
		this.isSick=isSick;
		this.reportTime=reportTime;
		this.codeState=codeState;
		this.dosage=dosage;
		this.isIsolated=isIsolated;
		this.isDangerous=isDangerous;
		this.address=address;
		this.extraInfo=extraInfo;
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
	public String getCodeState() {
		return codeState;
	}
	public void setCodeState(String codeState) {
		this.codeState = codeState;
	}
	public int getDosage() {
		return dosage;
	}
	public void setDosage(int dosage) {
		this.dosage = dosage;
	}
	public int getIsIsolated() {
		return isIsolated;
	}
	public void setIsIsolated(int isIsolated) {
		this.isIsolated = isIsolated;
	}
	public int getIsDangerous() {
		return isDangerous;
	}
	public void setIsDangerous(int isDangerous) {
		this.isDangerous = isDangerous;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getExtraInfo() {
		return extraInfo;
	}
	public void setExtraInfo(String extraInfo) {
		this.extraInfo = extraInfo;
	}
	@Override
	public String toString() {
		return "ReportOut [userID=" + userID + ", temperature=" + temperature + ", isSick=" + isSick + ", reportTime="
				+ reportTime + ", codeState=" + codeState + ", dosage=" + dosage + ", isIsolated=" + isIsolated
				+ ", isDangerous=" + isDangerous + ", address=" + address + ", extraInfo=" + extraInfo + "]";
	}
	
}
