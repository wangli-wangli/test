package team.WHATEVER.Math.model;

public class User {
	
	//�û��ĸ�������
	private int u_Id;//��ţ����ݿ������Լ���
	private String u_Nickname;//�ǳƣ�ע��ʱ��д��
	private String u_Name;//������ע�����ɲ��������С��ʱһ��Ҫ�
	private String u_Password;//����
	private int u_Type;//���ͣ�0--��ʦ 1--ѧ�� -1--����Ա��
	private String u_Group;//С��
	
	
	////�����Ե�Get Set����
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
