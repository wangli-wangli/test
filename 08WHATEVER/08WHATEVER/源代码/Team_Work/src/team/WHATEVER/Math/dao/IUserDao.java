package team.WHATEVER.Math.dao;

import java.util.List;

import team.WHATEVER.Math.model.ErrorQuestion;
import team.WHATEVER.Math.model.Homework;
import team.WHATEVER.Math.model.Operation;
import team.WHATEVER.Math.model.User;
import team.WHATEVER.Math.model.User_Group;

public interface IUserDao {
	
	
	
	//用户类操作
	public User login(String nickname,String password);//登录时填入昵称和密码
	public void add_user(String name,String password,String nickname,int Type,String group);//注册时填写真实姓名时调用
	public void add_user(String password,String nickname,int Type);//注册时没填写真实姓名时调用
	public void delete_user(String nickname); //删除
	public void delete_user(int id); //删除
	public void update_user(User user);//修改
	public User find_user(String nickname);//根据昵称查找
	public User find_user(int id);//根据用户id查找
	public List<User> find_users();//查找表中的全部信息
	public User find_user2(String name);//根据用户名查找
	public User find_user3(String name);//根据用户昵称查找
	
	/*public List<User> find_group(String group);//查找一个小组内的全部用户*/
	
	public List<User> load(String content);//搜索所有用户昵称、用户名满足content的用户信息
	
	
	
	//题目类操作
	void add_operation(Operation operation);//向历史记录表中添加题目
	void delete_Operation(int id);//根据历史记录题的id来删除题目
	public List<Operation> find_Operations(int U_id);//查找表中的U-id的全部题目
	public List<Operation> find_Operations2(int h_id,int u_id);//根据作业编号来查找表中符合要求的全部题目
	
	
	//作业类操作
	List<Homework> find_homework(int h_Id);//根据作业编号查询作业
	boolean add_homeWork(Homework Homework);//发布作业
	public List<Integer> find_h_id(String group);//根据小组名来查找所有的作业id编号
	public List<Integer> find_h_id();
	
	//错题类操作
	void delete_ErrorQuestion(int id);//根据错题题目的id来删除题目
	void add_ErrorQuestion(ErrorQuestion errorQuestion);//向数据库中增加错题
	List<ErrorQuestion> find_ErrorQuestions(int U_id);//查找表中的U-id的全部错题
	
	//小组类操作
	List<Integer>  find_id(String group);//根据组名查找一个小组内的全部用户的编号id	
	List<String> find_group(int user_id);//根据用户id查找用户的所有小组	
	boolean add_group(User_Group user_group);//传入要增加的用户和小组名
	void delete_group(String group, int user_id);//根据用户和小组名，删除
	void delete_user2(int user_id);//根据用户id来删除用户信息
	List<String>  find_group();//查找所有的小组名
		
}
