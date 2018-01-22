package team.WHATEVER.Math.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import team.WHATEVER.Math.Util.DBUtil;
import team.WHATEVER.Math.model.ErrorQuestion;
import team.WHATEVER.Math.model.Homework;
import team.WHATEVER.Math.model.Operation;
import team.WHATEVER.Math.model.User;
import team.WHATEVER.Math.model.User_Group;
import team.WHATEVER.Math.Util.UserException;

public class UserDaoImpl implements IUserDao{

	//��¼ʱ�����ǳƺ�����
	public User login(String nickname, String password) {//�û����벻��ȷʱ�������û����벻��ȷ���û������ڷ��ء��û������ڡ����û��ǳƼ�������ȷ�����ء� ��
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_user where u_nickname = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, nickname);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				
				user.setU_Nickname(resultSet.getString("u_nickname"));
				user.setU_Password(resultSet.getString("u_password"));
				user.setU_Id(resultSet.getInt("u_Id"));
				user.setU_Name(resultSet.getString("u_Name"));
				/*user.setU_Group(resultSet.getString("u_group"));*/
				user.setU_Type(resultSet.getInt("u_Type"));
			}
			if (user == null) {
				throw new UserException("���û�������");
			}
			if (!user.getU_Password().equals(password)) {
				throw new UserException("���벻��ȷ");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
		return user;
	}


	
	//ע��ʱ��д��ʵ����ʱ����
	public void add_user(String name, String password, String nickname, int Type,String group) {//ע��ʱ��д��ʵ����ʱ����
		//������Ӷ���
				Connection connection = DBUtil.getConnection();
				//׼��sql���
				String sql = "select count(*) from p_user where u_nickname = ?";
				//������䴫�����
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,nickname);
					//���ս����
					resultSet = preparedStatement.executeQuery();
					//���������
					while(resultSet.next()) {
						if (resultSet.getInt(1) > 0) {
							throw new UserException("�û��Ѵ���") ;
						}
					}
					
					sql = "insert into p_user(u_nickname,u_Name,u_password,u_Type) value (?,?,?,?)";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,nickname );
					preparedStatement.setString(2, name);
					preparedStatement.setString(3, password);
					preparedStatement.setInt(4, Type);
					/*preparedStatement.setString(5, group);*/
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//�ر���Դ
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
	}
	
	//
	public void add_user(String password, String nickname, int Type) {//ע��ʱû��д��ʵ����ʱ����
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select count(*) from p_user where u_nickname = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,nickname);
			//���ս����
			resultSet = preparedStatement.executeQuery();
			//���������
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("�û��Ѵ���") ;
				}
			}
			
			sql = "insert into p_user(u_nickname,u_password,u_Type) value (?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,nickname );
			preparedStatement.setString(2, password);
			preparedStatement.setInt(3, Type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//�ر���Դ
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
   }


	public void delete_user(String nickname) {//ɾ��
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_user where u_nickname = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, nickname);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
}
	
	public void delete_user(int id) {//ɾ��
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_user where u_Id = ?";
		PreparedStatement preparedStatement = null;
		String Sql;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			Sql="delete from p_group where user_id = ?";
			preparedStatement = connection.prepareStatement(Sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
}



	public void update_user(User user) {//����
		//������Ӷ���
				Connection connection=DBUtil.getConnection();
			    //׼��sql���
				/*String sql="update p_user set u_password=?,u_nickname=?,u_Name=?,u_Type=?,u_group=? where u_Id= ?";*/
				String sql="update p_user set u_password=?,u_nickname=?,u_Name=?,u_Type=? where u_Id= ?";
				//������䴫�����
				PreparedStatement preparedStatement=null;
				try {
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1, user.getU_Password());
					preparedStatement.setString(2, user.getU_Nickname());
					preparedStatement.setString(3, user.getU_Name());
					preparedStatement.setInt(4, user.getU_Type());
					/*preparedStatement.setString(5, user.getU_Group());*/
					preparedStatement.setInt(5, user.getU_Id());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					//�ر���Դ
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}
		
		
	}
	
	public User find_user(int id) {//�����û������û������򷵻��û��������������û��ı�ź�������Ϊ10��������������Ϊ���ա���
		//���û�����û��������û���Ϊ"��",����û����С�飬������С����Ϊ���ա�
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_user  where u_Id = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setU_Id(id);
				user.setU_Nickname(resultSet.getString("u_nickname"));
				user.setU_Name(resultSet.getString("u_Name"));
				user.setU_Password(resultSet.getString("u_password"));;
				user.setU_Type(resultSet.getInt("u_Type"));
				user.getU_Group();
				if (user == null) {
					user.setU_Id(-10);
					user.setU_Nickname("��");
					user.setU_Name("��");
					user.setU_Password("��");;
					user.setU_Type(-10);
					user.setU_Group("��");
				}
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("��");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("��");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}

	

	public User find_user(String nickname) {//�����û������û������򷵻��û��������������û��ı�ź�������Ϊ10��������������Ϊ���ա���
		//���û�����û��������û���Ϊ"��",����û����С�飬������С����Ϊ���ա�
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_user where u_nickname = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, nickname);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setU_Id(resultSet.getInt("u_Id"));
				user.setU_Nickname(nickname);
				user.setU_Name(resultSet.getString("u_Name"));
				user.setU_Password(resultSet.getString("u_password"));
				user.setU_Type(resultSet.getInt("u_Type"));
				/*user.setU_Group(resultSet.getString("u_group"));*/
				user.setU_Group("��");
				if (user == null) {
					user.setU_Id(-10);
					user.setU_Nickname("��");
					user.setU_Name("��");
					user.setU_Password("��");;
					user.setU_Type(-10);
					user.setU_Group("��");
				}
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("��");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("��");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}


	public List<User> find_users() {//��ѯ�����û�����Ϣ//���û�����û��������û���Ϊ"��",����û����С�飬������С����Ϊ���ա�
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_user ";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setU_Id(resultSet.getInt("u_Id"));
				user.setU_Nickname(resultSet.getString("u_nickname"));
				user.setU_Name(resultSet.getString("u_Name"));
				user.setU_Password(resultSet.getString("u_password"));
				user.setU_Type(resultSet.getInt("u_Type"));
				/*user.setU_Group(resultSet.getString("u_group"));*/
				user.setU_Group("��");
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("��");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("��");
				}
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	public List<Integer> find_id(String group){//���ҳ�ͬһС��ĳ�Ա��id���
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_group  where user_group = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<Integer> user_ids = new ArrayList<Integer>();
		int user_id = -1;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, group);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user_id=resultSet.getInt("user_id");
			    user_ids.add(user_id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user_ids;
	}

