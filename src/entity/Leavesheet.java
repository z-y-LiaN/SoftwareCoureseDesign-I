package entity;

public class Leavesheet {
	private String userID;
	private String outDate;
	private String returnDate;
	private String state; // 0待审核，1审核通过，2审核拒绝，3待销假 ，4已销假
	private String outThing;
	private String situation;
	private String note;
	private String userName;
	
	public Leavesheet() {
		
	}
	public Leavesheet( String userID,String outDate,String returnDate,String state,String outThing,String situation,String note,String userName) {
		this.userID=userID;
		this.outDate=outDate;
		this.returnDate=returnDate;
		this.state=state;
		this.outThing=outThing;
		this.situation=situation;
		this.note=note;
		this.userName=userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getOutThing() {
		return outThing;
	}
	public void setOutThing(String outThing) {
		this.outThing = outThing;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Leavesheet [userID=" + userID + ", outDate=" + outDate + ", returnDate=" + returnDate + ", state="
				+ state + ", outThing=" + outThing + ", situation=" + situation + ", note=" + note + ", userName="
				+ userName + "]";
	}
}
