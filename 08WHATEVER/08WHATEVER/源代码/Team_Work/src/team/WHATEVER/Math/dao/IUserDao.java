package team.WHATEVER.Math.dao;

import java.util.List;

import team.WHATEVER.Math.model.ErrorQuestion;
import team.WHATEVER.Math.model.Homework;
import team.WHATEVER.Math.model.Operation;
import team.WHATEVER.Math.model.User;
import team.WHATEVER.Math.model.User_Group;

public interface IUserDao {
	
	
	
	//�û������
	public User login(String nickname,String password);//��¼ʱ�����ǳƺ�����
	public void add_user(String name,String password,String nickname,int Type,String group);//ע��ʱ��д��ʵ����ʱ����
	public void add_user(String password,String nickname,int Type);//ע��ʱû��д��ʵ����ʱ����
	public void delete_user(String nickname); //ɾ��
	public void delete_user(int id); //ɾ��
	public void update_user(User user);//�޸�
	public User find_user(String nickname);//�����ǳƲ���
	public User find_user(int id);//�����û�id����
	public List<User> find_users();//���ұ��е�ȫ����Ϣ
	public User find_user2(String name);//�����û�������
	public User find_user3(String name);//�����û��ǳƲ���
	
	/*public List<User> find_group(String group);//����һ��С���ڵ�ȫ���û�*/
	
	public List<User> load(String content);//���������û��ǳơ��û�������content���û���Ϣ
	
	
	
	//��Ŀ�����
	void add_operation(Operation operation);//����ʷ��¼���������Ŀ
	void delete_Operation(int id);//������ʷ��¼���id��ɾ����Ŀ
	public List<Operation> find_Operations(int U_id);//���ұ��е�U-id��ȫ����Ŀ
	public List<Operation> find_Operations2(int h_id,int u_id);//������ҵ��������ұ��з���Ҫ���ȫ����Ŀ
	
	
	//��ҵ�����
	List<Homework> find_homework(int h_Id);//������ҵ��Ų�ѯ��ҵ
	boolean add_homeWork(Homework Homework);//������ҵ
	public List<Integer> find_h_id(String group);//����С�������������е���ҵid���
	public List<Integer> find_h_id();
	
	//���������
	void delete_ErrorQuestion(int id);//���ݴ�����Ŀ��id��ɾ����Ŀ
	void add_ErrorQuestion(ErrorQuestion errorQuestion);//�����ݿ������Ӵ���
	List<ErrorQuestion> find_ErrorQuestions(int U_id);//���ұ��е�U-id��ȫ������
	
	//С�������
	List<Integer>  find_id(String group);//������������һ��С���ڵ�ȫ���û��ı��id	
	List<String> find_group(int user_id);//�����û�id�����û�������С��	
	boolean add_group(User_Group user_group);//����Ҫ���ӵ��û���С����
	void delete_group(String group, int user_id);//�����û���С������ɾ��
	void delete_user2(int user_id);//�����û�id��ɾ���û���Ϣ
	List<String>  find_group();//�������е�С����
		
}
