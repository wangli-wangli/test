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

	//登录时填入昵称和密码
	public User login(String nickname, String password) {//用户密码不正确时，返回用户密码不正确，用户不存在返回“用户不存在”，用户昵称及密码正确，返回“ ”
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_user where u_nickname = ?";
		//创建语句传输对象
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
				throw new UserException("该用户不存在");
			}
			if (!user.getU_Password().equals(password)) {
				throw new UserException("密码不正确");
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


	
	//注册时填写真实姓名时调用
	public void add_user(String name, String password, String nickname, int Type,String group) {//注册时填写真实姓名时调用
		//获得链接对象
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "select count(*) from p_user where u_nickname = ?";
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,nickname);
					//接收结果集
					resultSet = preparedStatement.executeQuery();
					//遍历结果集
					while(resultSet.next()) {
						if (resultSet.getInt(1) > 0) {
							throw new UserException("用户已存在") ;
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
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
	}
	
	//
	public void add_user(String password, String nickname, int Type) {//注册时没填写真实姓名时调用
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from p_user where u_nickname = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,nickname);
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("用户已存在") ;
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
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
   }


	public void delete_user(String nickname) {//删除
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
	
	public void delete_user(int id) {//删除
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



	public void update_user(User user) {//更改
		//获得连接对象
				Connection connection=DBUtil.getConnection();
			    //准备sql语句
				/*String sql="update p_user set u_password=?,u_nickname=?,u_Name=?,u_Type=?,u_group=? where u_Id= ?";*/
				String sql="update p_user set u_password=?,u_nickname=?,u_Name=?,u_Type=? where u_Id= ?";
				//创建语句传输对象
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
					//关闭资源
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}
		
		
	}
	
	public User find_user(int id) {//查找用户，若用户存在则返回用户，若不存在则将用户的编号和类型设为10，其他属性设置为“空”，
		//若用户名还没填，则设置用户名为"空",若还没加入小组，则设置小组名为”空“
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_user  where u_Id = ?";
		//创建语句传输对象
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
					user.setU_Nickname("空");
					user.setU_Name("空");
					user.setU_Password("空");;
					user.setU_Type(-10);
					user.setU_Group("空");
				}
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("空");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("空");
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

	

	public User find_user(String nickname) {//查找用户，若用户存在则返回用户，若不存在则将用户的编号和类型设为10，其他属性设置为“空”，
		//若用户名还没填，则设置用户名为"空",若还没加入小组，则设置小组名为”空“
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_user where u_nickname = ?";
		//创建语句传输对象
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
				user.setU_Group("空");
				if (user == null) {
					user.setU_Id(-10);
					user.setU_Nickname("空");
					user.setU_Name("空");
					user.setU_Password("空");;
					user.setU_Type(-10);
					user.setU_Group("空");
				}
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("空");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("空");
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


	public List<User> find_users() {//查询所有用户的信息//若用户名还没填，则设置用户名为"空",若还没加入小组，则设置小组名为”空“
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_user ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
				user.setU_Group("空");
				if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
					user.setU_Name("空");
				}
				if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
					user.setU_Group("空");
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
	public List<Integer> find_id(String group){//查找出同一小组的成员的id编号
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_group  where user_group = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
public List<String> find_group(int user_id){//根据用户id查找用户的所有小组	
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_group  where user_id = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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

 
    
	public List<User> find_group(String group) {//查询组名为：group的小组成员//若用户名还没填，则设置用户名为"空"
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_user ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
					user.setU_Name("空");
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
	public void add_ErrorQuestion(ErrorQuestion errorQuestion) {//向数据库中增加错题
		//获得链接对象
				Connection connection = DBUtil.getConnection();
			
				
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
				    String sql = "insert into p_errorquestion(u_Id,q_Question,q_RorrectResult,q_Date,q_Type) value (?,?,?,NOW(),?)";//将数据库里的时间设为系统现在的时间
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
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				
		
	}

	@Override
	public void delete_ErrorQuestion(int id) {//通过错题的id来删除错题
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
		    String sql = "insert into p_history(u_id,q_Question,q_RorrectResult,q_Date,q_Type,q_State,q_inputResult,h_id) value (?,?,?,NOW(),?,?,?,?)";//将数据库里的时间设为系统现在的时间
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
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void delete_Operation(int id) {//通过题目的id来删除题目
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
	public List<ErrorQuestion> find_ErrorQuestions(int U_id) {//查询同一个用户的所有错题
		
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_errorquestion where u_Id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
	public List<Operation> find_Operations(int U_id) {//查询同一个用户的所有题目
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_history where u_id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
		//获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句
		String sql="select * from p_user ";
		//创建语句传输对象
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
				preparedStatement.setString(1, "%"+ content +"%");//可匹配含content中的n个字符  _为匹配一个。
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
				 user.setU_Group("空");
			     users.add(user);
			 }
			
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}
		return users;
	}



	
	public List<Homework> find_homework(int h_Id) {//查询同一个用户的所有作业
		
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from p_homework where h_Id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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



	
	public boolean add_homeWork(Homework Homework) {//向作业表中增加一道作业题
		//获得链接对象
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				
				//创建语句传输对象
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
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return true;
	}



	public boolean add_group(User_Group user_group) {//增加小组
		//获得链接对象
		        boolean is=true;//记录是否添加成功
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "select count(*) from p_group where user_group=? and user_id=?";//查找小组名和用户id为
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,user_group.getUser_group());
					preparedStatement.setInt(2,user_group.getUser_id());
					//接收结果集
					resultSet = preparedStatement.executeQuery();
					//遍历结果集
					if(resultSet.next()) {
						if (resultSet.getInt(1) > 0) {
							is=false;//若表中已有此数据则不能添加
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
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return is;
	}



	@Override
	public void delete_group(String group,int user_id) {//删除小组
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



	public void delete_user2(int user_id) {//删除group表里的user信息
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



	
	public User find_user2(String name) {//用户姓名查找用户
		
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "select * from p_user where u_Name = ?";
				//创建语句传输对象
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
						user.setU_Group("空");
						if (user == null) {
							user.setU_Id(-10);
							user.setU_Nickname("空");
							user.setU_Name("空");
							user.setU_Password("空");;
							user.setU_Type(-10);
							user.setU_Group("空");
						}
						if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
							user.setU_Name("空");
						}
						if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
							user.setU_Group("空");
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
		//准备sql语句
		String sql = "select * from p_group";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
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
			//准备sql语句
			String sql = "select * from p_user where u_nickname = ?";
			//创建语句传输对象
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
					user.setU_Group("空");
					if (user == null) {
						user.setU_Id(-10);
						user.setU_Nickname("空");
						user.setU_Name("空");
						user.setU_Password("空");;
						user.setU_Type(-10);
						user.setU_Group("空");
					}
					if (" ".equals(user.getU_Name())||user.getU_Name()==null) {
						user.setU_Name("空");
					}
					if (" ".equals(user.getU_Group())||user.getU_Group()==null) {
						user.setU_Group("空");
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



