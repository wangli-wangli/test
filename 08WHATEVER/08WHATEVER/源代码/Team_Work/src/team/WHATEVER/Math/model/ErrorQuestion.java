package team.WHATEVER.Math.model;

public class ErrorQuestion {
	
	//������ĸ�������
	private int q_Id;                            //������
	private int u_Id;                            //�û����
	private String  q_Question;         //��Ŀ
	private String  q_CorrectResult;    //��ȷ��
	private String q_Date;              //��������
	private int q_Type;                   //��Ŀ���� ����ϰ--0����ҵ--1��
	
	
	//���Ե�Get��Set����
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
