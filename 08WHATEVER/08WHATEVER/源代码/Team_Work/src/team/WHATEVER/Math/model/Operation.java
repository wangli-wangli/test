package team.WHATEVER.Math.model;

public class Operation {
	
	//��Ŀ��ĸ�������
	int q_id;                            //��Ŀ���
	int u_Id;                            //�û����
	private String  q_Question;         //��Ŀ
	private String  q_CorrectResult;    //��ȷ��
	private String  q_InputResult;      //�����
	private int q_QuestionNumber;         //��Ŀ�ܸ���
	private String q_Date;               //��Ŀʱ��
	private int q_Type;                   //��Ŀ���� ����ϰ---0����ҵ--1��
	private int q_Status;               //��Ŀ״̬  -1��������  0����Ե���
	
    private  int h_id;//��ҵ�������
	
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	
	//�����Ե�Get Set����
	
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
