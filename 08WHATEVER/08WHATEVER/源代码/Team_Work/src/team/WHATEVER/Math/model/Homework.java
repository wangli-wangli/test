package team.WHATEVER.Math.model;

public class Homework {
	private int h_Id;//作业编号
	private int u_Id;//发布作业者编号
	private String q_Question;//题目
	private String q_RorrectResult;//正确答案
	private String h_gruop;//老师的小组名
	private String q_Date;//布置作业的时间
	
	public String getQ_Date() {
		return q_Date;
	}
	public void setQ_Date(String q_Date) {
		this.q_Date = q_Date;
	}
	public String getH_gruop() {
		return h_gruop;
	}
	public void setH_gruop(String h_gruop) {
		this.h_gruop = h_gruop;
	}
	public int getH_Id() {
		return h_Id;
	}
	public void setH_Id(int h_Id) {
		this.h_Id = h_Id;
	}
	public int getU_Id() {
		return u_Id;
	}
	public void setU_Id(int u_Id) {
		this.u_Id = u_Id;
	}
	public String getQ_Question() {
		return q_Question;
	}
	public void setQ_Question(String q_Question) {
		this.q_Question = q_Question;
	}
	public String getQ_RorrectResult() {
		return q_RorrectResult;
	}
	public void setQ_RorrectResult(String q_RorrectResult) {
		this.q_RorrectResult = q_RorrectResult;
	}
	
	
	
	

}
