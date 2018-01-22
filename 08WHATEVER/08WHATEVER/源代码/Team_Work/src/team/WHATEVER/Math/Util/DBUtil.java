package team.WHATEVER.Math.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	public  static  Connection getConnection() {
		
			//1 加载驱动
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			
			
		String user = "root";
		String password = "root";
		String url = "jdbc:mysql://localhost:3306/p_math";
		Connection connection = null;
		try {
			//2 创建链接对象connection
			 connection = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
		
			
			/*Connection con=null;
			String driver = "com.mysql.jdbc.Driver";
			String username = System.getenv("ACCESSKEY");
			String password = System.getenv("SECRETKEY");
			//System.getenv("MYSQL_HOST_S"); 为从库，只读
			String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
			try {
			    Class.forName(driver).newInstance();
			    con = DriverManager.getConnection(dbUrl, username, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return con;*/
			
			
			
	}
	
	//关闭资源的方法
	public static void close(Connection connection ) {
		try {
			if (connection != null) {
				connection.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
