package site.nebulas.beans;

public class Manager {
	private Integer mId;
	private Integer roleId;
	private String roleName;
	private String managerAccount;
	private String password;
	private String salt;
	private String realName;
	private String addTime;
	private Integer isLock;
	private String addMan;
	private Double balance;
	private Integer isDelete;
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getManagerAccount() {
		return managerAccount;
	}
	public void setManagerAccount(String managerAccount) {
		this.managerAccount = managerAccount;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public Integer getIsLock() {
		return isLock;
	}
	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}
	public String getAddMan() {
		return addMan;
	}
	public void setAddMan(String addMan) {
		this.addMan = addMan;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	public String getCredentialsSalt() {
        return managerAccount + salt;
    }
	
}
