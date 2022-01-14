package entity;

public class User {
	
	private String userName;
	
	private String userPwd;
	
	private String userID;
	
	private String classNum;
	
	private String userPhone;
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String userName,String userPwd,String userID,String classNum,String userPhone){
		this.userName=userName;
		this.userPwd=userPwd;
		this.userID=userID;
		this.classNum=classNum;
		this.userPhone=userPhone;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getClassNum() {
		return classNum;
	}
	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", userPwd=" + userPwd + ", userID=" + userID + ", classNum=" + classNum
				+ ", userPhone=" + userPhone + "]";
	}	

}