@Override
public List<String> find_group(int user_id){//�����û�id�����û�������С��	
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_group  where user_id = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<String> user_groups = new ArrayList<String>();
		String group=null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, user_id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				group=resultSet.getString("user_group");
			   user_groups.add(group);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user_groups;
	}

 
    
	public List<User> find_group(String group) {//��ѯ����Ϊ��group��С���Ա//���û�����û��������û���Ϊ"��"
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_user ";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, group);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setU_Id(resultSet.getInt("u_Id"));
				user.setU_Nickname(resultSet.getString("u_nickname"));
				user.setU_Name(resultSet.getString("u_Name"));
				user.setU_Password(resultSet.getString("u_password"));;
				user.setU_Type(resultSet.getInt("u_Type"));
				user.getU_Group();
			
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("��");
				}
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	
	/*public void add_Operation(int u_id, String question, String CorrectResult, String Date, String Type, int Status) {
		
	}*/
	public void add_ErrorQuestion(ErrorQuestion errorQuestion) {//�����ݿ������Ӵ���
		//������Ӷ���
				Connection connection = DBUtil.getConnection();
			
				
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
				    String sql = "insert into p_errorquestion(u_Id,q_Question,q_RorrectResult,q_Date,q_Type) value (?,?,?,NOW(),?)";//�����ݿ����ʱ����Ϊϵͳ���ڵ�ʱ��
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1, errorQuestion.getU_Id());
					preparedStatement.setString(2,errorQuestion.getQ_Question() );
					preparedStatement.setString(3, errorQuestion.getQ_CorrectResult());
					preparedStatement.setInt(4, errorQuestion.getQ_Type());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//�ر���Դ
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				
		
	}

	@Override
	public void delete_ErrorQuestion(int id) {//ͨ�������id��ɾ������
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_errorquestion where  q_Id= ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
		
	}

	@Override
	public void add_operation(Operation operation) {
		Connection connection = DBUtil.getConnection();
		
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		    String sql = "insert into p_history(u_id,q_Question,q_RorrectResult,q_Date,q_Type,q_State,q_inputResult,h_id) value (?,?,?,NOW(),?,?,?,?)";//�����ݿ����ʱ����Ϊϵͳ���ڵ�ʱ��
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, operation.getU_Id());
			preparedStatement.setString(2,operation.getQ_Question() );
			preparedStatement.setString(3, operation.getQ_CorrectResult());
			preparedStatement.setInt(4, operation.getQ_Type());
			preparedStatement.setInt(5, operation.getQ_Status());
			preparedStatement.setString(6, operation.getQ_InputResult());
			preparedStatement.setInt(7, operation.getH_id());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//�ر���Դ
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void delete_Operation(int id) {//ͨ����Ŀ��id��ɾ����Ŀ
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_history where  q_id= ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}

	@Override
	public List<ErrorQuestion> find_ErrorQuestions(int U_id) {//��ѯͬһ���û������д���
		
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_errorquestion where u_Id=?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<ErrorQuestion> errorQuestions = new ArrayList<ErrorQuestion>();
		ErrorQuestion  errorQuestion= null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,U_id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				errorQuestion = new ErrorQuestion();
				errorQuestion.setQ_Id(resultSet.getInt("q_Id"));
				errorQuestion.setU_Id(resultSet.getInt("u_Id"));
				errorQuestion.setQ_Question(resultSet.getString("q_Question"));
				errorQuestion.setQ_CorrectResult(resultSet.getString("q_RorrectResult"));
				errorQuestion.setQ_Date(resultSet.getString("q_Date"));
				errorQuestion.setQ_Type(resultSet.getInt("q_Type"));
				errorQuestions.add(errorQuestion);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  errorQuestions;
	}
	public List<Operation> find_Operations(int U_id) {//��ѯͬһ���û���������Ŀ
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_history where u_id=?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<Operation> operations = new ArrayList<Operation>();
		Operation operation = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,U_id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				operation = new Operation();
				operation.setQ_id(resultSet.getInt("q_id"));
				operation.setU_Id(resultSet.getInt("u_Id"));
				operation.setQ_Question(resultSet.getString("q_Question"));
				operation.setQ_CorrectResult(resultSet.getString("q_RorrectResult"));
				operation.setQ_Date(resultSet.getString("q_Date"));
				operation.setQ_Type(resultSet.getInt("q_Type"));
				operation.setQ_Status(resultSet.getInt("q_State"));
				operation.setQ_InputResult(resultSet.getString("q_inputResult"));
				operations.add(operation);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return operations ;
	}

	
	
	
	
	
	public List<User> load(String content) {
		//������Ӷ���
		Connection connection=DBUtil.getConnection();
	    //׼��sql���
		String sql="select * from p_user ";
		//������䴫�����
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		List<User> users=new ArrayList<User>();
		User user=null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where u_Name like ? or u_Nickname like ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+ content +"%");//��ƥ�京content�е�n���ַ�  _Ϊƥ��һ����
				preparedStatement.setString(2, "%"+ content +"%");
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			 {
				 user=new User();
				 user.setU_Id(resultSet.getInt("u_Id"));
				 user.setU_Name(resultSet.getString("u_Name"));
				 user.setU_Password(resultSet.getString("u_password"));
				 user.setU_Nickname(resultSet.getString("u_nickname"));
				 user.setU_Type(resultSet.getInt("u_Type"));
				 /*user.setU_Group(resultSet.getString("u_Group"));*/
				 user.setU_Group("��");
			     users.add(user);
			 }
			
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			//�ر���Դ
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}
		return users;
	}



	
	public List<Homework> find_homework(int h_Id) {//��ѯͬһ���û���������ҵ
		
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_homework where h_Id=?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<Homework> homeworks = new ArrayList<Homework>();
		Homework  homework= null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,h_Id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				homework = new Homework();
				homework.setH_Id(resultSet.getInt("h_Id"));
				homework.setU_Id(resultSet.getInt("u_Id"));
				homework.setQ_Question(resultSet.getString("q_Question"));
				homework.setQ_RorrectResult(resultSet.getString("q_RorrectResult"));
				homework.setH_gruop(resultSet.getString("h_group"));
				homework.setQ_Date(resultSet.getString("q_Date"));
				homeworks.add(homework);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  homeworks;
	}



	
	public boolean add_homeWork(Homework Homework) {//����ҵ��������һ����ҵ��
		//������Ӷ���
				Connection connection = DBUtil.getConnection();
				//׼��sql���
				
				//������䴫�����
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
			    try {
					String sql = "insert into p_homework(h_Id,u_Id,q_Question,q_RorrectResult,q_Date,h_group) value (?,?,?,?,NOW(),?)";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1,Homework.getH_Id() );
					preparedStatement.setInt(2, Homework.getU_Id());
					preparedStatement.setString(3, Homework.getQ_Question());
					preparedStatement.setString(4, Homework.getQ_RorrectResult());
					preparedStatement.setString(5, Homework.getH_gruop());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//�ر���Դ
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return true;
	}



	public boolean add_group(User_Group user_group) {//����С��
		//������Ӷ���
		        boolean is=true;//��¼�Ƿ���ӳɹ�
				Connection connection = DBUtil.getConnection();
				//׼��sql���
				String sql = "select count(*) from p_group where user_group=? and user_id=?";//����С�������û�idΪ
				//������䴫�����
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,user_group.getUser_group());
					preparedStatement.setInt(2,user_group.getUser_id());
					//���ս����
					resultSet = preparedStatement.executeQuery();
					//���������
					if(resultSet.next()) {
						if (resultSet.getInt(1) > 0) {
							is=false;//���������д������������
						}
					}
					if(is==true) 
					{
						sql = "insert into p_group(user_id,user_group) value (?,?)";
						preparedStatement = connection.prepareStatement(sql);
						preparedStatement.setInt(1,user_group.getUser_id() );
						preparedStatement.setString(2, user_group.getUser_group());
						preparedStatement.executeUpdate();
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//�ر���Դ
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return is;
	}



	@Override
	public void delete_group(String group,int user_id) {//ɾ��С��
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_group where  user_group= ? and user_id=?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, group);
			preparedStatement.setInt(2, user_id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
}



	public void delete_user2(int user_id) {//ɾ��group�����user��Ϣ
		Connection connection = DBUtil.getConnection();
		String sql = "delete from p_group where user_id= ?";                                               
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, user_id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
}



	
	public List<Operation> find_Operations2(int h_id, int u_id) {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from p_history where h_id=? and u_id=?";
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		List<Operation> operations = new ArrayList<Operation>();
		Operation  operation= null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,h_id);
			preparedStatement.setInt(2,u_id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				operation = new Operation();
				operation = new Operation();
				operation.setQ_id(resultSet.getInt("q_id"));
				operation.setU_Id(resultSet.getInt("u_id"));
				operation.setQ_Question(resultSet.getString("q_Question"));
				operation.setQ_CorrectResult(resultSet.getString("q_RorrectResult"));
				operation.setQ_Date(resultSet.getString("q_Date"));
				operation.setQ_Type(resultSet.getInt("q_Type"));
				operation.setQ_Status(resultSet.getInt("q_State"));
				operation.setQ_InputResult(resultSet.getString("q_inputResult"));
				operation.setH_id(resultSet.getInt("h_id"));
				operations.add(operation);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return operations;
	}



	
	public User find_user2(String name) {//�û����������û�
		
				Connection connection = DBUtil.getConnection();
				//׼��sql���
				String sql = "select * from p_user where u_Name = ?";
				//������䴫�����
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				User user = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, name);
					resultSet = preparedStatement.executeQuery();
					while(resultSet.next()) {
						user = new User();
						user.setU_Id(resultSet.getInt("u_Id"));
						user.setU_Nickname(resultSet.getString("u_nickname"));
						user.setU_Name(name);
						user.setU_Password(resultSet.getString("u_password"));
						user.setU_Type(resultSet.getInt("u_Type"));
						/*user.setU_Group(resultSet.getString("u_group"));*/
						user.setU_Group("��");
						if (user == null) {
							user.setU_Id(-10);
							user.setU_Nickname("��");
							user.setU_Name("��");
							user.setU_Password("��");;
							user.setU_Type(-10);
							user.setU_Group("��");
						}
						if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
							user.setU_Name("��");
						}
						if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
							user.setU_Group("��");
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return  user;
	}



	@Override
	public List<Integer> find_h_id(String group) {
		 Connection connection = DBUtil.getConnection();
			
			String sql = "select * from p_homework where h_group=?";
		
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			List<Integer> h_ids = new ArrayList<Integer>();
			int h_id = -1;
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, group);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					h_id=resultSet.getInt("h_Id");
				    h_ids.add(h_id);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBUtil.close(resultSet);
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
			return  h_ids;
	}



	@Override
	public List<String> find_group() {
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from p_group";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<String> groups = new ArrayList<String>();
		String group=null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				group=resultSet.getString("user_group");
			    groups.add(group);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  groups;
	}


		public List<Integer> find_h_id() {
			
	        Connection connection = DBUtil.getConnection();
			
			String sql = "select * from p_homework";
		
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			List<Integer> h_ids = new ArrayList<Integer>();
			int h_id = -1;
			try {
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					h_id=resultSet.getInt("h_Id");
				    h_ids.add(h_id);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBUtil.close(resultSet);
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
			return  h_ids;
		}



		@Override
		public User find_user3(String name) {
			Connection connection = DBUtil.getConnection();
			//׼��sql���
			String sql = "select * from p_user where u_nickname = ?";
			//������䴫�����
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			User user = null;
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, name);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					user = new User();
					user.setU_Id(resultSet.getInt("u_Id"));
					user.setU_Nickname(name);
					user.setU_Name(resultSet.getString("u_Name"));
					user.setU_Password(resultSet.getString("u_password"));
					user.setU_Type(resultSet.getInt("u_Type"));
					/*user.setU_Group(resultSet.getString("u_group"));*/
					user.setU_Group("��");
					if (user == null) {
						user.setU_Id(-10);
						user.setU_Nickname("��");
						user.setU_Name("��");
						user.setU_Password("��");;
						user.setU_Type(-10);
						user.setU_Group("��");
					}
					if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
						user.setU_Name("��");
					}
					if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
						user.setU_Group("��");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(resultSet);
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
			return  user;
		}

		
}



