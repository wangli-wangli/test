package team.WHATEVER.Math.model;

public class Operation {
	
	//题目类的各个属性
	int q_id;                            //题目编号
	int u_Id;                            //用户编号
	private String  q_Question;         //题目
	private String  q_CorrectResult;    //正确答案
	private String  q_InputResult;      //输入答案
	private int q_QuestionNumber;         //题目总个数
	private String q_Date;               //题目时间
	private int q_Type;                   //题目类型 （练习---0和作业--1）
	private int q_Status;               //题目状态  -1：答错的题  0：答对的题
	
    private  int h_id;//作业次数编号
	
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	
	//各属性的Get Set函数
	
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getQ_Date() {
		return q_Date;
	}
	public void setQ_Date(String q_Date) {
		this.q_Date = q_Date;
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
	public String getQ_InputResult() {
		return q_InputResult;
	}
	public void setQ_InputResult(String q_InputResult) {
		this.q_InputResult = q_InputResult;
	}
	public int getQ_QuestionNumber() {
		return q_QuestionNumber;
	}
	public void setQ_QuestionNumber(int q_QuestionNumber) {
		this.q_QuestionNumber = q_QuestionNumber;
	}
	public int getQ_Type() {
		return q_Type;
	}
	public void setQ_Type(int q_Type) {
		this.q_Type = q_Type;
	}
	public int getQ_Status() {
		return q_Status;
	}
	public void setQ_Status(int q_Status) {
		this.q_Status = q_Status;
	}
	

}
