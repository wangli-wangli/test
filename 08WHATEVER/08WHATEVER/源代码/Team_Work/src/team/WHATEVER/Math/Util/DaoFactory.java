package team.WHATEVER.Math.Util;

import team.WHATEVER.Math.dao.UserDaoImpl;

public class DaoFactory {//½µµÍñîºÏÐÔ
		public static UserDaoImpl  getDaoImpl()
		{
			return new UserDaoImpl();
		}

	}
