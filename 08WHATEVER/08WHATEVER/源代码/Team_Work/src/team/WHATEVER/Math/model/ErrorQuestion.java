package team.WHATEVER.Math.model;

public class ErrorQuestion {
	
	//错题类的各个属性
	private int q_Id;                            //错题编号
	private int u_Id;                            //用户编号
	private String  q_Question;         //题目
	private String  q_CorrectResult;    //正确答案
	private String q_Date;              //错题日期
	private int q_Type;                   //题目类型 （练习--0和作业--1）
	
	
	//属性的Get、Set方法
	public int getQ_Id() {
		return q_Id;
	}
	public void setQ_Id(int q_Id) {
		this.q_Id = q_Id;
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
	public String getQ_CorrectResult() {
		return q_CorrectResult;
	}
	public void setQ_CorrectResult(String q_CorrectResult) {
		this.q_CorrectResult = q_CorrectResult;
	}
	public String getQ_Date() {
		return q_Date;
	}
	public void setQ_Date(String q_Date) {
		this.q_Date = q_Date;
	}
	public int getQ_Type() {
		return q_Type;
	}
	public void setQ_Type(int q_Type) {
		this.q_Type = q_Type;
	}
	
	
	
}
