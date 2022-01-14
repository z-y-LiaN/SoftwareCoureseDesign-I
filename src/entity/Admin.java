package entity;

public class Admin {
	private String adminName;
	private String adminPwd;
	private String adminID;
	public Admin() {
		
	}
	public Admin(String adminName,String adminPwd,String adminID) {
		this.adminName=adminName;
		this.adminPwd=adminPwd;
		this.adminID=adminID;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	@Override
	public String toString() {
		return "Admin [adminName=" + adminName + ", adminPwd=" + adminPwd + ", adminID=" + adminID + "]";
	}
}
