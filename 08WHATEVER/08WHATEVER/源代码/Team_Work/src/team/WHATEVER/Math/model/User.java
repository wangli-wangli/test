package team.WHATEVER.Math.model;

public class User {
	
	//用户的各个属性
	private int u_Id;//编号（数据库自增自减）
	private String u_Nickname;//昵称（注册时填写）
	private String u_Name;//姓名（注册可填可不填，但加入小组时一定要填）
	private String u_Password;//密码
	private int u_Type;//类型（0--老师 1--学生 -1--管理员）
	private String u_Group;//小组
	
	
	////各属性的Get Set函数
	public int getU_Id() {
		return u_Id;
	}
	public void setU_Id(int u_Id) {
		this.u_Id = u_Id;
	}
	public String getU_Nickname() {
		return u_Nickname;
	}
	public void setU_Nickname(String u_Nickname) {
		this.u_Nickname = u_Nickname;
	}
	public String getU_Name() {
		return u_Name;
	}
	public void setU_Name(String u_Name) {
		this.u_Name = u_Name;
	}
	public String getU_Password() {
		return u_Password;
	}
	public void setU_Password(String u_Password) {
		this.u_Password = u_Password;
	}
	public int getU_Type() {
		return u_Type;
	}
	public void setU_Type(int u_Type) {
		this.u_Type = u_Type;
	}
	public String getU_Group() {
		return u_Group;
	}
	public void setU_Group(String u_Group) {
		this.u_Group = u_Group;
	}
	
	
	

}
